MK_MODMAP(8)                                                                            System Manager's Manual                                                                           MK_MODMAP(8)

NAME
       mk_modmap - translate a Linux keytable file into an xmodmap file

SYNOPSIS
       mk_modmap [ -v ] keymap_file

DESCRIPTION
       The mk_modmap command tries to translate a Linux console keytable file into a file that can be parsed by xmodmap, and used within X.  It outputs the results to standard out.

       If the -v flag is used, verbose output is given.

       It requires the X header files to be installed.  (In Debian, these are in the "xlibs-dev" package).

NOTES
       Since XFree version 2.1, X initialises its keymap using the Linux keymap, so xmodmap will often be superfluous.

SEE ALSO
       dumpkeys(1), keymaps(5), xmodmap(1)

                                                                                              2002-02-22                                                                                  MK_MODMAP(8)
