#!/bin/bash

#
# Copyright (с) 2022 Student of School 21:
# Yonn Argelia
#
# yonnarge@student.21-school.ru
#

function print() {

  echo "HOSTNAME = $HOSTNAME"
  echo "TIMEZONE = $TIMEZONE"
  echo "USER = $USER"
  echo "OS = $OS"
  echo "DATE = $DATE"
  echo "UPTIME = $UPTIME"
  echo "UPTIME_SEC = $UPTIME_SEC"
  echo "IP = $IP"
  echo "NETMASK = $NETMASK"
  echo "GATEWAY = $GATEWAY"
  echo "RAM_TOTAL = $RAM_TOTAL"
  echo "RAM_USED = $RAM_USED"
  echo "RAM_FREE = $RAM_FREE"
  echo "SPACE_ROOT = $SPACE_ROOT"
  echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
  echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"

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
