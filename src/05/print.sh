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
function print_number_of_files {
  echo "Number of:"
  echo "Configuration files (with the .conf extension) = $(find $1 -type f -name "*.conf" | wc -l | awk '{print $1}')"
  echo "Text files = $(find $1 -type f -name "*.txt" | wc -l | awk '{print $1}')"
  echo "Executable files = $(find $1 -type f -executable | wc -l | awk '{print $1}')"
  echo "Log files (with the extension .log) = $(find $1 -type f -name "*.log" | wc -l | awk '{print $1}')"
  echo "Archive files = $(find $1 -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l | awk '{print $1}')"
  echo "Symbolic links = $(find $1 -type l | wc -l | awk '{print $1}')"
}
function print_top_ten_files {
  find $1 -type f -exec du -h {} + | sort -hr | head | awk '{ext=$NF; if (match(ext,/\/\./)) printf "%d - %s, %s\n", NR, $2, $1; else {sub(".*\\.", "", ext); printf "%d - %s, %s, %s\n", NR, $2, $1, ext}}'
}
function print_top_ten_exec_files {
  echo " "
}
