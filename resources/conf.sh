#!/bin/bash

source ./resources/functions.sh

info "Aplicando configurações do sistema..."

FISH_PATH=$(which fish)
sudo chsh -s $FISH_PATH $USER
