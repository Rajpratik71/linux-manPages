WVDIALCONF(1)                                                 General Commands Manual                                                WVDIALCONF(1)

NAME
       wvdialconf - build a configuration file for wvdial(1)

SYNOPSIS
       wvdialconf /etc/wvdial.conf

DESCRIPTION
       wvdialconf detects your modem, its maximum baud rate, and a good initialization string and generates or updates the wvdial(1) configuration
       file based on this information.

       wvdialconf is completely non-interactive.  You still need to edit /etc/wvdial.conf to specify the phone number, login name, and password of
       your internet account in order for wvdial(1) to work.

       It  is  safe  to  run  wvdialconf  if a configuration file already exists.  In that case, only the Modem, Baud, Init, and Init2 options are
       changed in the [Dialer Defaults] section, and only if autodetection is successful.

BUGS
       We're willing to entertain the possibility.  Let us know if you have any problems by sending an e-mail to <wvdial-list@lists.nit.ca>.

DIAGNOSTICS
       An exit status of 0 means that a modem was detected and the configuration file was updated successfully.

       Any other value means that something went wrong and the configuration file was unchanged.

AUTHORS
       Dave Coombs and Avery Pennarun for Net Integration Technologies.

SEE ALSO
       wvdial(1), wvdial.conf(5).

                                                               December 2005" WvDial                                                 WVDIALCONF(1)
