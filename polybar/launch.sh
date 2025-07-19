#!/bin/bash

killall -q polybar

polybar left &
polybar right &
