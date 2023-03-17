#!/bin/bash
#
if (cat /sys/class/drm/card0-HDMI-A-1/status | grep "disconnected"); then
  # Altera a configuração de vídeo para usar o Notebook
  pacmd set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo+input:analog-stereo
  xrandr --output HDMI1 --off
else 
  # Altera a configuração de vídeo para usar a TV
  # xrandr --output HDMI1 --mode 1920x1080 --primary
  xrandr --output HDMI1 --auto --primary

  # Altera a configuração de áudio para usar a TV
  pacmd set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo+input:analog-stereo
fi
