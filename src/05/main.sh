#!/bin/bash
. ./print.sh

start_time=`date +%s`

if ! [[ -n $1 ]] ; then
  echo "Please run script with path to directory with '/' in the end"
else
  if ! [[ -d $1 ]] ; then
    echo "Directory not exist"
  else
    if ! [[ ${1: -1} = "/" ]] ; then
      echo "Path to directory should end with '/'"
    else

      echo "Script execution time (in seconds) = $(($(date +%s)-$start_time))"
    fi
  fi
fi