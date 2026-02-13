#!/usr/bin/env bash

# Define filenames
SERVICE_FILE="flatpak-auto-update.service"
TIMER_FILE="flatpak-auto-update.timer"

# 3. Copy to system directory
sudo cp $SERVICE_FILE /etc/systemd/system/
sudo cp $TIMER_FILE /etc/systemd/system/

# 4. Set proper permissions
sudo chmod 644 /etc/systemd/system/$SERVICE_FILE
sudo chmod 644 /etc/systemd/system/$TIMER_FILE

# 5. Enable and start the timer
sudo systemctl daemon-reload
sudo systemctl enable --now $TIMER_FILE

# 6. Cleanup local temporary files
# echo "------------------------------------------------------"
# echo "Flatpak Auto-Update structure installed successfully."
# echo "Timer status:"
# systemctl status $TIMER_FILE --no-pager
# echo "------------------------------------------------------"