#!/bin/bash

#
# Copyright (с) 2022 Student of School 21:
# Yonn Argelia
#
# yonnarge@student.21-school.ru
#

function set_code_color() {
  code=0

  case "$1" in
    1) code=7 ;;
    2) code=1 ;;
    3) code=2 ;;
    4) code=4 ;;
    5) code=5 ;;
    6) code=0 ;;
    7) ;;
    8) ;;
    9) ;;
    10) ;;
    11) code=7 ;;
    12) code=1 ;;
    13) code=2 ;;
    14) code=4 ;;
    15) code=5 ;;
    16) code=0 ;;
  esac

  return $code
}

function print() {
  echo -e "${name_bg_color}${name_tx_color}HOSTNAME${default_color} = ${value_bg_color}${value_tx_color}$HOSTNAME${default_color}"
  echo -e "${name_bg_color}${name_tx_color}TIMEZONE${default_color} = ${value_bg_color}${value_tx_color}$TIMEZONE${default_color}"
  echo -e "${name_bg_color}${name_tx_color}USER${default_color} = ${value_bg_color}${value_tx_color}$USER${default_color}"
  echo -e "${name_bg_color}${name_tx_color}OS${default_color} = ${value_bg_color}${value_tx_color}$OS${default_color}"
  echo -e "${name_bg_color}${name_tx_color}DATE${default_color} = ${value_bg_color}${value_tx_color}$DATE${default_color}"
  echo -e "${name_bg_color}${name_tx_color}UPTIME${default_color} = ${value_bg_color}${value_tx_color}$UPTIME${default_color}"
  echo -e "${name_bg_color}${name_tx_color}UPTIME_SEC${default_color} = ${value_bg_color}${value_tx_color}$UPTIME_SEC${default_color}"
  echo -e "${name_bg_color}${name_tx_color}IP${default_color} = ${value_bg_color}${value_tx_color}$IP${default_color}"
  echo -e "${name_bg_color}${name_tx_color}NETMASK${default_color} = ${value_bg_color}${value_tx_color}$NETMASK${default_color}"
  echo -e "${name_bg_color}${name_tx_color}GATEWAY${default_color} = ${value_bg_color}${value_tx_color}$GATEWAY${default_color}"
  echo -e "${name_bg_color}${name_tx_color}RAM_TOTAL${default_color} = ${value_bg_color}${value_tx_color}$RAM_TOTAL${default_color}"
  echo -e "${name_bg_color}${name_tx_color}RAM_USED${default_color} = ${value_bg_color}${value_tx_color}$RAM_USED${default_color}"
  echo -e "${name_bg_color}${name_tx_color}RAM_FREE${default_color} = ${value_bg_color}${value_tx_color}$RAM_FREE${default_color}"
  echo -e "${name_bg_color}${name_tx_color}SPACE_ROOT${default_color} = ${value_bg_color}${value_tx_color}$SPACE_ROOT${default_color}"
  echo -e "${name_bg_color}${name_tx_color}SPACE_ROOT_USED${default_color} = ${value_bg_color}${value_tx_color}$SPACE_ROOT_USED${default_color}"
  echo -e "${name_bg_color}${name_tx_color}SPACE_ROOT_FREE${default_color} = ${value_bg_color}${value_tx_color}$SPACE_ROOT_FREE${default_color}"

  return 1
}
