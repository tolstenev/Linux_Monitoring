#!/bin/bash

#
# Copyright (с) 2022 Student of School 21:
# Yonn Argelia
#
# yonnarge@student.21-school.ru
#

function set_color_code() {
  code=0

  case "$1" in
    1) code=7 ;;
    2) code=1 ;;
    3) code=2 ;;
    4) code=4 ;;
    5) code=5 ;;
    6) code=0 ;;
  esac

  return $code
}

function print() {
  echo "${name_bg_color}${name_tx_color}HOSTNAME${default_color} = ${value_bg_color}${value_tx_color}$HOSTNAME${default_color}"
  echo "${name_bg_color}${name_tx_color}TIMEZONE${default_color} = ${value_bg_color}${value_tx_color}$TIMEZONE${default_color}"
  echo "${name_bg_color}${name_tx_color}USER${default_color} = ${value_bg_color}${value_tx_color}$USER${default_color}"
  echo "${name_bg_color}${name_tx_color}OS${default_color} = ${value_bg_color}${value_tx_color}$OS${default_color}"
  echo "${name_bg_color}${name_tx_color}DATE${default_color} = ${value_bg_color}${value_tx_color}$DATE${default_color}"
  echo "${name_bg_color}${name_tx_color}UPTIME${default_color} = ${value_bg_color}${value_tx_color}$UPTIME${default_color}"
  echo "${name_bg_color}${name_tx_color}UPTIME_SEC${default_color} = ${value_bg_color}${value_tx_color}$UPTIME_SEC${default_color}"
  echo "${name_bg_color}${name_tx_color}IP${default_color} = ${value_bg_color}${value_tx_color}$IP${default_color}"
  echo "${name_bg_color}${name_tx_color}NETMASK${default_color} = ${value_bg_color}${value_tx_color}$NETMASK${default_color}"
  echo "${name_bg_color}${name_tx_color}GATEWAY${default_color} = ${value_bg_color}${value_tx_color}$GATEWAY${default_color}"
  echo "${name_bg_color}${name_tx_color}RAM_TOTAL${default_color} = ${value_bg_color}${value_tx_color}$RAM_TOTAL${default_color}"
  echo "${name_bg_color}${name_tx_color}RAM_USED${default_color} = ${value_bg_color}${value_tx_color}$RAM_USED${default_color}"
  echo "${name_bg_color}${name_tx_color}RAM_FREE${default_color} = ${value_bg_color}${value_tx_color}$RAM_FREE${default_color}"
  echo "${name_bg_color}${name_tx_color}SPACE_ROOT${default_color} = ${value_bg_color}${value_tx_color}$SPACE_ROOT${default_color}"
  echo "${name_bg_color}${name_tx_color}SPACE_ROOT_USED${default_color} = ${value_bg_color}${value_tx_color}$SPACE_ROOT_USED${default_color}"
  echo "${name_bg_color}${name_tx_color}SPACE_ROOT_FREE${default_color} = ${value_bg_color}${value_tx_color}$SPACE_ROOT_FREE${default_color}"

  return 1
}

# Инициализация массива масок для конвертации постфикса
# в десятичный вид
  mask[0]=0.0.0.0
  mask[1]=128.0.0.0
  mask[2]=192.0.0.0
  mask[3]=224.0.0.0
  mask[4]=240.0.0.0
  mask[5]=248.0.0.0
  mask[6]=252.0.0.0
  mask[7]=254.0.0.0
  mask[8]=255.0.0.0
  mask[9]=255.128.0.0
  mask[10]=255.192.0.0
  mask[11]=255.224.0.0
  mask[12]=255.240.0.0
  mask[13]=255.248.0.0
  mask[14]=255.252.0.0
  mask[15]=255.254.0.0
  mask[16]=255.255.0.0
  mask[17]=255.255.128.0
  mask[18]=255.255.192.0
  mask[19]=255.255.224.0
  mask[20]=255.255.240.0
  mask[21]=255.255.248.0
  mask[22]=255.255.252.0
  mask[23]=255.255.254.0
  mask[24]=255.255.255.0
  mask[25]=255.255.255.128
  mask[26]=255.255.255.192
  mask[27]=255.255.255.224
  mask[28]=255.255.255.240
  mask[29]=255.255.255.248
  mask[30]=255.255.255.252
  mask[31]=255.255.255.254
  mask[32]=255.255.255.255
