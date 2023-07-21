#!/bin/bash

#######################################################################################################################################
# Author: John Miller
# Date: July 20, 2023
# Description: An example script that detects the OS type (mac or linux), desktop envrionment (GNOME/Unity or KDE), and Ubuntu version.
#              This script also allows the execution of multple commands in a new terminal window. This is useful for cross platform 
#              that run at boot time.
#######################################################################################################################################



if [[ $OSTYPE == "linux-gnu" ]]; then
    version=$(lsb_release -rs)

    if [[ $version == "18.04" ]]; then
        echo "Ubuntu 18.04"

    elif [[ $version == "20.04" ]]; then
        echo "Ubuntu 20.04"

    elif [[ $version == "22.04" ]]; then
        echo "Ubuntu 22.04"

    else
        echo "Unknown Ubuntu version: $version"
    fi

    desktop_environment=${XDG_CURRENT_DESKTOP}
    if [[ $desktop_environment == *"GNOME"* || $desktop_environment == *"Unity"* ]]; then
        TERMINAL="gnome-terminal --"
        echo "Running GNOME"
    
    elif [[ $desktop_environment == *"KDE"* ]]; then
        CMD1="cd ~"
        CDM2="/path/to/python /path/to/main.py"
        TERMINAL=konsole --noclose -e /bin/bash --rcfile <(echo "$CMD1 && $CMD2")
        echo "Running KDE"
    
    else
        echo "Unknown desktop environment: ${desktop_environment}"
    fi

elif [[ $OSTYPE == "darwin"* ]]; then
    echo "OSX"

else
    echo "Unsupported OS: $OSTYPE"

fi
