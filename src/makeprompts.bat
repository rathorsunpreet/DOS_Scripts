@echo off
Rem Author: Sunpreet Singh Rathor
Rem Batch script to start multiple command prompts

Rem is /? is used, display help and exit
if [%1]==[/?] goto help

Rem check if command line argument is empty or zero
if %1% LEQ 0 goto zero

Rem Otherwise create prompts
echo Opening %1 prompts
for /l %%x in (1, 1, %1) do (
    start
)
goto end

:zero
echo Invalid command line argument!
goto end

:help
echo This batch file creates prompts.
echo User needs to specify the amount as an argument.
echo Usage:
echo	^makeprompts 10		Creates 10 prompts
echo	^makeprompts		Prints "Invalid command line argument!" and terminates
echo	^makeprompts 0		Prints "Invalid command line argument!" and terminates
echo	^makeprompts -2		Prints "Invalid command line argument!" and terminates
echo	^makeprompts abc	Prints "Invalid command line argument!" and terminates
goto end

:end
echo Exiting script!
