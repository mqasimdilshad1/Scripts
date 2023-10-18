#!/bin/bash

path="."
tmp=false
output="pic.jpeg"
resolution="1920/1080"
url="https://picsum.photos/$resolution"

print_usage() {
    echo "Usage: $0 [ -p PATH | -t ] [ -o FILENAME ] [ -r RESOLUTION ]"
    echo "    -p to save the image to a specific path."
    echo "    -t to save the image in /tmp."
    echo "    -o to specify the output filename."
    echo "    -r to set a custom resolution for the image."
    echo "Example: $0 -p ~/Desktop -o my-wallpaper -r 1300/720"
    exit 1
}

while getopts ":p:tor:h" opt; do
    case $opt in
        p)
            path="$OPTARG"
            ;;
        t)
            tmp=true
            ;;
        o)
            output="$OPTARG"
            ;;
        r)
            resolution="$OPTARG"
            url="https://picsum.photos/$resolution"
            ;;
        h)
            print_usage
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            print_usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument."
            print_usage
            ;;
    esac
done

# for download path
if [ "$tmp" = true ]; then

    
    download_path="./tmp"
    # Ensure that the /tmp directory exists
    
    if [ ! -d "/tmp" ]; then
        mkdir -p /tmp
    fi
    cd $download_path
else
    download_path="$path/$output"
fi

wget -O pic.jpeg "$url"

if [ $? -eq 0 ]; then
    echo "Image downloaded and saved to: $download_path"
else
    echo "Failed to download the image."
fi

