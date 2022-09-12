#!/bin/bash

#
# Copyright (с) 2022 Student of School 21:
# Yonn Argelia
#
# yonnarge@student.21-school.ru
#

arg=$1
reg="^[+-]?[[:digit:]]*(.[[:digit:]])*$"

if [ $# -ne 1 ] ; then
  echo "This script print one text parameter, please try again with parameter"
elif [[ $arg =~ $reg ]] ; then
  echo "Please enter text parameter and try again"
else
  echo $arg
fi
