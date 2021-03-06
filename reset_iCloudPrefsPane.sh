#!/usr/bin/env bash


# Exit upon failed command
# set -e

# Logs
logTime=$(date +%Y-%m-%d:%H:%M:%S)
resetLog="/tmp/pkg_install_$logTime.log"
exec &> >(tee -a "$resetLog")

# Current user
loggedInUser=$(ls -l /dev/console | cut -d " " -f 4)

# Remove iCloud PLISTs
# MobileMeAccounts.plist AKA iCloud Account PLIST
cd /Users/$loggedInUser/Library/Preferences/
if [ ! -f "MobileMeAccounts.plist" ]; then
    sudo mv MobileMeAccounts.plist MobileMeAccounts.plist.old
    echo "Removed MobileMeAccount.plist"
else
    echo "MobileMeAccount.plist not found."
    # exit
fi
# com.apple.iCloudHelper
cd /Users/$loggedInUser/Library/Caches/
if [ ! -f "MobileMeAccounts.plist" ]; then
    sudo mv com.apple.iCloudHelper com.apple.iCloudHelper.old
    echo "Removed com.apple.iCloudHelper"
else
    echo "com.apple.iCloudHelper not found."
    # exit
fi

# Reset NVRAM
if [ $? -ne 0 ]; then
    sudo /usr/sbin/nvram -c
    echo "Reset NVRAM successfully."
fi

# Reboot
if [ $? -ne 0 ]; then
    echo "Restarting now. Hit CTRL-C to cancel."
    sleep 5s
    sudo reboot
else
    echo "No changes were made. Reboot cancelled."
    exit
fi

exit 0
