#!/bin/sh if [ ‐z $DISPLAY ]; then
    sudo   ‐p       "  HP  Printer  Driver  Plug‐in  Installetion
‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐‐

This program will install the proprietary plug‐in for HP’s print‐
er  driver framework HPLIP into your system. This requires admin‐
istrator access. Please enter your password.  User: %u  Password:
"     hp‐plugin ‐i else
    if  python  ‐c  ’import PyQt4.QtGui’ 2>/dev/null && which hp‐
toolbox >/dev/null  2>/dev/null;  then          pkexec  env  DIS‐
PLAY=$DISPLAY XAUTHORITY=$XAUTHORITY hp‐plugin ‐u >/dev/null 2>&1
        exit 0
    else         pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHOR‐
ITY xterm ‐T ’HP Printer Driver Plug‐in Installation’ ‐sb ‐right‐
bar ‐hold ‐e hp‐plugin ‐i >/dev/null 2>&1 &         exit 0
    fi fi

