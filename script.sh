#!/bin/bash

# Verifica o uso do disco da pasta /data/backup
USO_DISCO=$(df /data/backup | awk 'NR==2 {print $5}' | sed 's/%//')

# Só roda o script se o consumo estiver acima de 90%
if [ "$USO_DISCO" -ge 90 ]; then
    # Acessa a pasta /teste
    cd /teste || exit 1

    # Tenta apagar o arquivo teste5, se existir
    [ -f "teste5" ] && rm "teste5"

    # Tenta apagar o arquivo teste4, se existir
    [ -f "teste4" ] && rm "teste4"

    # Tenta apagar o arquivo teste3, se existir
    [ -f "teste3" ] && rm "teste3"
fi

#utilizar o comando crontab -e para agendar a execução conforme a sintaxe (0 23 * * * /caminho/para/seu_script.sh) onde o "0" é os minutos e o "23" a hora da execução
