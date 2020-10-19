#!/bin/bash

directory=$1
max_deep=$2
max_size=$3
number=$4


function get_random_name {
length=$((( RANDOM % 8 )  + 1 ))
retval=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $length | head -n 1)
}

function create_folder {
length=$((( RANDOM % 8 )  + 1 ))
name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $length | head -n 1)
mkdir $name
cd $name
}

function create_file {
length=$((( RANDOM % 8 )  + 1 ))
name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $length | head -n 1)
file_size=$((  RANDOM % $max_size ))
dd if=/dev/urandom of=$PWD/$name bs=1 count=$file_size
}


cd $directory
root=$PWD

for (( i=0; i<$number; i++ ))
do
cd $root
# Определяем тип - файл или папка
 type=$((RANDOM % 2))

# Определяем глубину вложенност
 deep=$(((RANDOM % $max_deep) + 1 ))

# В цикле погружаемся на требуемую глубину
for (( current_deep=1; current_deep<$deep; current_deep++ ))
do
# Количество папок в текущей дериктории
number_of_folder=$(ls -d */ | wc -w)
if [ $number_of_folder -eq 0 ] 
then
create_folder
else
# Создаём новую папку(0) или заходим в уже существующую(1)
action=$((RANDOM % 2)) 
if [ $action -eq 0 ] 
then
create_folder
else
folders=($(ls -d */))
folder_id= $((  RANDOM % ${#folders[*]} ))
cd ${folders[$folder_id]}

fi
fi
done
if [ $type -eq 0 ] 
then
create_file
fi

if [ $type -eq 1 ] 
then
create_folder
fi
done




