@echo off

Rem Author: Sunpreet Singh Rathor
Rem Creates a listing of all sub-folders and files in the specified
Rem folder

Rem Variable listing here
set var2=listings.txt
set p0=%cd%\%var2%
set p1=C:\users\
set p2=C:\new_list.txt

Rem is /? is used, display help and exit
if [%1]==[/?] goto help

Rem check if command line argument is empty or zero
if "%~1"=="" goto zero

Rem check if second argument is zero, if so then
Rem use the current directory
if "%~2"=="" (
    echo "%2%" here!
    dir %1 /b /o:gn > %p0%
    echo File created!
    goto end
)

Rem Otherwise create the listing
dir %1 /b /o:gn > %2
echo File created!
goto end

:zero
echo Invalid command line argument!
goto end

:help
echo This batch file creates a listing of all sub-folders and files, by only 
echo presenting the names of each and writing it to the specified file.
echo Usage:
echo	^listings %p1% %p2%	Creates a listing of everything in %p1% and 
echo						writes that to %p2%
echo	listings				Prints "Invalid command line argument!" and terminates
echo[
echo Notes:
echo Use absolute paths and the dot (.) operator is not supported!

:end
echo Exiting script!