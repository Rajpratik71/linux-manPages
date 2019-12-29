DH_INSTALLGSETTINGS(1)                         Debhelper                        DH_INSTALLGSETTINGS(1)

NAME
       dh_installgsettings - install GSettings overrides and set dependencies

SYNOPSIS
       dh_installgsettings [debhelper options] [--priority=<number>]

DESCRIPTION
       dh_installgsettings is a debhelper program that is responsible for installing GSettings
       override files and generating appropriate dependencies on the GSettings backend.

       The dependency on the backend will be generated in ${misc:Depends}.

FILES
       debian/package.gsettings-override
           Installed into usr/share/glib-2.0/schemas/10_package.gschema.override in the package build
           directory, with "package" replaced by the package name.

           The format of the file is the following:

             [org.gnome.mypackage]
             boolean-setting=true
             string-setting='string'
             ...

OPTIONS
       --priority priority
           Use priority (which should be a 2-digit number) as the override priority instead of 10.
           Higher values than ten can be used by derived distributions (20), blend distributions (50),
           or site-specific packages (90).

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Laurent Bigonville <bigon@debian.org>, Josselin Mouette <joss@debian.org>

12.6.1ubuntu2                                 2019-09-17                        DH_INSTALLGSETTINGS(1)
