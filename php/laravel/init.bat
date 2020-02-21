@echo off

:start

rem "Executa os containers"
docker-compose up -d

echo.
echo PHP Frameworks
echo 1) Laravel
echo 2) Lumen
echo Cancelar
echo.

set /p option=Qual framework deseja instalar? 

if "%option%" equ "1" goto laravel
if "%option%" equ "2" goto lumen
if "%option%" equ "3" goto cancelar

echo.

:laravel
set framework=laravel
set framework_title=Laravel
goto installer

:lumen
set framework=lumen
set framework_title=Lumen
goto installer

:cancelar
exit

rem "Instala o framework selecionado"
:installer
echo Instalando o %framework_title%

rem "Instala o framework através do composer"
docker-compose exec app composer create-project --prefer-dist laravel/%framework% %framework%

rem "Faz uma cópia do framework na pasta raiz"
xcopy  /r /e %framework%\* .

rem "Remove a pasta vazia do framework"
rmdir /q /s %framework%
echo.
echo %framework_title% foi instalado!
exit