RIFIUTI(1)                                      extract information from MS recycle bin INFO2 files                                     RIFIUTI(1)

NAME
       rifiuti - tool to extract information from MS recycle bins info2 files.

SYNOPSIS
       rifiuti [-t] FILE

DESCRIPTION
       rifiuti is a tool to extract valuable information (from a forensics investigator point of view) from MS recycle bins info2 files.

       It will extract the deleted time, original drive number, original path ans size of the deleted files found in the recycle bin.

OPTIONS
       -t FD
           Change the default field delimiter (TAB) to FD.

       <file>
           INFO2 file to parse.

AUTHOR
       This manual page was written by Christophe Monniez <christophe.monniez@fccu.be> for the Debian project (but may be used by others).

20040505                                                            2008-03-14                                                          RIFIUTI(1)
