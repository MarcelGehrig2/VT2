#!/bin/bash

script="$(readlink -f $0)"
script_dir="$(dirname $script)"


echo rosnodes:; rosnode list; 
echo;
echo rostopics:; rostopic list;

