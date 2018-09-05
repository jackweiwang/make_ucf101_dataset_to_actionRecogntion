#!/usr/bin/env bash

#############################################
# modify the UCF-101 data directory:
UCF101DIR=./temp
# and, make sure ffmpeg is installed
FFMPEGBIN=ffmpeg
#############################################

cd ${UCF101DIR}

for f in *.avi; do
  dir=${f::-4}
  dir2=${f::-12}

  echo -----
  echo Extracting frames from ${f} into ${dir}...

  if [[ ! -d ${dir2} ]]; then
    echo Creating directory=${dir2}
    mkdir  ${dir2}
  fi

  cd ${dir2}

  if [[ ! -d ${dir} ]]; then
    echo Creating directory=${dir}
    mkdir  ${dir}
  fi

  cd ..
 
  extractdir=${dir2}/${dir}

  ${FFMPEGBIN} \
    -i ${f} \
    ${extractdir}/image_%4d.jpg

done

echo -------------------------------------------
echo Done!
