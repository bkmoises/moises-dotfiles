#!/bin/bash

source ./functions.sh

loading "Definindo shell padrão"

FISH_PATH=$(which fish)

sudo chsh -s $FISH_PATH $USER
