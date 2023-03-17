#!/bin/bash

if pgrep -x "spotify" > /dev/null; then
  # Se o Spotify estiver em execução, focar na janela do Spotify
  i3-msg "[class=Spotify] focus"
else
  # Se o Spotify não estiver em execução, abri-lo
  exec spotify
fi
