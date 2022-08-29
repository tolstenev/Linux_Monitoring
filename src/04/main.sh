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

if [[ -n $1 ]] ; then
  if [[ $1 =~ $color_codes ]] ; then
    colomn1_background=$1
    if [[ -n $2 ]] ; then
      if [[ $2 =~ $color_codes ]] ; then
        colomn1_font_color=$2
        if [[ -n $3 ]] ; then
          if [[ $3 =~ $color_codes ]] ; then
            colomn2_background=$3
            if [[ -n $4 ]] ; then
              if [[ $4 =~ $color_codes ]] ; then
                colomn2_font_color=$4
              fi
            fi
          fi
        fi
      fi
    fi
  fi
fi















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
    IP=$(ifconfig | awk '{if ($0 ~ /inet/) print $2}' | awk 'NR == 1')
    NETMASK=$(ifconfig | awk '{if ($0 ~ /netmask/) print $4}' | awk 'NR == 1')
    GATEWAY=$(route -n | awk '$1 ~ /0.0.0.0/' | awk '{print $2}')
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
