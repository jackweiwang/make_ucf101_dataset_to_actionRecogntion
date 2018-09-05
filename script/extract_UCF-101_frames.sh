#!/usr/bin/env bash

#############################################
# modify the UCF-101 data directory:
UCF101DIR=./temp
# and, make sure ffmpeg is installed
FFMPEGBIN=ffmpeg
#############################################

cd ${UCF101DIR}

for f in ./*/*.avi; do
  dir=${f::-4}
  subrdir=${f%/*}
  subldir=${subrdir#*/}
  dir2=${f::-12}
  dirr=${dir2##*/}
  echo -----
  echo Extracting frames from ${f} into ${dir}...

  if [[ ! -d ${dirr} ]]; then
    echo Creating directory=${dirr}
    mkdir  ${dirr}
  fi

  cd ${dirr}

  if [[ ! -d ${subldir} ]]; then
    echo Creating directory=${subldir}
    mkdir  ${subldir}
  fi

  cd ..
 
  extractdir=${dirr}/${subldir}

  ${FFMPEGBIN} \
    -i ${f} \
    ${extractdir}/image_%4d.jpg

  #cd ..
  #echo delete ${subldir}...

done

echo -------------------------------------------
echo Done!
