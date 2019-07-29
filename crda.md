CRDA(8)                             Linux                             CRDA(8)

NAME
       crda - send to the kernel a wireless regulatory domain for a given ISO
       / IEC 3166 alpha2

SYNOPSIS
       crda

Description
       crda is the Linux wireless central regulatory domain agent.  crda is
       intended to be used by udev scripts and should not be run manually
       unless debugging udev scripts.  crda is triggered to run by the kernel
       by sending a udev event upon a new regulatory domain change. Regula‐
       tory domain changes are triggered by the wireless kernel subsystem
       (upon initialization and on reception of country IEs), wireless driv‐
       ers, or userspace (see iw ). Upon a regulatory domain change the ker‐
       nel sends a udev change event for the regulatory platform. The kernel
       ignores regulatory domains sent to it if it does not expect them. The
       regulatory domain is read by crda from the regulatory.bin file.

RSA Digital Signature
       If built with openssl or gcrypt support crda will have embedded into
       it an RSA digital signature which will prevent it from reading cor‐
       rupted or non-authored regulatory.bin files. Authorship is respected
       by the RSA public key packed into crda.  This specific crda package
       has been built with RSA public keys from John Linville (the Linux
       wireless kernel maintainer) and Seth Forshee (the wireless regulatory
       databse maintainer) and as such will only read regulatory.bin files
       signed by one of them. For further information see the regulatory.bin
       man page.

UDEV RULE
       A udev regulatory rule must be put in place in order to receive and
       parse udev events from the kernel in order to get udev to call crda
       with the passed ISO / IEC 3166 alpha2 country code.  An example udev
       rule which can be used (usually in /lib/udev/rules.d/85-regula‐
       tory.rules ):

       KERNEL=="regulatory*", ACTION=="change", SUBSYSTEM=="platform",
       RUN+="/sbin/crda"

Environment variable
       Set the COUNTRY environment variable with a specific ISO / IEC 3166
       alpha2 country code and then run crda without arguments. This will
       send a regulatory domain for that alpha2 to the kernel.

SEE ALSO
       iw(8) regulatory.bin(5)

       http://wireless.kernel.org/en/developers/Regulatory/

crda                           23 January 2009                        CRDA(8)
