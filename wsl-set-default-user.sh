#!/bin/bash

# Verifica se o usuário foi informado
if [ -z "$1" ]
  then
    echo "Por favor, informe um usuário válido"
    exit 1
fi

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash "$1"
passwd "$1"
exit 0
