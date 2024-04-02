EUTP(1)                                                                                  BrlAPI User's Manual                                                                                  EUTP(1)

NAME
       eutp - EuroBraille file transferring

SYNOPSIS
       eutp

DESCRIPTION
       eutp lets you exchange files with a Clio terminal from EuroBraile.

COMMAND-LINE OPTIONS
       None so far

RETURNED VALUE
       1   error

SHELL EXPANSIONS
       Beware  of  special chars: * and . are often expanded by your shell, hence sending files * will probably do what you want, putting every file existing in the current directory onto the termi‐
       nal, but  receiving files * may not do what you want: it will only get every file which already exist in the current directory, skipping those you just created on your terminal !  If you want
       to get every file which exist in the terminal, you should use '*' or something similar (please read your shell manual).

       The  same  warning  applies  to  other  special chars, such as $, ~, &,... which should be protected by surrounding arguments by quotes (') or by using single backslashes (\) just before them
       (please read your shell manual).

AUTHOR
       Olivier Bert <olivier.bert@laposte.net>

BrlAPI                                                                                        2013-11-13                                                                                       EUTP(1)
