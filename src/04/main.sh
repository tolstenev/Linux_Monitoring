#!/bin/bash

#
# Copyright (с) 2022 Student of School 21:
# Yonn Argelia
#
# yonnarge@student.21-school.ru
#

. ./colors.conf
. ./print.sh

color_codes="[1-6]{1}"
errmsg="Please run script with parameters from 1 to 6"


if ! [[ $column1_background =~ $color_codes ]] ; then
  column1_background=6
else
  if ! [[ $column1_font_color =~ $color_codes ]] ; then
    column1_font_color=1
  else
    if ! [[ $column2_background =~ $color_codes ]] ; then
      column2_background=6
    else
      if ! [[ $column2_font_color =~ $color_codes ]] ; then
        column2_font_color=1
      fi
    fi
  fi
fi

if [[ $column1_background == $column1_font_color ]] ||
   [[ $column2_background == $column2_font_color ]] ; then
  echo "First parameter can't be equal second and third can't be equal fourth, please edit .conf file"
else
  HOSTNAME=$(hostname)
  TIMEZONE="$(cat /etc/timezone) UTC $(date +%:::z)"
  USER=$USER
  OS=$(lsb_release -d | awk '{ for (i = 2; i <= NF; i++) {printf "%s ",$i} {printf "\n"}}')
  DATE=$(date "+%d %B %Y %H:%M:%S")
  UPTIME=$(uptime | awk '{print $3}' | tr -s ',' ' ')
  UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
  IP=$(ifconfig | awk '{if ($0 ~ /inet/) print $2}' | awk 'NR == 1')
  NETMASK=$(ifconfig | awk '{if ($0 ~ /netmask/) print $4}' | awk 'NR == 1')
  GATEWAY=$(route -n | awk '$1 ~ /0.0.0.0/' | awk '{print $2}')
  RAM_TOTAL=$(free | awk '/Mem:/ {printf "%.3f GB\n", $2/1024/1024}')
  RAM_USED=$(free | awk '/Mem:/ {printf "%.3f GB\n", $3/1024/1024}')
  RAM_FREE=$(free | awk '/Mem:/ {printf "%.3f GB\n", $4/1024/1024}')
  SPACE_ROOT=$(df / | awk '/\// {printf "%.2f MB\n", $2/1024}')
  SPACE_ROOT_USED=$(df / | awk '/\// {printf "%.2f MB\n", $3/1024}')
  SPACE_ROOT_FREE=$(df / | awk '/\// {printf "%.2f MB\n", $4/1024}')

  set_code_color $column1_background
  name_bg_color="\033[4$?m"
  set_code_color $column1_font_color
  name_tx_color="\033[3$?m"
  set_code_color $column2_background
  value_bg_color="\033[4$?m"
  set_code_color $column2_font_color
  value_tx_color="\033[3$?m"

  default_color="\033[0m"

  print

fi
