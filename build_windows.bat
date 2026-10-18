@echo off
setlocal
cd /d "%~dp0"
set "PY=py -3"
where py >nul 2>nul
if errorlevel 1 set "PY=python"
%PY% -c "import sys; assert sys.version_info >= (3,11); assert sys.maxsize > 2**32" >nul 2>nul
if errorlevel 1 goto fail
if not exist ".venv\Scripts\python.exe" %PY% -m venv .venv
if errorlevel 1 goto fail
.venv\Scripts\python.exe -m pip install -r requirements-build.txt
if errorlevel 1 goto fail
.venv\Scripts\python.exe -m unittest discover -s tests -v
if errorlevel 1 goto fail
.venv\Scripts\python.exe -m PyInstaller --noconfirm --clean FrameX.spec
if errorlevel 1 goto fail
.venv\Scripts\python.exe scripts\prepare_payload.py
if errorlevel 1 goto fail
set "NSIS="
where makensis >nul 2>nul
if not errorlevel 1 set "NSIS=makensis"
if exist "%ProgramFiles(x86)%\NSIS\makensis.exe" set "NSIS=%ProgramFiles(x86)%\NSIS\makensis.exe"
if exist "%ProgramFiles%\NSIS\makensis.exe" set "NSIS=%ProgramFiles%\NSIS\makensis.exe"
if not defined NSIS (
  echo NSIS 3.x is required to build the installer. Portable EXE is in dist\FrameX.
  goto fail
)
"%NSIS%" installer\FrameX.nsi
if errorlevel 1 goto fail
echo Installer ready: release\FrameX-3.0.0-Setup.exe
pause
exit /b 0
:fail
echo Build failed. Developer tools required: Python 3.11 x64, NSIS 3.x, Internet.
pause
exit /b 1
