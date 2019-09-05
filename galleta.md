GALLETA(1)                                          extract information from MSIE cookie files                                          GALLETA(1)

NAME
       galleta - tool to extract information from MSIE cookie files

SYNOPSIS
       galleta [-t] FILE

DESCRIPTION
       galleta is a tool to extract valuable information (from a forensics investigator point of view) from MSIE cookie files.

       It will extract the website name, the variables names and values.  The creation and expire time for these variables and also flags.

OPTIONS
       -t FD
           Change the default field delimiter (TAB) to FD.

       <file>
           Cookie file to parse.

AUTHOR
       This manual page was written by Christophe Monniez <christophe.monniez@fccu.be> for the Debian project (but may be used by others).

1.0+20040505                                                        2008-03-10                                                          GALLETA(1)
