@echo off
setlocal enabledelayedexpansion

rem Option 1: Organize files based on filename prefix
if "%1"=="1" (
    for %%f in (%2) do (
        set "filename=%%~nf"
        set "foldername=!filename:~0,-8!"
        if not exist "!foldername!" (
            mkdir "!foldername!"
        )
        move "%%f" "!foldername!"
    )
    exit /b 0
)

rem Option 2: Organize files matching the given pattern and their associated subtitle files
if "%1"=="2" (
    for %%f in (%2) do (
        set "basename=%%~nf"
        rem Example modification: Extract foldername correctly
        set "foldername=!basename:*mp4=!"
        if not exist "!foldername!" (
            mkdir "!foldername!"
        )
        move "%%f" "!foldername!"
        
        rem Example: Correct the loop for subtitle files (assuming .srt extension)
        for %%s in ("%%~dpnf*.srt") do (
            move "%%s" "!foldername!"
        )
    )
    exit /b 0
)

rem Function to display help message
:displayHelp
echo Usage: %0 [option] [pattern]
echo Options:
echo   1 [pattern]    Organize files based on filename prefix (e.g., *.txt)
echo   2 [pattern]    Organize files matching the given pattern and their associated subtitle files (e.g., *.mp4)
echo   -h, --help     Display this help message
exit /b 0

rem If an invalid option is provided
echo Error: Invalid option.
call :displayHelp
exit /b 1



