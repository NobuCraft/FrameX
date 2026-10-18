@echo off
setlocal
cd /d "%~dp0"
chcp 65001 >nul
set "PY=py -3"
where py >nul 2>nul
if errorlevel 1 set "PY=python"
%PY% -c "import sys; assert sys.version_info >= (3,10), 'Python 3.10+ required'; assert sys.maxsize > 2**32, 'Install 64-bit Python'" >nul 2>nul
if errorlevel 1 (
  echo Install Python 3.10+ x64 from https://www.python.org/downloads/windows/
  echo Enable Tcl/Tk and Add Python to PATH in the installer.
  pause
  exit /b 1
)
if not exist ".venv\Scripts\python.exe" (
  %PY% -m venv .venv
  if errorlevel 1 goto fail
)
set "INSTALL=0"
if not exist ".venv\requirements-installed.txt" set "INSTALL=1"
if exist ".venv\requirements-installed.txt" (
  fc /b requirements.txt .venv\requirements-installed.txt >nul 2>nul
  if errorlevel 1 set "INSTALL=1"
)
if "%INSTALL%"=="1" (
  .venv\Scripts\python.exe -m pip install -r requirements.txt
  if errorlevel 1 goto fail
  copy /y requirements.txt .venv\requirements-installed.txt >nul
)
.venv\Scripts\python.exe main.py %*
if errorlevel 1 goto fail
exit /b 0
:fail
echo.
echo Launch failed. Read the error above or settings folder crash.log.
pause
exit /b 1
