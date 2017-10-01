@echo off
echo.[1] custom mode [2] normal mode
choice /c 12
echo.Please DONT put nothing as an argument, it'll mean to delete the entire thing.
IF %ERRORLEVEL% == 1 goto custom:
IF %ERRORLEVEL% == 2 goto normal
echo. ERROR: Invalid choice
pause
exit

:normal
echo.Whish value do you wanna remove?
reg query "HKEY_CLASSES_ROOT\Directory\ContextMenus"
echo.
set /p value=
reg delete "HKEY_CLASSES_ROOT\Directory\ContextMenus\%value%"
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\01%value%"
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%value%"
reg delete "HKEY_CLASSES_ROOT\Directory\shell\01%value%"
reg delete "HKEY_CLASSES_ROOT\Directory\shell\%value%"
echo.
echo.all done!
pause
exit

:custom
echo.Whish value do you wanna remove?
reg query "HKEY_CLASSES_ROOT\Directory\ContextMenus"
echo.
set /p value=
reg delete "HKEY_CLASSES_ROOT\Directory\ContextMenus\%value%"
reg query "HKEY_CLASSES_ROOT\Directory\Background\shell"
echo.Whish one of these is meant to be removed with the value before?
echo.
set /p value=
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%value%"
reg query "HKEY_CLASSES_ROOT\Directory\shell"
echo.Whish one of these is meant to be removed with the value before?
echo.
set /p value=
reg delete "HKEY_CLASSES_ROOT\Directory\shell\%value%"
echo.
echo.all done!
pause
exit