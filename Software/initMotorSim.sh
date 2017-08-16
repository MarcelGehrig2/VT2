#!/bin/bash

[[ $_ != $0 ]] && script_is_sourced=true || script_is_sourced=false
if [ $script_is_sourced ]; then
    SCRIPT_PATH=$BASH_SOURCE
else
    SCRIPT_PATH="$(readlink -f $0)"
fi
SCRIPT_DIR="$(dirname $SCRIPT_PATH)"
SCRIPT_NAME=$(basename $SCRIPT_PATH)


sudo apt-get install python-catkin-tools
sudo apt-get install ros-kinetic-gazebo-dev

pushd catkin_ws
git clone https://github.com/manuelilg/motor_sim
git clone https://github.com/manuelilg/gazebo_ros_joint_force
catkin init
catkin build
source devel/setup.bash
roslaunch motor_gazebo motor_gazebo_eeros.launch
