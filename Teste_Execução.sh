#!/bin/bash

echo Digite 0 para sair.
echo Digite 1 para verificar se o servidor HTTP está executando.
read num

if [ $num == 1 ]; then
        service apache2 status
        serv=$(service apache2 status | cut -b 15-17)
elif [ $num == 0 ]; then
    exit
fi

case $num in
    1)
    if [ "$serv" = "not" ]; then
        echo Servidor desconectado
        echo Digite 2 para iniciar o servidor
        read opcao1

        case $opcao1 in
                2)
                sudo service apache2 start
                exit
        esac

    elif [ "$serv" != "not" ]; then
          echo Servidor conectado
          echo Digite 3 para parar o servidor.
          read opcao2

        case $opcao2 in
                3)
                sudo service apache2 stop
                esac
    fi
esac
