#!/bin/bash

#
# Copyright (с) 2022 Student of School 21:
# Yonn Argelia
#
# yonnarge@student.21-school.ru
#

function question() {
  local answer
  local result=0

  echo
  read -p "Do you want to save this data to a file?  [Y/N] " answer

  if [ $answer = "Y" ] || [ $answer = "y" ] ; then
    result=1
  fi

  return $result
}
