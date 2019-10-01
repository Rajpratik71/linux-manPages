SYSTOOL(1)                                                                                 General Commands Manual                                                                                 SYSTOOL(1)



NAME
       systool - view system device information by bus, class, and topology


SYNOPSIS
       systool [options [device]]


DESCRIPTION
       Calling systool without parameters will present all available bus types, device classes, and root devices.

       When device is supplied, the information requested by options is shown only for the specified device, otherwise all present devices are displayed.

       systool uses APIs provided by libsysfs to gather information.  systool runs only on Linux systems running kernels 2.5 or later, with the sysfs filesystem mounted.


OPTIONS
       -a     Show attributes of the requested resource

       -b bus Show information for a specific bus

       -c class
              Show information for a specific class

       -d     Show only devices

       -h     Show usage

       -m module_name
              Show information for a specific module

       -p     Show absolute sysfs path to the resource

       -v     Show all attributes with values

       -A attribute
              Show attribute value for the requested resource

       -D     Show only drivers

       -P     Show device's parent


SEE ALSO
       The web page of libsysfs at http://linux-diag.sourceforge.net/Sysfsutils.html


AUTHOR
       systool was written by Ananth Mavinakayanahalli <ananth@in.ibm.com> and Daniel Stekloff <dsteklof@us.ibm.com>.

       This man page was contributed by Martin Pitt <mpitt@debian.org> for the Debian GNU/Linux system (but may be used by others).



Martin Pitt                                                                                    October 12, 2003                                                                                    SYSTOOL(1)
