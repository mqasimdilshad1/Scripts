#!/bin/bash

usage() {
    echo "Usage: $0 [ -i INTERVAL ]"
    exit 1
}
interval=60
homeD=$HOME

while getopts "i:h?" opt; do
    case "$opt" in
        i)
            interval=$OPTARG
            ;;
        h|\?)
            usage
            ;;
    esac
done
cp wallpaper.sh $homeD

(crontab -l 2>/dev/null; echo "*/$interval * * * * $homeD/wallpaper.sh -t") | crontab - 
echo "Cron job set to run wallpaper.sh every $interval minutes."
