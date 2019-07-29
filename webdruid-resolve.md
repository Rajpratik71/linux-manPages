webdruid(1)                                                        The WebDruid                                                        webdruid(1)

NAME
       webdruid - A web site log file analysis tool.

SYNOPSIS
       webdruid [ option ... ] [ log-file1 ] [ log-file2 ] ...

       webdruid-resolve [ option ... ] [ log-file1 ] [ log-file2 ] ...

DESCRIPTION
       The  WebDruid  is  a  web  site  log  file analysis program which produces usage statistics in HTML format for viewing with a browser.  The
       results are presented in both columnar and graphical format, which facilitates interpretation.  Yearly, monthly,  daily  and  hourly  usage
       statistics  are  presented, along with the ability to display usage by site, URL, referrer, user agent (browser), username, search strings,
       entry/exit pages,  and country (some information may not be available if not present in the log file being processed).

       The WebDruid supports CLF (common log format) log files, as well as Combined log formats as defined by NCSA and others, and  variations  of
       these which it attempts to handle intelligently.  In addition, the WebDruid also supports W3C formatted log files, allowing it to parse IIS
       log files.  Logs may also be compressed, via gzip.  If a compressed log file is detected, it will be automatically uncompressed while it is
       read.  Compressed logs must have the standard gzip extension of .gz.

       The  WebDruid, when used with the graphviz tools, can produce path graphs and users flow graphs. Path graph allows you to see the preferred
       path your users take when browsing on your web site. Users flow will draw lines between the urls, each line being balanced by the number of
       hits.  For more information see 'Using path & users flox graphs' in the README file.

       webdruid-resolve is normally just a symbolic link to webdruid.  When run as webdruid-resolve, only DNS file creation/updates are performed,
       and the program will exit once complete.  All normal options and configuration directives are available, however many will not be used.

       The WebDruid main documentation is located in the README file.  It contains instructions on operating with the software, as well as a  ref‐
       erence for all the /etc/webdruid/webdruid.conf config file directives, and command line options.

BUGS
       Report bugs to fabien@juliana-multimedia.com.

COPYRIGHT
       Copyright (C) 2003-2004 by Fabien Chevalier.

       Original Copyright (C) 1997-2000 by Bradford L. Barrett.

       Distributed under the GNU GPL.  See the files "COPYING" and "Copyright", supplied with all distributions for additional information.

AUTHOR
       Fabien Chevalier <fabien@juliana-multimedia.com>

Version 0.5.4                                                       22-Jun-2004                                                        webdruid(1)
