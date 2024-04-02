VSTP(1)                                                                                  BrlAPI User's Manual                                                                                  VSTP(1)

NAME
       vstpg, vstpp - VisioBraille file transferring

SYNOPSIS
       vstpg [-ifbnd] [-s socketport] [-k keyname] [-o configname] file ...

DESCRIPTION
       vstpg (resp. vstpp) gets (resp. puts) files from (resp. onto) a VisioBraille terminal.

       For communicating with the terminal, you must launch brltty with the BrlNet driver, and telling BrlNet to use the VisioBraille driver.

       Before putting on the terminal, file names are truncated to 8 characters without any extension.

       Before getting from terminal, leading path and trailing extensions are removed, but put back for local filename.

COMMAND-LINE OPTIONS
       -i     ask for confirmation of transfer, for each file (on the terminal)

       -f     don't ask for such a confirmation (default)

       -b     if they exists, recursively rename the old files with an added .x suffix, just like logrotate does

       -n     do not keep such backup file (default)

       -s socketport
              use socketport as the port number instead of default for connecting to BrlNet

       -k filename
              use filename as key path instead of default for reading BrlNet's authentication key

       -d     use current directory rather than the download directory (see vbs_dir below)

       -o filename
              also read filename as config file

CONFIG FILE
       vstpg and vstpp read a configuration file $HOME/.vstprc which contains keywords or equalities, one per line (what follows a # is ignored).

       You can ask them to also read any other file thanks to the -o option.

       Here are keywords:

       backup make -b option the default

       nobackup
              make -f option the default

       and equalities:

       keyname = filename
              use this file instead of default, to find BrlNet's authentication key

       socketport = port
              use this port number, instead of default, to connect to BrlNet

       vbs_ext = .ext
              use .ext as an extension for downloaded files (.vis by default) this is overridden on command line if an extension is provided in the file name

       vbs_dir = path
              use path instead of current directory for putting files, except when using the -d option, or if the filename begins with '.'

RETURNED VALUE
       1    syntax error on command line
       2    connection with BrlNet error
       3    Unix file error
       4    Protocol error
       16   interrupted by user

SHELL EXPANSIONS
       Beware  of  special  chars: * and . are often expanded by your shell, hence vstpp * will probably do what you want, putting every file existing in the current directory onto the terminal, but
       vstpg * may not do what you want: it will only get every file which already exist in the current directory, skipping those you just created on your terminal !  If you want to get  every  file
       which exist in the terminal, you should use vstpg '*' or something similar (please read your shell manual).

       The  same  warning  applies  to  other  special chars, such as $, ~, &,... which should be protected by surrounding arguments by quotes (') or by using single backslashes (\) just before them
       (please read your shell manual).

BUGS
       The one we could find has been corrected :)

AUTHOR
       Samuel Thibault <samuel.thibault@ens-lyon.org> and Sebastien Hinderer <sebastien.hinderer@ens-lyon.fr>

BrlAPI                                                                                        2002-07-15                                                                                       VSTP(1)
