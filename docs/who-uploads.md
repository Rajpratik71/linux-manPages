WHO-UPLOADS(1)                                                General Commands Manual                                               WHO-UPLOADS(1)

NAME
       who-uploads - identify the uploaders of Debian source packages

SYNOPSIS
       who-uploads [options] source_package ...

DESCRIPTION
       who-uploads  uses  the  Package Tracking System (PTS) to identify the uploaders of the three most recent versions of the given source pack‐
       ages.  Note that the uploaders are identified using their gpg(1) or gpg2(1) keys; installing a recent version of the debian-keyring package
       should provide most of the required keys.

       Note that because the PTS uses source packages, you must give the source package names, not the binary package names.

OPTIONS
       -M, --max-uploads=N
              Specify the maximum number of uploads to display for each package; the default is 3.  Note that you may not see this many uploads if
              there are not this many recorded in the PTS.

       --keyring keyring
              Add keyring to the list of keyrings to be searched for the uploader's GPG key.

       --no-default-keyrings
              By default, who-uploads uses the two Debian keyrings /usr/share/keyrings/debian-keyring.gpg and /usr/share/keyrings/debian-maintain‐
              ers.gpg  (although this default can be changed in the configuration file, see below).  Specifying this option means that the default
              keyrings will not be examined.  The --keyring option overrides this one.

       --date Show the date of the upload alongside the uploader's details

       --nodate, --no-date
              Do not show the date of the upload alongside the uploader's details.  This is the default behaviour.

       --no-conf, --noconf
              Do not read any configuration files.  This can only be used as the first option given on the command-line.

       --help, -h
              Display a help message and exit successfully.

       --version
              Display version and copyright information and exit successfully.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced in that order to set configuration variables.  Command  line
       options  can  be  used to override configuration file settings.  Environment variable settings are ignored for this purpose.  The currently
       recognised variables are:

       WHOUPLOADS_DATE
              Show the date of the upload alongside the uploader's details.  By default, this is "no".

       WHOUPLOADS_MAXUPLOADS
              The maximum number of uploads to display for each package.  By default, this is 3.

       WHOUPLOADS_KEYRINGS
              This  is  a  colon-separated  list  of  the  default  keyrings  to  be  used.   By  default,  it  is   the   two   Debian   keyrings
              /usr/share/keyrings/debian-keyring.gpg and /usr/share/keyrings/debian-maintainers.gpg.

AUTHOR
       The  original  version  of  who-uploads  was  written  by  Adeodato  Simó  <dato@net.com.org.es>.   The current version is by Julian Gilbey
       <jdg@debian.org>.

DEBIAN                                                           Debian Utilities                                                   WHO-UPLOADS(1)
