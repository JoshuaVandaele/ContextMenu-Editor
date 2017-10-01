::Made By TheJoshua974
@echo off
echo.Hello %username%
echo.Please avoid using spaces, you could break your registry value, try to only do spaces when it's for paths or file names
echo.What do you want the Menu to be called?
set /p MUIVerb=
echo.Where is the icon file? (USE TWO \ EXEMPLE: C:\Windows.ico BECOME C:\\Windows.ico)
set /p Icon=
echo.Where is the executable? (USE TWO \ EXEMPLE: C:\Windows BECOME C:\\Windows.exe)
set /p exec=
echo.What do you want it to be? [1] a Menu (Open %exec% plus Open %exec% Elevated) [2] one entry (Open %exec%)
choice /c 12
IF %ERRORLEVEL% == 1 goto one
IF %ERRORLEVEL% == 2 goto two
exit

:two
echo.Windows Registry Editor Version 5.00 > Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\shell\01Menu%MUIVerb%] >> Menu.reg
echo."MUIVerb"="Open %MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo."ExtendedSubCommandsKey"="Directory\\ContextMenus\\Menu%MUIVerb%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\background\shell\01Menu%MUIVerb%] >> Menu.reg
echo."MUIVerb"="Open %MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo."ExtendedSubCommandsKey"="Directory\\ContextMenus\\Menu%MUIVerb%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu%MUIVerb%\shell\%MUIVerb%_admin] >> Menu.reg
echo."MUIVerb"="Open %MUIVerb% Elevated" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="powershell.exe -Command Start-Process %exec% -Verb RunAs" >> Menu.reg
echo."HasLUAShield"="" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu%MUIVerb%\shell\%MUIVerb%] >> Menu.reg
echo."MUIVerb"="Open %MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="%exec%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu%MUIVerb%\shell\%MUIVerb%_admin\command] >> Menu.reg
echo."MUIVerb"="Open %MUIVerb% Elevated" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="powershell.exe -Command Start-Process %exec% -Verb RunAs" >> Menu.reg
echo."HasLUAShield"="" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu%MUIVerb%\shell\%MUIVerb%\command] >> Menu.reg
echo."MUIVerb"="Open %MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="%exec%" >> Menu.reg
goto done

:one
echo.Windows Registry Editor Version 5.00 > Menu.reg
echo.  >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\shell\%MUIVerb%]  >> Menu.reg
echo.@="" >> Menu.reg
echo."Extended"="" >> Menu.reg
echo."MUIVerb"="Open %MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\shell\%MUIVerb%\command] >> Menu.reg 
echo.@="%exec%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\Background\shell\%MUIVerb%] >> Menu.reg 
echo.@="" >> Menu.reg
echo."MUIVerb"="Open %MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\Background\shell\%MUIVerb%\command] >> Menu.reg 
echo.@="%exec%" >> Menu.reg
goto done

:done
echo Done!
echo Open the file "menu.reg" to apply changes!
echo if you wanna remove the context menu either use the given file or do it manually
echo to do it manually go to [HKEY_CLASSES_ROOT\Directory\shell] and remove 01Menu%MUIVerb%
echo then go to [HKEY_CLASSES_ROOT\Directory\ContextMenus] and remove Menu%MUIVerb%
echo finally go to [HKEY_CLASSES_ROOT\Directory\backround\shell] and remove Menu%MUIVerb%
echo and the menu will be removed!
pause