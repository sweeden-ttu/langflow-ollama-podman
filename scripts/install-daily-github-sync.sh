#!/bin/bash
# Copy the LaunchAgent plist to ~/Library/LaunchAgents and load it.
# Edit com.user.daily-github-sync.plist if your script path or log path differs.

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLIST_NAME="com.user.daily-github-sync.plist"
LAUNCH_AGENTS="$HOME/Library/LaunchAgents"
DEST="$LAUNCH_AGENTS/$PLIST_NAME"

mkdir -p "$LAUNCH_AGENTS"
cp "$SCRIPT_DIR/$PLIST_NAME" "$DEST"
launchctl load "$DEST"
echo "Installed and loaded $PLIST_NAME. Verify with: launchctl list | grep daily-github-sync"
