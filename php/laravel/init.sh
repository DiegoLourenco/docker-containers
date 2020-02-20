#!/bin/bash

# Executa os containers
docker-compose up -d

echo -e "\n\nPHP Frameworks"
echo "1) Laravel"
echo "2) Lumen"
echo -e "\e[1;31m3) Cancelar\n\e[0m"

while read -r -p "Qual framework deseja instalar? " option
do
    case $option in
        1)
            framework_title="Laravel"
            framework="laravel"
            break;
        ;;
        2)
            framework_title="Lumen"
            framework="lumen"
            break;
        ;;
        3)
            break;
        ;;
        *)
            echo -e "\e[1;31mOpção inválida!\nTente novamente\n \e[0m"
        ;;
    esac
done

# Verifica se um framework foi selecionado e depois o instala
if [ -n framework ]; then
    echo -e "\e[1;32mInstalando o $framework_title...\e[0m"
    
    # Instala o framework através do composer
    docker-compose exec app composer create-project --prefer-dist laravel/$framework $framework

    # Faz uma cópia o framework na pasta raiz
    cp -r ./$framework/. ./

    # Remove a pasta vazia do framework
    rm -rf $framework

    echo -e "\e[1;32m$framework_title foi instalado!\e[0m";
fi

echo -e "\nFinalizado...";