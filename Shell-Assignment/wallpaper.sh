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
    echo "Example: $0 -p ~/Desktop -o my-wallpaper -r 1300x720"
    exit 1
}
convert_resolution() {
    local resolution= $1
    if [[ $resolution == *x* ]]; then
        echo $($resolution | tr x /)
    else
        echo $resolution
    fi
}

while getopts "p:t:o:r:h?" opt; do
    if [ $opt == "p" ]; then
        path="$OPTARG"
    elif [ $opt == "t" ]; then
        tmp=true
    elif [ $opt == "o" ]; then
        output=$OPTARG
    elif [ $opt == "r" ]; then
        resolution=$OPTARG
        resolution=$(convert_resolution $resolution)
        url= "https://picsum.photos/$resolution"

    elif [ $opt == "h" ] || [ $opt == "?" ]; then
        print_usage
    elif [ $opt == ":" ]; then
        echo "Option -$OPTARG requires an argument."
        print_usage
    fi
done


# for download path
if [ $tmp = true ]; then

    
    download_path="./tmp"
    # this will ensure that the /tmp directory exists
    
    if [ ! -d "/tmp" ]; then
        mkdir -p /tmp
    fi
    cd $download_path
else
    download_path= $path/$output
fi

wget -O pic.jpeg $url

if [ $? -eq 0 ]; then
    echo "Image downloaded and saved to: $download_path"
else
    echo "Failed to download the image."
fi

