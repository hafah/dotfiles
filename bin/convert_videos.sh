#/bin/bash

# I sometimes record screencasts of me programming so I can critique my programming habits
# these screencasts through OBS studio are in flv and this script is to convert them to mp4


main() {
    go_to_folder
    convert_all
}

go_to_folder() {
    cd /mnt/c/Users/Carbon/Videos
}

convert_all() {
    for i in *.mkv
    do 
        ffmpeg -i "$i" -codec copy "${i%.*}.mp4"
    done
    for i in *.flv 
    do 
        ffmpeg -i "$i" -codec copy "${i%.*}.mp4"
    done
}

main
