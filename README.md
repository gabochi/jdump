# JPG DUMP

## Description
Simple script for glitching jpeg files from the command line.

![](https://github.com/gabochi/jdump/blob/master/example.jpeg)

## Requirements
+ bash
+ sed
+ xxd
+ ffmpeg (optative)
+ convert (optative)

## Getting started
Copy the image you want to glitch into the jdump directory and run the following command:

$ `./jdump.sh YOUR_FILE.JPG`

By default, the script will set random parameters and save the result in a `glitch.jpg` file. 
If you're not pleased with the result or the file got corrupted, try again the same command as many times as you wish.

## Relevant information

There is an important line in the script output that looks like:

`+ sed s/a/3/9`

In this case, `a` `3` and `9` are the parameters. You can specify any other parameter when running the script.
If you like the result but would like to experiment with similar changes, try replacing one of the parameters:

$ `./jdump.sh YOUR_FILE.JPG a 4 9`

**The first two parameters must be hex digits (lowercase)**
**Try small numbers (1-15) for the third parameter, very small numbers can sometimes break the file**

You can also specify another glitch file name:

$ `./jdump.sh YOUR_FILE.JPG a 4 9 ANOTHER_GLITCH.JPG`

## How does it work
The script could be summarized like this:

`xxd -p ORIGINAL.JPG | sed s/VALUE/REPLACE/OCURR | xxd -r -p > GLITCH.JPG`

Plain hex dump of the original file wth *xxd* command. Replace the OCURR ocurrence of VALUE with REPLACE with *sed* and then perform a reverse hex dump to a new file.

### Corrupt files
You can see now why the *sed* arguments are so important, they look up and replace a nibble (4 bits). That's why the firsts ocurrences can break the file, they could be part of the header and contain critical information.

## Utils
Other useful scripts.

### GALLERY
Generates a randomized gallery of 256 glitches.

$ `./gallery.sh IMAGE.JPG`

Glitches are saved in a new directory and the names are formated like this: `[image_number]_[VALUE][REPLACE]_[OCURRENCE].jpg`

### MONTAGE
Composes a montage image from gallery.

$ `./montage.sh PATH [WIDTH]`

### VIDEO
Creates a video from gallery.

$ `./video.sh PATH [FRAMERATE]`
