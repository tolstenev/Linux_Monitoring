#!/bin/bash

#
# Copyright (с) 2022 Student of School 21:
# Yonn Argelia
#
# yonnarge@student.21-school.ru
#

echo "HOSTNAME = $(hostname)"
echo "TIMEZONE = $(cat /etc/timezone) UTC $(date +%:::z)"
echo "USER = $USER"
echo "OS = $(cat /etc/issue)"
