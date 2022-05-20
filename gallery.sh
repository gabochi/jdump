#!/bin/bash

# Glitch gallery automatization for extreme lazyness
# Creates 256 random glitches of a jpg image

# Arguments: INPUT_FILE

glitch(){
	# Endless loop, exits if the glitched image is not corrupted

	while true
	do
		# Glitch parameters randomization
		VALUE="$((RANDOM&15))"
		REPLACE="$((RANDOM&15))"
		OCURR="$((RANDOM%15+1))"	# Ocurrence cannot be zero
		
		# Decimal to hexadecimal convertion for sed processing of the plain dump
		HEX_VALUE=$(printf "%x" "$VALUE")
		HEX_REPLACE=$(printf "%x" "$REPLACE")
	
		# Output file name format
		OFILE="${1}/${2}_${HEX_VALUE}${HEX_REPLACE}_${OCURR}.jpg"

		# PERFORM THE GLITCH WITH THE ACTUAL PARAMETERS
		
		# Plain hex dump of the input file, replace nibble, write reverse dump to output file
		xxd -p $IFILE | sed s/$HEX_VALUE/$HEX_REPLACE/$OCURR | xxd -r -p > $OFILE

		# If output file is valid, exit function. Else, delete file and repeat process
		mogrify -format jpg $OFILE && return || rm $OFILE
	done
}

# INPUT_FILE, MANDATORY PARAMETER
IFILE="$1"

# Gallery directory name format
GLITCH_PATH="${1:0:3}_gallery"

# Creates a gallery directory
mkdir $GLITCH_PATH

# Make 256 glitched images
for i in {0..255}
do
	# Create a glitch image in the gallery directory
	glitch $GLITCH_PATH $i
done



