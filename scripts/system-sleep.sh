#!/bin/bash

# use unmask to re-enable sleep (don't forget to remove lines in i3 config)
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
