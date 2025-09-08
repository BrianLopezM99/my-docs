@echo off
setlocal

rem Navegar al directorio docs
cd docs

echo Creando la estructura de MkDocs...

rem Creando carpetas y archivos
mkdir enumeration
type nul > enumeration\linux-enumeration.md
type nul > enumeration\windows-enumeration.md

mkdir "footprinting-and-scanning"
type nul > "footprinting-and-scanning\nmap.md"
type nul > "footprinting-and-scanning\nmap-scripting-engine.md"
type nul > "footprinting-and-scanning\server-message-block.md"

mkdir "operating-systems\linux"
type nul > "operating-systems\linux\privilege-escalation.md"
type nul > "operating-systems\linux\common-commands.md"

mkdir "operating-systems\windows\protocols"
type nul > "operating-systems\windows\protocols\server-message-block.md"
mkdir "operating-systems\windows\vulns"
type nul > "operating-systems\windows\vulns\privilege-escalation.md"
type nul > "operating-systems\windows\vulns\load-incognito.md"
type nul > "operating-systems\windows\vulns\selmporesionateprivilege-privilege.md"
type nul > "operating-systems\windows\cmd.md"
type nul > "operating-systems\windows\common-services.md"
type nul > "operating-systems\windows\important-proccess.md"

mkdir "transferring-files\linux"
type nul > "transferring-files\linux\transferring-files-to-linux.md"
mkdir "transferring-files\windows"
type nul > "transferring-files\windows\transferring-files-to-windows.md"

mkdir "upgrading-non-interactive-shells\linux"
type nul > "upgrading-non-interactive-shells\linux\upgrading-non-interactive-shell-linux.md"
mkdir "upgrading-non-interactive-shells\windows"
type nul > "upgrading-non-interactive-shells\windows\upgrading-non-interactive-shell-windows.md"

rem Creando archivos de nivel superior
type nul > windows.md
type nul > protocols.md
type nul > tips.md
type nul > tools.md

echo.
echo ¡Estructura de MkDocs creada exitosamente en la carpeta docs!
echo.
pause