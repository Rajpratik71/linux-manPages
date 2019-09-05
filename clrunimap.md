CLRUNIMAP(8)                                                                                        Linux                                                                                        CLRUNIMAP(8)



NAME
       clrunimap - Clear the current console unicode map


SYNOPSIS
       clrunimap


DESCRIPTION
       The command clrunimap clears the unicode map (also called "Screen Font Map") for the current console.


NOTES
       If  you  are not the maintainer of the kbd package, it is very unlikely that you want to use this command. On many kernels the result will be that your screen is black. On some kernels a reboot will
       be necessary.
       Use setfont -u to load a Unicode map for a console.

SEE ALSO
       setfont(8).



kbd                                                                                               2002-10-12                                                                                     CLRUNIMAP(8)
