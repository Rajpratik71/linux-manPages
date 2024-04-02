PMKSETUP(8)                                                 BSD System Manager's Manual                                                PMKSETUP(8)

NAME
     pmksetup — premake setup

SYNOPSIS
     pmksetup [-hVv] [-r variable] [-u variable=value]

DESCRIPTION
     The pmksetup utility is meant to create or update the pmk.conf(5) file in order to run the pmk(1) configuration tool.

     pmksetup reads all configuration information from the pmk.conf(5) file.

     The options are as follows:

     -h      Display the help menu.

     -r variable
             Remove the given variable from pmk.conf(5) if its value isn't static.  Data gathering is skipped by this option.

     -u variable=value
             Add or update existing variable from pmk.conf(5) if its value isn't static.  The value must have its double quotes escaped to pass
             through shell filter.  Data gathering is skipped by this option.

     -V      Verbose, display debugging messages.

     -v      Display the version number.

FILES
     /etc/pmk/pmk.conf  default pmk(1) configuration file

SEE ALSO
     make(1), pmk(1), pmkscan(1), pmk.conf(5), pmkfile(5)

AUTHORS
     Damien Couderc and Xavier Santolaria.

BSD                                                               April 03, 2003                                                               BSD
