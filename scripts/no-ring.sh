#!/bin/sh
# 2025/09/28
# - lock screen using i3lock-color.
#    - currently does not completely remove the desktop when locking. will switch to betterlockscreen eventually

# colors
BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#ff00ffcc'
TEXT='#FFFFFFFF'
WRONG='#880000bb'
VERIFYING='#FFFFFFFF'
BLACK='00000000'

# command
i3lock \
-i $HOME/pfiles/images/wallpapers/full-moon-reflection.jpeg \
--insidever-color=$BLANK     \
--ringver-color=$BLANK   \
\
--insidewrong-color=$BLANK   \
--ringwrong-color=$BLANK     \
\
--inside-color=$BLANK        \
--ring-color=$BLANK        \
--line-color=$BLANK          \
--separator-color=$BLANK   \
\
--verif-color=$VERIFYING      \
--wrong-color=$BLANK          \
--time-color=$TEXT           \
--date-color=$BLANK           \
--layout-color=$BLANK         \
--keyhl-color=$BLANK         \
--bshl-color=$BLANK          \
\
--color $BLACK               \
--clock                      \
# --indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"       \
--keylayout 1                \

# --screen 1                   \
# --blur 5                     \
