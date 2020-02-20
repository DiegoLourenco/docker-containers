@echo off

:start

rem "Executa os containers"
docker-compose up -d

echo "PHP Frameworks"
echo "1) Laravel"
echo "2) Lumen"
echo "[31mCancelar[0m"
echo.

set /p option=Qual framework deseja instalar? 

if "%option%" equ "1" goto laravel
if "%option%" equ "2" goto lumen
if "%option%" equ "3" goto cancelar

echo.

:laravel
set framework="laravel"
set framework_title="Laravel"
goto installer

:lumen
set framework="laravel"
set framework_title="Laravel"
goto installer

:cancelar
exit

rem "Instala o framework selecionado"
:installer
echo "[32mInstalando o %framework_title%[0m"

rem "Instala o framework através do composer"
docker-compose exec app composer create-project --prefer-dist laravel/%framework% %framework%

rem "Faz uma cópia do framework na pasta raiz"
xcopy  /H %framework%\* .

rem "Remove a pasta vazia do framework"
rmdir /S %framework%
echo.
echo "[32m%framework_title% foi instalado![0m"
exit