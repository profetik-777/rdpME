#!/bin/bash

# Clear terminal screen
clear

# ----- Welcome Screen -----
dialog --msgbox "Welcome to RDPme!\n\nThis is alpha software with no guarantee or warranty. It assumes you already have an endpoint configured for RDP access. Use at your own risk." 10 60

# ----- Get RDP Server IP -----
ip=$(dialog --inputbox "Enter the IP address or DNS name of the RDP server:" 8 40 3>&1 1>&2 2>&3)

# ----- Get Username -----
username=$(dialog --inputbox "Enter your username:" 8 40 3>&1 1>&2 2>&3)

# ----- Choose Window Size -----
window_size=$(dialog --menu "Choose your window size:" 15 50 4 \
    "1920x1200" "1920x1200" \
    "1600x900" "1600x900" \
    "1366x768" "1366x768" \
    "1280x720" "1280x720" 3>&1 1>&2 2>&3)

# Split the window size into width and height for xfreerdp options
width=$(echo "$window_size" | cut -d'x' -f1)
height=$(echo "$window_size" | cut -d'x' -f2)

# ----- Multi-monitor Setup -----
dialog --yesno "Does the endpoint support multiple monitors?" 8 40
if [ $? -eq 0 ]; then
    multimon_flag="/multimon"
    num_monitors=$(dialog --inputbox "Enter number of monitors (max 4):" 8 40 3>&1 1>&2 2>&3)
    if [ "$num_monitors" -gt 4 ]; then
        num_monitors=4
    fi
else
    multimon_flag=""
fi

# ----- Silent Advanced Options (Always applied) -----
advanced_opts="/dynamic-resolution /gfx:rfx /floatbar:sticky:off +fonts /bpp:32 +aero +window-drag /tune:FreeRDP_HiDefRemoteApp:true,FreeRDP_GfxAVC444v2:true,FreeRDP_GfxH264:true"

# ----- Offer Desktop Launcher Creation -----
dialog --yesno "Would you like to create a desktop launcher for this RDP session?\n\nThis will save the parameters so you can launch the session by double-clicking the shortcut." 10 60
if [ $? -eq 0 ]; then
    desktop_file="$HOME/Desktop/rdpme-launcher.desktop"
    cat > "$desktop_file" <<EOF
[Desktop Entry]
Name=RDPme Launcher
Comment=Launch RDP session to $ip
Exec=xfreerdp /v:$ip /u:$username /w:$width /h:$height $multimon_flag $advanced_opts
Icon=utilities-terminal
Terminal=true
Type=Application
EOF
    chmod +x "$desktop_file"
    dialog --msgbox "Desktop launcher created at:\n$desktop_file" 8 60
fi

# ----- Final Confirmation and Launch -----
dialog --yesno "Ready to launch the RDP session? (Press OK to start)" 8 40
if [ $? -eq 0 ]; then
    cmd="xfreerdp /v:$ip /u:$username /w:$width /h:$height $multimon_flag $advanced_opts"
    clear
    echo "Executing: $cmd"
    sleep 2
    eval "$cmd"
fi

# Clear the terminal after execution
clear
