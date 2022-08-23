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
  echo "this script print one text parameter"
elif [[ $arg =~ $reg ]] ; then
  echo "please enter text parameter"
else
  echo $arg
fi
