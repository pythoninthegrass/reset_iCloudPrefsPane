# Reset iCloud Preferences Pane

## Issue
iCloud prefs pane will close when opened. Internet Accounts opens then closes before being able to edit any settings.

##Solution
This script removes [MobileMeAccounts.plist](http://apple.stackexchange.com/a/151623), [com.apple.iCloudHelper](https://discussions.apple.com/thread/7541765?start=0&tstart=0), and [clears NVRAM](https://www.jamf.com/jamf-nation/discussions/19085/disable-icloud-icloud-drive-and-find-my-mac-on-existing-systems#responseChild114035).
