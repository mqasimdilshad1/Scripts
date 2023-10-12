#!/bin/bash

usage() {
    echo "Usage: $0 [ -i INTERVAL ]"
    echo "Options:"
    echo "  -i INTERVAL  Set the interval for the cron job in minutes (default: 60)"
    exit 1
}

INTERVAL=60
HOME_DIR="$HOME"

while getopts "i:h?" opt; do
    case "$opt" in
        i)
            INTERVAL="$OPTARG"
            ;;
        h|\?)
            usage
            ;;
    esac
done

cp wallpaper.sh "$HOME_DIR"

(crontab -l 2>/dev/null; echo "*/$INTERVAL * * * * $HOME_DIR/wallpaper.sh -t") | crontab - 

echo "Cron job set to run wallpaper.sh every $INTERVAL minutes."
