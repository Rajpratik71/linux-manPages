XCONV(8)                                                                                            xinetd                                                                                           XCONV(8)



NAME
       xconv.pl - inetd.conf to xinetd.conf converter

SYNOPSIS
       xconv.pl can convert existing inetd.conf files (configuration for the inetd program) into xinetd.conf files (configuration for the xinetd program)

USAGE
       xconv.pl < /etc/inetd.conf > /etc/xinetd.conf

DESCRIPTION / PURPOSE
       xconv.pl is provided by the xinetd package to assist in the migration from inetd based systems to ones based on xinetd.

       Functionality is similar to the itox program, so reading itox(8) is recommended. An important note here is that xconv.pl does not support the -daemon_dir argument.

AUTHOR
       xconv was written by Rob Braun and xinetd was written by Panagiotis Tsirigotis.




3rd Berkeley Distribution                                                                        July 31 2002                                                                                        XCONV(8)
