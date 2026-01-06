@echo off
setlocal EnableDelayedExpansion

REM Kleurcodes: 30=Zwart, 31=Rood, 32=Groen, 33=Geel, 34=Blauw, 35=Magenta, 36=Cyaan, 37=Wit
REM Achtergrondkleuren: 40-47

::captures the ESC character (ASCII 27) into the variable ESC
::You then use %ESC% to emit ANSI sequences
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

:: Foreground: 30–37
:: Background: 40–47
for %%B in (40 41 42 43 44 45 46 47) do (
    for %%F in (30 31 32 33 34 35 36 37) do (
        echo|set /p=%ESC%[%%F;%%Bm [%%F;%%Bm hello world %ESC%[0m 
    )
    echo.
)

pause
