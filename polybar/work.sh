#!/bin/bash

THEME="sakura"

killall polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

THEME_DIR=$(dirname $0)/themes/$THEME/config.ini

polybar main -c $THEME_DIR &
polybar middle -c $THEME_DIR &
polybar right -c $THEME_DIR &
