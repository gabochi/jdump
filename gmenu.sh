#!/bin/bash

# Interactive dmenu glitching editor
# Arguments: INPUT_FILE

# Open glitch.jpg in your viewer and start playing around!

# Use v/b r/t o/p to decrease/increase parameters
# R randomize
# S save current glitch (filename given by parameters)
# E exit

IFILE="$1"

randomize(){
	# Randomization function

	VALUE=$((RANDOM&15))
	REPLACE=$((RANDOM&15))
	OCURR=$((RANDOM&15))
}

randomize

while true
do
	# Convert decimal parameters to hex for sed command
	HEX_VALUE="$(printf "%x" "$VALUE")"
	HEX_REPLACE="$(printf "%x" "$REPLACE")"

	# Run glitch with actual parameters
	./jdump.sh $IFILE ${HEX_VALUE} ${HEX_REPLACE} ${OCURR}
	
	# dmenu
	MENU=$(echo -e "v\nb ($HEX_VALUE) \nr\nt ($HEX_REPLACE) \no\np ($OCURR)\nRANDOM\nSAVE\nEXIT" | dmenu)
	
	case "${MENU:0:1}" in
		"v") ((VALUE=VALUE-1&15)) ;;
		"b") ((VALUE=VALUE+1&15)) ;;
		"r") ((REPLACE=REPLACE-1&15)) ;;
		"t") ((REPLACE=REPLACE+1&15)) ;;
		"o") ((OCURR=OCURR-1&15)) ;;
		"p") ((OCURR=OCURR+1&15)) ;;
		"R") randomize ;;
		"S") cp glitch.jpg ${HEX_VALUE}${HEX_REPLACE}_${OCURR}.jpg ;;
		"E") exit ;;

	esac

done





