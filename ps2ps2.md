#!/bin/sh  # "Distill" PostScript with the Ghostscript ’ps2write’
device # this generates a PDF‐style stream  with  an  attached  #
PostScript program to interpret it.

# This definition is changed on install to match the # executable
name set in the makefile GS_EXECUTABLE=gs

OPTIONS="‐P‐  ‐dSAFER"  while  true  do          case   "$1"   in
        ‐?*)   OPTIONS="$OPTIONS  $1"  ;;          *)   break  ;;
        esac         shift done

if [ $# ‐ne 2 ]; then         echo "Usage: ‘basename         echo
"  e.g. ‘basename         exit 1 fi

exec $GS_EXECUTABLE ‐q ‐sDEVICE=ps2write ‐sstdout=%stderr "‐sOut‐
putFile=$2" ‐dNOPAUSE ‐dBATCH $OPTIONS "$1"

