@echo off
setlocal enabledelayedexpansion

rem Loop through all the files in the current directory
for %%f in (*-git.ir.mp4) do (
    rem Extract the base name without the git.ir part
    set "basename=%%~nf"
    set "foldername=!basename:-git.ir=!"

    rem Check if the folder already exists, if not, create it
    if not exist "!foldername!" (
        mkdir "!foldername!"
    )

    rem Move the video file to the corresponding folder
    move "%%f" "!foldername!"

    rem Move the associated subtitle files to the corresponding folder
    for %%s in ("!foldername!-git.ir*.srt") do (
        move "%%s" "!foldername!"
    )
)

echo All files have been moved to their respective folders.
pause
