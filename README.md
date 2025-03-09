RDPme

RDPme is a simple TUI (Text User Interface) wrapper for launching Remote Desktop sessions using freerdp (and the xfreerdp command). It guides you through a series of dialogs to collect connection parameters (IP address, username, window size, and multi-monitor support) and then executes freerdp with your selections. Special thanks to Bill from Sudo Show with sharing his xfreerdp parameters passthrough! WARNING: This is alpha software. It is an experiment to see how far ai tools can increase the speed of prototyping ideas and releasing. Review the code yourself and use at your own risk! 

Features

    TUI Wizard: Uses dialog to collect user inputs in a step-by-step interface.
    Customizable Settings: Choose your RDP server IP, username, and window size.
    Multi-monitor Support: Optionally configure multi-monitor setups.
    Advanced Options: Automatically applies enhanced settings to improve performance.
    Desktop Launcher: Option to create a desktop shortcut so you can launch your RDP session with a double-click.

Prerequisites

Before using RDPme, ensure you have the following installed on your system:

    freerdp – for running the RDP session.
    dialog – for the text-based user interface.

Usage

    Make the Script Executable

    Save the script (e.g., rdpme.sh) and run:

chmod +x rdpme.sh

Run the Script

Execute the script by typing:

    ./rdpme.sh

    Follow the Wizard
        Welcome: A welcome message explains that this is alpha software with no guarantee or warranty.
        RDP Server: Enter the IP address or DNS name of your RDP server.
        Username: Provide your username for the remote session.
        Window Size: Choose from a list of common window sizes.
        Multi-monitor: Specify if multi-monitor support is needed.
        Launcher Creation: Optionally create a desktop launcher for easy future access.
        Launch: Confirm to start the RDP session using your specified settings.

Disclaimer

Again, RDPme is an alpha project provided as-is with no guarantee or warranty. It assumes your endpoint is properly configured for RDP access. Use at your own risk.
License

This project is released under the MIT License.
