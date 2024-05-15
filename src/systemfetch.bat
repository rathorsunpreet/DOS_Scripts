@echo off
Rem Author: Sunpreet Singh Rathor
Rem Batch script to display system info like neofetch

Rem Display username@hostname
for /f "tokens=* skip=1" %%i in (
  'wmic computersystem get username ^| findstr "."'
) do echo %%i

echo ------------------------------------
echo[


Rem Run systeminfo command, pipe the info to findstr then iterate over the output and print it
for /f "tokens=* delims=: " %%i in (
  'systeminfo ^|  findstr /B /C:"OS Name" /C:"System Boot Time" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory"'
) do echo %%i

Rem Run wmic command, iterate over it and print the result
for /f "tokens=* skip=1" %%i in (
  'wmic path win32_VideoController get name ^| findstr "."'
) do echo GPU:			   %%i

Rem Run wmic command, iterate over it and print the result
for /f "tokens=* skip=1" %%i in (
  'wmic cpu get name ^| findstr "."'
) do echo CPU:			   %%i

Rem Run wmic command, iterate over it
for /f "tokens=* skip=1" %%i in (
  'wmic diskdrive get size ^| findstr "."'
) do set dspace=%%i
Rem Truncating last digits and converting to human readable format
set kb=%dspace:~0,-6%
set mb=%kb:~0,-3%
set gb=%mb:~0,-3%
echo Total HDD Space:   	   %gb%GB

Rem Run wmic command and iterate over it
for /f "tokens=* skip=1" %%i in (
  'wmic path win32_VideoController get CurrentVerticalResolution ^| findstr "."'
) do set vres=%%i
Rem Run wmic command and iterate over it
for /f "tokens=* skip=1" %%i in (
  'wmic path win32_VideoController get CurrentHorizontalResolution ^| findstr "."'
) do set hres=%%i
Rem Remove all whitespace
set hres=%hres: =%
set vres=%vres: =%
echo Resolution: 		   %hres% x %vres%