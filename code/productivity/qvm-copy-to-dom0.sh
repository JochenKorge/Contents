#!/bin/bash
# qvm-copy-to-dom0
# Copy a file from an AppVM to dom0
# script has to be run in dom0
# qvm-copy-to-dom0 <AppVM> <Source in AppVM> <Destination in dom0>
# Initial author: https://github.com/one7two99/

# command line parameters
AppVM="$1"       # must be present
Source="$2"      # must be present
Destination="$3" # optionally

# if no Destination given on commandline use ~/QubesIncoming
if [ -z "$Destination" ];then mkdir -p -- "~/QubesIncoming" && \
                    Destination="~/QubesIncoming/$(basename "$Source")"; fi

# copy file from AppVM to dom0
qvm-run --pass-io $AppVM "cat -- \"$Source\"" > "$Destination"
