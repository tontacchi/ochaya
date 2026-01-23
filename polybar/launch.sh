#!/bin/bash

# variables
theme="sakura"
theme_dir=$(dirname $0)/themes/$theme/config.ini

# close all polybar instances
killall polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# launch 
polybar main -c $theme_dir &

