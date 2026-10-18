@echo off
setlocal
cd /d "%~dp0"
echo HUD display test: no ETW, no admin request, no fabricated FPS.
echo CPU and RAM should be visible on the desktop.
call run_windows.bat --overlay-test
