@echo off
setlocal enabledelayedexpansion

rem Loop through all the files in the current directory
for %%f in (*.*) do (
    rem Extract the file name without extension
    set "filename=%%~nf"
    rem Extract the common part of the filename
    set "foldername=!filename:~0,-8!"
    
    rem Check if the folder already exists, if not, create it
    if not exist "!foldername!" (
        mkdir "!foldername!"
    )
    
    rem Move the file to the corresponding folder
    move "%%f" "!foldername!"
)

echo All files have been moved to their respective folders.
pause
