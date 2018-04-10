#!/bin/sh
BLENDER=http://localhost:8080
#AUDIO=/insert/here/the/path/to/your/audio/file.ext
OUTPUT=/tmp/output.webm
eval `wget ${BLENDER}/info.txt -O - 2>/dev/null |
    while read key val ; do
      echo R_$key=$val  
    done`
i=$R_start
{
  while [ $i -le $R_end ] ; do
       wget ${BLENDER}/images/ppm/$i.ppm -O - 2>/dev/null
       i=$(($i+1))
  done
# set the number of threads manually.. actually it doesn't multi-thread the conversion if not set
# the CRF factor is suggested in the range 15-35. 15 for the highest quality
} | ffmpeg -vcodec ppm -f image2pipe -r $R_rate -i pipe:0 -vcodec libvpx-vp9 -crf 30 -b 0 -threads 4 $OUTPUT
# for audio addition uncomment the line below and set the AUDIO variable at the top
#} | ffmpeg -vcodec ppm -f image2pipe -r $R_rate -i pipe:0 -i $AUDIO -vcodec libvpx-vp9 -crf 30 -b 0 -acodec libopus -vbr on -threads 4 $OUTPUT
wget ${BLENDER}/close.txt -O - 2>/dev/null >/dev/null