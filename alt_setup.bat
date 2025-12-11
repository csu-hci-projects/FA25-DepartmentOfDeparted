@echo off
setlocal

rem Use the repository root (script location) as the base path.
set "REPO_ROOT=%~dp0"
set "RELEASE_DIR=%REPO_ROOT%release"
set "EXE_PATH=%RELEASE_DIR%\engine.exe"

if not exist "%RELEASE_DIR%" (
    mkdir "%RELEASE_DIR%"
    if errorlevel 1 (
        echo [alt_setup] Failed to create release directory "%RELEASE_DIR%".
        exit /b 1
    )
)

echo [alt_setup] Downloading engine.exe into "%EXE_PATH%"...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "try { Start-BitsTransfer -Source 'https://drive.google.com/uc?export=download&id=1v37eQhV6WfxdMeq9VlEErMVLVN8Ok5lf' -Destination '%EXE_PATH%'; exit 0 } catch { Write-Error 'Download failed'; exit 1 }"

if errorlevel 1 (
    echo [alt_setup] Download failed. Please re-run the script after checking the network.
    exit /b 1
)

echo [alt_setup] Download complete.
exit /b 0
