#!/bin/bash

# JPEG DUMP
# Simple script for glitching jpeg images

# Check for mandatory parameter: INPUT FILE
[ -z $1 ] && echo -e "No input file provided. \n Usage: jdump.sh INPUT_FILE [VALUE [REPLACE [OCURRENCE [OUTPUT_FILE]]]]" && exit

# Set INPUT FILE
IFILE="$1"

# Preset parameters
# 	For random nibble values, convert from decimal to hex

[ -z $2 ] && VALUE="$(printf "%x" "$((RANDOM&15))")" || VALUE="$2"
[ -z $3 ] && REPLACE="$(printf "%x" "$((RANDOM&15))")" || REPLACE="$3"
[ -z $4 ] && OCURR=$((RANDOM%15+1)) || OCURR="$4"
[ -z $5 ] && OFILE="glitch.jpg" || OFILE="$5"

# 	Optional OUTPUT FILE name 
# OFILE="${VALUE}${REPLACE}${OCURR}.jpg"

# Debug mode on (so the parameters are visible)
set -x

# + xxd -p			Hex dump in plain mode
# + sed				Replace the $OCURR ocurrence of $VALUE with $REPLACE
# + xxd -r -p		Reverse dump 

xxd -p $IFILE | sed "s/$VALUE/$REPLACE/$OCURR" | xxd -r -p > $OFILE

