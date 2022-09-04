#!/bin/bash

#
# Copyright (с) 2022 Student of School 21:
# Yonn Argelia
#
# yonnarge@student.21-school.ru
#

. ./colors.conf
. ./print.sh

errmsg="Please set color code parameters in colors.conf from 1 to 6"

# Возвращает 1, если аргумент входит в диапазон от 1 до 6
function is_incorrect_code() {
    if [[ $1 -lt 1 ]] && [[ $1 -gt 6 ]] || ! [[ -n $1 ]] ; then
      return 0
    else
      return 1
    fi
}

# Четыре условия, которые в случае несоответствия заданных в colors.conf кодов
# заменяют их кодами по умолчанию (черный фон, белый шрифт)

if is_incorrect_code $column1_background ; then
  column1_background=16 ; fi

if is_incorrect_code $column1_font_color ; then
  column1_font_color=11 ; fi

if is_incorrect_code $column2_background ; then
  column2_background=16 ; fi

if is_incorrect_code $column2_font_color ; then
  column2_font_color=11 ; fi

# Проверка на одинаковые цвета шрифта и фона
if [[ $column1_background == $column1_font_color ]] ||
   [[ $column2_background == $column2_font_color ]] ; then
  echo "First parameter can't be equal second and third can't be equal fourth, please edit colors.conf"
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

  echo
  echo "Column 1 background = $(print_code_info $column1_background)"
  echo "Column 1 font color = $(print_code_info $column1_font_color)"
  echo "Column 2 background = $(print_code_info $column2_background)"
  echo "Column 2 font color = $(print_code_info $column2_font_color)"

fi

