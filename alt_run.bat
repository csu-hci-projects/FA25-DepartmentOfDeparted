@echo off
setlocal

rem Base paths relative to the script location.
set "REPO_ROOT=%~dp0"
set "EXE_PATH=%REPO_ROOT%release\engine.exe"

if not exist "%EXE_PATH%" (
    echo [alt_run] engine.exe not found at "%EXE_PATH%". Run alt_setup.bat first.
    exit /b 1
)

echo [alt_run] Launching engine from "%EXE_PATH%"...
start "" "%EXE_PATH%"

exit /b 0
