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

echo.Windows Registry Editor Version 5.00 > Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\shell\01Menu%MUIVerb%] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo."ExtendedSubCommandsKey"="Directory\\ContextMenus\\Menu%MUIVerb%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\background\shell\01Menu%MUIVerb%] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo."ExtendedSubCommandsKey"="Directory\\ContextMenus\\Menu%MUIVerb%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu%MUIVerb%\shell\%MUIVerb%_admin] >> Menu.reg
echo."MUIVerb"="%MUIVerb% Elevated" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="powershell.exe -Command Start_Process %exec% -Verb RunAs" >> Menu.reg
echo."HasLUAShield"="" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu%MUIVerb%\shell\%MUIVerb%] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="%exec%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu%MUIVerb%\shell\%MUIVerb%_admin\command] >> Menu.reg
echo."MUIVerb"="%MUIVerb% Elevated" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="powershell.exe -Command Start_Process %exec% -Verb RunAs" >> Menu.reg
echo."HasLUAShield"="" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu%MUIVerb%\shell\%MUIVerb%\command] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="%exec%" >> Menu.reg

echo Done!
echo if you wanna remove the context menu go to [HKEY_CLASSES_ROOT\Directory\shell] and remove 01Menu%MUIVerb%
echo then go to [HKEY_CLASSES_ROOT\Directory\ContextMenus] and remove Menu%MUIVerb%
echo and the menu will be removed!
pause