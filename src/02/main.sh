#!/bin/bash

#
# Copyright (с) 2022 Student of School 21:
# Yonn Argelia
#
# yonnarge@student.21-school.ru
#

. ./print.sh
. ./question.sh

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

print
question

if [[ $? -eq 1 ]] ; then
  current_date=$(date "+%d_%m_%y_%H_%M_%S")
  filename="$current_date.status"
  print >> $filename
  if [[ $? -eq 1 ]] ; then
    echo "Saved to $filename"
  fi
fi
