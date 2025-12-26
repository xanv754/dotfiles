#!/usr/bin/env bash

choice=$(printf "Apagar\nReiniciar\nSuspender\nHibernar\nSalir\n" | wofi --dmenu --prompt "Power")

case "$choice" in
  Apagar) systemctl poweroff ;;
  Reiniciar) systemctl reboot ;;
  Suspender) systemctl suspend ;;
  Hibernar) systemctl hibernate ;;
  Salir) hyprctl dispatch exit ;;
esac

