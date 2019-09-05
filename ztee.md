ZTEE(1)                                                                ztee                                                                ZTEE(1)

NAME
       ztee - output buffer and splitter

SYNOPSIS
       ztee [ OPTIONS... ] [ FILE... ]

DESCRIPTION
       ZTee  is  an output buffer and splitter for use with ZMap output data. ZTee should be used whenever ZMap is piped into an application scan‐
       ner, placed between ZMap and the application scanner. ZTee writes the transformed output to stdout, and writes the original output to FILE.

       See --help for examples.

OPTIONS
   BASIC OPTIONS
       -r, --raw
              Ignore input formatting and pass through raw input. This causes ztee to behavior identical to tee, except with buffering.

       -m, --monitor
              Print monitor output to stderr

       -u, --status-updates-file
              Write status updates (monitor data) to a file in CSV format

       -l, --log-file=name
              File to log to.

   ADDITIONAL OPTIONS
       -h, --help
              Display help

       -v, --version
              Display version

zmap v2.1.1                                                       September 2015                                                           ZTEE(1)
