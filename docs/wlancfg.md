WLANCFG(8)                                                    System Manager's Manual                                                   WLANCFG(8)

NAME
       wlancfg - manupulate linux-wlan-ng MIB values

SYNOPSIS
       wlancfg query dev

       wlancfg show dev [all]

       wlancfg set dev

       wlancfg list

       wlancfg version

DESCRIPTION
       The  wlancfg utility program provides an alternative method to wlanctl-ng (1) , for manipulating MIB values.  It was designed to provide an
       easier mechanism for saving and restoring the complete wireless configuration (i.e. when re-starting the device driver) and  to  provide  a
       more efficient mechanism for GUI's to query multiple MIB's.

OPTIONS
       dev    The name of the device (e.g., wlan0).

       query  Read  MIB  names  (separated by whitespace) from stdin and output their values (separated by carriage returns) to stdout.  The MIB's
              may be either read/write or read-only.

       show   Query the values of all supported read/write MIB's and output their values (separated by carriage returns) to stdout. The syntax  of
              the output will be:
                name=value
              If the "all" parameter is specified, then all supported MIB's (i.e. read-only MIB's as well) are output.

       set    Read MIB name/value pairs (separated by carriage returns) from stdin and set the values of the specified MIB's.  The pairs must have
              the same syntax as above.  The MIB's must be read/write.

       list   Display a list of all supported MIB's.

       version
              Display the compiled version of wlancfg.

SEE ALSO
       /usr/share/doc/linux-wlan-ng/README and README.Debian.

AUTHOR
       This minimal man page was written by Joey Hess.

                                                                                                                                        WLANCFG(8)
