@echo off
setlocal enabledelayedexpansion



rem Option 1: Organize files based on filename prefix
if "%1"=="1" (
    echo Organizing files based on filename prefix...
    for %%f in (%2) do (
        echo Found file: %%f
        set "filename=%%~nf"
        set "foldername=!filename:~0,-8!"
        echo Processing file: %%f
        echo Folder name: !foldername!
        if not exist "!foldername!" (
            echo Creating folder: !foldername!
            mkdir "!foldername!"
        )
        echo Moving file %%f to folder !foldername!
        move "%%f" "!foldername!"
    )
    exit /b 0
)

rem Option 2: Organize files matching the given pattern and their associated subtitle files
if "%1"=="2" (
    echo Organizing files matching pattern and their associated subtitle files...
    for %%f in (%2) do (
        echo Found file: %%f
        set "basename=%%~nf"
        set "foldername=!basename!"
        echo Processing file: %%f
        echo Folder name: !foldername!
        if not exist "!foldername!" (
            echo Creating folder: !foldername!
            mkdir "!foldername!"
        )
        echo Moving file %%f to folder !foldername!
        move "%%f" "!foldername!"
        for %%s in ("%%~dpnf.srt") do (
            echo Moving subtitle file %%s to folder !foldername!
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
echo   2 [pattern]    Organize files matching the given pattern and their associated subtitle files (e.g., *-git.ir.mp4)
echo   -h, --help     Display this help message
exit /b 0

rem Debugging: Display provided arguments
echo Option: %1
echo Pattern: %2

rem Check if an option was provided
if "%1"=="" (
    call :displayHelp
    exit /b 1
)

rem Display help message if -h or --help is provided
if "%1"=="-h" (
    call :displayHelp
    exit /b 0
)
if "%1"=="--help" (
    call :displayHelp
    exit /b 0
)

rem Check if a pattern was provided for options 1 and 2
if "%2"=="" (
    echo Error: Pattern is required for options 1 and 2.
    call :displayHelp
    exit /b 1
)

rem If an invalid option is provided
echo Error: Invalid option.
call :displayHelp
exit /b 1
