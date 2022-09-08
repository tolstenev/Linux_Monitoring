#!/bin/bash

function print_count_folders {
  count=$(find ../ -type d | wc -l)
  echo "Total number of folders (including all nested ones) = $(( $count - 1 ))"
}
function print_top_five_folders {
  echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
  du -h $1 | sort -hr | sed -n 2,6p | awk 'BEGIN{i=1}{printf "%d - %s, %s\n", i, $2, $1; i++}'
}
function print_count_files {
  echo "Total number of files = $(ls -laR $1 | grep ^- | wc -l)"
}
function print_conf_files {
  echo " "
}
function print_top_ten_files {
  echo " "
}
function print_top_ten_exec_files {
  echo " "
}
