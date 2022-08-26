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
  echo "RAM_TOTAL = $RAM_TOTAL"
  echo "SPACE_ROOT = $SPACE_ROOT"
  echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
  echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"

  return 1
}
