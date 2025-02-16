@echo off
setlocal enabledelayedexpansion

set DEVICE=RMX3761
set VENDOR=realme
set ADB_PATH=D:\Projects\Realme_N53\platform-tools\adb.exe
set VENDOR_PATH=..\..\..\vendor\%VENDOR%\%DEVICE%

echo.
echo "Creating base directory structure..."
mkdir %VENDOR_PATH%\proprietary\system\app\realme 2>nul
mkdir %VENDOR_PATH%\proprietary\system\priv-app\realme 2>nul
mkdir %VENDOR_PATH%\proprietary\system\framework 2>nul
mkdir %VENDOR_PATH%\proprietary\system\lib64 2>nul
mkdir %VENDOR_PATH%\proprietary\system\etc\permissions 2>nul
mkdir %VENDOR_PATH%\proprietary\system_ext\app 2>nul
mkdir %VENDOR_PATH%\proprietary\system_ext\priv-app\realme 2>nul
mkdir %VENDOR_PATH%\proprietary\vendor\lib64\hw 2>nul
mkdir %VENDOR_PATH%\proprietary\vendor\etc 2>nul
mkdir %VENDOR_PATH%\proprietary\vendor\firmware 2>nul

echo.
echo "Extracting APKs and JARs..."
"%ADB_PATH%" shell pm list packages -f | findstr /i "realme" > temp_packages.txt
for /f "tokens=1,2 delims==" %%a in (temp_packages.txt) do (
    set "path=%%a"
    set "path=!path:package:=!"
    set "dest_path=!path!"
    set "dest_path=!dest_path:/system/=%VENDOR_PATH%\proprietary\system\!"
    set "dest_path=!dest_path:/system_ext/=%VENDOR_PATH%\proprietary\system_ext\!"
    set "dest_path=!dest_path:/=/\!"
    
    echo Pulling "!path!" to "!dest_path!"
    
    for %%i in ("!dest_path!") do (
        mkdir "%%~dpi" 2>nul
    )
    
    "%ADB_PATH%" pull "!path!" "!dest_path!"
)

echo.
echo "Extracting System Libraries..."
"%ADB_PATH%" shell "cmd package dump features" > features.txt

set "lib_path=%VENDOR_PATH%\proprietary\system\lib64"
mkdir "%lib_path%" 2>nul
"%ADB_PATH%" pull /system/lib64/libcamera_client.so "%lib_path%\"
"%ADB_PATH%" pull /system/lib64/libunisoc_audio.so "%lib_path%\"

set "vendor_lib_path=%VENDOR_PATH%\proprietary\vendor\lib64\hw"
mkdir "%vendor_lib_path%" 2>nul
"%ADB_PATH%" pull /vendor/lib64/hw/audio.primary.ums9230.so "%vendor_lib_path%\"
"%ADB_PATH%" pull /vendor/lib64/hw/gralloc.ums9230.so "%vendor_lib_path%\"

echo.
echo "Extracting Configuration Files..."
set "etc_path=%VENDOR_PATH%\proprietary\system\etc"
mkdir "%etc_path%" 2>nul
"%ADB_PATH%" pull /system/etc/audio_policy_configuration.xml "%etc_path%\"

set "perm_path=%VENDOR_PATH%\proprietary\system\etc\permissions"
mkdir "%perm_path%" 2>nul
"%ADB_PATH%" pull /system/etc/permissions/privapp-permissions-realme.xml "%perm_path%\"

set "vendor_etc_path=%VENDOR_PATH%\proprietary\vendor\etc"
mkdir "%vendor_etc_path%" 2>nul
"%ADB_PATH%" pull /vendor/etc/audio_policy_configuration.xml "%vendor_etc_path%\"

del temp_packages.txt
del features.txt

echo.
echo "Done!"
