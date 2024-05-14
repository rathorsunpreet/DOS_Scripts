@echo off

Rem Author: Sunpreet Singh Rathor
Rem Alias for copy con command

Rem is /? is used, display help and exit
if [%1]==[/?] goto help

Rem check if command line argument is empty or zero
if "%~1"=="" goto zero

copy con %1
goto end

:zero
echo Invalid command line argument!
goto end

:help
echo This batch file creates a new file and opens it up for editing.
echo Usage:
echo 	^editor filename.txt		 Create "filename.txt" and opens it up for editing
echo 	^editor				 Prints "Invalid command line argument!" and terminates
echo 	^editor existing_file.txt	 If file exists, opens it up for overwriting. Choice
echo						 is presented.
echo[
echo Notes:
echo Use CTRL+Z to exit the editor and press Enter to save the file.

:end
echo Exiting script!

