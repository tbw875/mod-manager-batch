@echo off
setlocal enabledelayedexpansion

:: Set your directories here
set "PAKS_DIR=%~dp0paks"
set "MODS_DIR=%~dp0mods"

:: Create mods directory if it doesn't exist
if not exist "%MODS_DIR%" mkdir "%MODS_DIR%"

:menu
cls
echo Mod Manager
echo ================
echo 1. Disable Mods (Move to mods folder)
echo 2. Enable Mods (Move to paks folder)
echo 3. Exit
echo.

set /p choice="Enter your choice (1-3): "

if "%choice%"=="1" (
    echo Moving mod files to mods folder...
    :: Loop through all .pak files
    for %%F in ("%PAKS_DIR%\*.pak") do (
        set "filename=%%~nxF"
        set "is_standard=false"
        
        :: Check if this is a standard pak file (pakchunk1-Windows.pak to pakchunk23-Windows.pak)
        for /l %%i in (1,1,23) do (
            if "!filename!"=="pakchunk%%i-Windows.pak" (
                set "is_standard=true"
            )
        )
        
        :: If not a standard file, move it to mods folder
        if "!is_standard!"=="false" (
            echo Moving !filename!...
            move "%%F" "%MODS_DIR%"
        )
    )
    echo Done!
    timeout /t 2 >nul
    goto menu
)

if "%choice%"=="2" (
    echo Moving mod files back to paks folder...
    for %%F in ("%MODS_DIR%\*.pak") do (
        echo Moving %%~nxF...
        move "%%F" "%PAKS_DIR%"
    )
    echo Done!
    timeout /t 2 >nul
    goto menu
)

if "%choice%"=="3" (
    echo Goodbye!
    timeout /t 2 >nul
    exit
)

echo Invalid choice! Please try again.
timeout /t 2 >nul
goto menu
