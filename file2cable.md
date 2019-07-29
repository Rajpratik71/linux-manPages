FILE2CABLE(1)                                                 General Commands Manual                                                FILE2CABLE(1)

NAME
       file2cable - sends a file as a raw ethernet frame

DESCRIPTION
       This  manual  page documents briefly the file2cable command.  This manual page was written for the Debian distribution because the original
       program does not have a manual page.

       This tool is perfect to find new vulnerabilities and test concepts. It sends out any binary file as Ethernet frame - AS IT IS. So make sure
       you know what you do. Hint: use xxd from the vim package to produce the binary file from hex dumps.

       Usage:

       -v verbose (hex dump to screen)

       -i <int> interface

       -f <file> the file you want to send

AUTHOR
       This manual page was written by Vince Mulhollon <vlm@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                  January 1, 2003                                                    FILE2CABLE(1)
