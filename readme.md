# NeatFolder

**NeatFolder** is a simple and efficient tool for organizing and sorting messy files. This project helps you keep your directories neat by automatically moving files to designated folders based on their file extensions (e.g., PDFs, videos, Word documents, etc).

## Features

- **Automatic Sorting**: Automatically moves files to specific folders based on file extension.
- **Easy Configuration**: Simple and customizable settings to define sorting rules.
- **Fast and Efficient**: Quickly sorts large numbers of files.

## Installation

To get started with NeatFolder, clone this repository:

```bash
git clone https://github.com/mohammad-taghinejad/NeatFolder
```

## Usage
1. Copy the script to your directory
2. Go to your directory
3. Open a terminal(CMD) here.
4. Execute the script
```bash
.\Organize.bat
Usage: Organize.bat [option] [pattern]
Options:
  1 [pattern]    Organize files based on filename prefix (e.g., *.txt)
  2 [pattern]    Organize files matching the given pattern and their associated subtitle files (e.g., *.mp4)
  -h, --help     Display this help message
```
Example:
```bash
.\Organize.bat 2 *.mp4
```
By executing this command, all the files that have the mp4 extension along with their subtitles will be placed in a separate directory of their own.

------------
Try it your self with `Test` directory.
please use CMD.
Not another terminals.


