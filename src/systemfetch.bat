@echo off
Rem Author: Sunpreet Singh Rathor
Rem Batch script to display system info like neofetch

Rem Display hostname\username
for /f "tokens=* skip=1" %%i in (
  'wmic computersystem get username ^| findstr "."'
) do echo %%i

echo ------------------------------------
echo[


Rem Display OS Name, System Boot Time, OS Version, System Architecture (Type) and Total Physical Memory
for /f "tokens=* delims=: " %%i in (
  'systeminfo ^|  findstr /B /C:"OS Name" /C:"System Boot Time" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory"'
) do echo %%i

Rem Display GPU Card Name
for /f "tokens=* skip=1" %%i in (
  'wmic path win32_VideoController get name ^| findstr "."'
) do echo GPU:			   %%i

Rem Display CPU Processor in use
for /f "tokens=* skip=1" %%i in (
  'wmic cpu get name ^| findstr "."'
) do echo CPU:			   %%i

Rem Display Total Disk Space in GB
for /f "tokens=* skip=1" %%i in (
  'wmic diskdrive get size ^| findstr "."'
) do set dspace=%%i
Rem Truncating last digits and converting to human readable format
set kb=%dspace:~0,-6%
set mb=%kb:~0,-3%
set gb=%mb:~0,-3%
echo Total HDD Space:   	   %gb%GB

Rem Get Vertical Resolution
for /f "tokens=* skip=1" %%i in (
  'wmic path win32_VideoController get CurrentVerticalResolution ^| findstr "."'
) do set vres=%%i
Rem Get Horizontal Resolution
for /f "tokens=* skip=1" %%i in (
  'wmic path win32_VideoController get CurrentHorizontalResolution ^| findstr "."'
) do set hres=%%i
Rem Remove all whitespace
set hres=%hres: =%
set vres=%vres: =%
Rem Display Horizontal x Vertical Resolution
echo Resolution: 		   %hres% x %vres%