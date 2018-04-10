# blender-vp9-frameserver
render video to VP9 via **ffmpeg** using the standard **frameserver** output of Blender.

This is a revision of the [original code](https://wiki.blender.org/index.php/Doc_talk:2.6/Manual/Render/Output/Frameserver) posted by zagaeski on the official wiki of blender.
I remade this to export in webm format and vp9 codec including the audio.

# HOW TO
## NO AUDIO
- copy the script or clone the repo
- set it executable with `chmod +x`
- _(optional)_ open the script and set the number of threads you want to use. follow the bottom comments
- open blender and set the output to **Frame Server**
- execute the script `./blender-vp9-frameserver.sh`

the output will be on the `/tmp` folder unless you set it opening the script and changing the OUTPUT line.

## WITH AUDIO
audio is not exported with this code. You need to export it before and then:

- uncomment **AUDIO** and insert the path to the file
- **comment** the ffmpeg line
- **uncomment** the next ffmpeg line
- execute the script as before