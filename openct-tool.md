openct-tool(1)                                                                                      OpenCT                                                                                     openct-tool(1)



NAME
       openct-tool - OpenCT smart card utility

SYNOPSIS
       openct-tool [options] command ...

OPTIONS
       -d     enable debugging; repeat to increase verbosity

       -f configfile
              specify config file (default @openct_conf_path@)

       -r reader
              specify index of reader to use

       -h     display this message

       -v     display version and exit

COMMANDS
       list   list all readers found

       atr    print ATR of card in selected reader

       wait   wait for card to be inserted

       rwait  wait for reader to be attached

       mf     try to select main folder of card

       read   dump memory of synchronous card



OpenCT 0.6.20                                                                                      May 2005                                                                                    openct-tool(1)
