NROFF(1)                   General Commands Manual                   NROFF(1)

NAME
       nroff - emulate nroff command with groff

SYNOPSIS
       nroff [-CchipStUvwW] [-dcs] [-Mdir] [-mname] [-nnum] [-olist] [-rcn]
             [-Tname] [file ...]
       nroff --help
       nroff -v | --version

DESCRIPTION
       The nroff script emulates the nroff command using groff.  Only  ascii,
       latin1,  utf8,  and cp1047 are devices accepted by nroff to select the
       output encoding emitted by grotty, groff's TTY output device.  If nei‐
       ther the GROFF_TYPESETTER environment variable nor the -T command line
       option (which overrides the environment variable) specifies a  (valid)
       device,  nroff  checks  the  current locale to select a default output
       device.  It first tries the locale program, then the environment vari‐
       ables LC_ALL, LC_CTYPE, and LANG, and finally the LESSCHARSET environ‐
       ment variable.

       The -h and -c options are equivalent to  grotty's  options  -h  (using
       tabs in the output) and -c (using the old output scheme instead of SGR
       escape sequences).  The -d, -C, -i, -M, -m, -n, -o,  -r,  -w,  and  -W
       options  have  the  effect  described in troff(1).  In addition, nroff
       silently ignores the options -e, -q, and -s (which are not implemented
       in  troff).   Options  -p (pic), -t (tbl), -S (safer), and -U (unsafe)
       are passed to groff.  -v and --version show the version number, --help
       prints a help message.

ENVIRONMENT
       GROFF_TYPESETTER
              The  default device for groff.  If not set (which is the normal
              case), it defaults to ‘ps’.

       GROFF_BIN_PATH
              A colon separated list of directories in which  to  search  for
              the  groff  executable  before  searching  in  PATH.  If unset,
              ‘/usr/bin’ is used.

NOTES
       This shell script is basically intended for use with  man(1).   nroff-
       style  character  definitions  (in  the  file  tty-char.tmac) are also
       loaded to emulate unrepresentable glyphs.

SEE ALSO
       groff(1), troff(1), grotty(1)

COPYING
       Copyright © 1989-2014 Free Software Foundation, Inc.

       Permission is granted to make and distribute verbatim copies  of  this
       manual  provided  the  copyright notice and this permission notice are
       preserved on all copies.

       Permission is granted to copy and distribute modified versions of this
       manual  under  the  conditions for verbatim copying, provided that the
       entire resulting derived work is distributed under the terms of a per‐
       mission notice identical to this one.

       Permission is granted to copy and distribute translations of this man‐
       ual into another language, under the  above  conditions  for  modified
       versions, except that this permission notice may be included in trans‐
       lations approved by the Free Software Foundation  instead  of  in  the
       original English.

Groff Version 1.22.3           10 February 2018                      NROFF(1)
