@echo off
setlocal EnableDelayedExpansion

::captures the ESC character (ASCII 27) into the variable ESC
::You then use %ESC% to emit ANSI sequences
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

REM Kleurcodes: 30=Zwart, 31=Rood, 32=Groen, 33=Geel, 34=Blauw, 35=Magenta, 36=Cyaan, 37=Wit
REM Achtergrondkleuren: 40-47
ECHO %ESC%[30;43m ANSI [{foreground};{background}m %ESC%[0m

::256-color mode (widely supported)
::ESC[38;2;R;G;B;m   → foreground
::ESC[48;2;R;G;B;m   → background
::ESC[38;5;<foreground>;48;5;<background>m
ECHO %ESC%[38;5;196;48;5;226m 256COLOR [38;5;{foreground};48;5;{background}m %ESC%[0m

::ESC[38;2;R;G;B;m   → foreground
::ESC[48;2;R;G;B;m   → background
ECHO %ESC%[38;2;0;0;0;48;2;255;180;0m TRUECOLOR_RGB [38;2;{Rfg};{Gfg};{Bfg};48;2;{Rbg};{Gbg};{Bbg}m %ESC%[0m

ECHO .
ECHO .
ECHO ANSI
ECHO .

:: Foreground: 30–37
:: Background: 40–47
for %%B in (40 41 42 43 44 45 46 47) do (
    for %%F in (30 31 32 33 34 35 36 37) do (
        echo|set /p=%ESC%[%%F;%%Bm [%%F;%%Bm hello world %ESC%[0m 
    )
    echo.
)

pause
