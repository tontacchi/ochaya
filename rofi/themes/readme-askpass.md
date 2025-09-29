# Greetings
A minimal graphical helper for `sudo`'s askpass by Siddharth Dushantha, 2020
Preview: https://0x0.st/iu4y.png

# Shell Script
The code goes in a location such as `~/bin/askpass-rofi`:
```
#!/usr/bin/env bash
rofi -dmenu\
         -password\
         -i\
         -no-fixed-num-lines\
         -p "Password:"\
         -theme ~/.config/rofi/themes/askpass.rasi
```

# Shell Profile
Modify the `SUDO_ASKPASS` global variable your Posix shell profile of choice:
```
SUDO_ASKPASS=~/bin/askpass-rofi
```

