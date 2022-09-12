#!/bin/bash

#
# Copyright (с) 2022 Student of School 21:
# Yonn Argelia
#
# yonnarge@student.21-school.ru
#

. ./print.sh

color_codes="[1-6]{1}"

if [ $# -ne 4 ] ; then
  echo "Please run script with four different parameters from 1 to 6"

else
  if [[ $1 =~ $color_codes ]] &&
     [[ $2 =~ $color_codes ]] &&
     [[ $3 =~ $color_codes ]] &&
     [[ $4 =~ $color_codes ]] ; then

    if [[ $1 == $2 ]] || [[ $3 == $4 ]] ; then
      echo "First parameter can't be equal second and third can't be equal fourth, please try again"
    else
      HOSTNAME=$(hostname)
      TIMEZONE="$(cat /etc/timezone) UTC $(date +%:::z)"
      USER=$USER
      OS=$(lsb_release -d | awk '{ for (i = 2; i <= NF; i++) {printf "%s ",$i} {printf "\n"}}')
      DATE=$(date "+%d %B %Y %H:%M:%S")
      UPTIME=$(uptime | awk '{print $3}' | tr -s ',' ' ')
      UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
      IP=$(ip -4 a | awk '{if ($0 ~ /inet/) {if ($2 !~ /^127/) {print $2; exit;}}}')
      postfix=$(ip -4 a | awk '{if ($0 ~ /inet/) {if ($2 !~ /^127/) {sub(/[0-9.]*\//, "", $2); print $2; exit}}}')
      NETMASK=${mask[$postfix]}
      GATEWAY=$(ip route | awk '{if ($1 ~ /default/) {print $3; exit}}')
      RAM_TOTAL=$(free | awk '/Mem:/ {printf "%.3f GB\n", $2/1024/1024}')
      RAM_USED=$(free | awk '/Mem:/ {printf "%.3f GB\n", $3/1024/1024}')
      RAM_FREE=$(free | awk '/Mem:/ {printf "%.3f GB\n", $4/1024/1024}')
      SPACE_ROOT=$(df / | awk '/\// {printf "%.2f MB\n", $2/1024}')
      SPACE_ROOT_USED=$(df / | awk '/\// {printf "%.2f MB\n", $3/1024}')
      SPACE_ROOT_FREE=$(df / | awk '/\// {printf "%.2f MB\n", $4/1024}')

      set_code_color $1
      name_bg_color="\033[4$?m"
      set_code_color $2
      name_tx_color="\033[3$?m"
      set_code_color $3
      value_bg_color="\033[4$?m"
      set_code_color $4
      value_tx_color="\033[3$?m"

      default_color="\033[0m"

      print

    fi
  else
    echo "Please use different parameters from 1 to 6"
  fi
fi
