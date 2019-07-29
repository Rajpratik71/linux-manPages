DEBPKG(1)                                                     General Commands Manual                                                    DEBPKG(1)

NAME
       debpkg - wrapper for dpkg

SYNOPSIS
       debpkg dpkg-options

DESCRIPTION
       debpkg simply invokes dpkg(1) but first becomes superuser so that dpkg is able to install and remove packages.  It also cleans the environ‐
       ment and resets PATH to a sane default: "/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/X11" so that local versions of  programs  are  not  run  by
       accident.

REQUIREMENTS
       debpkg  must  be given superuser privileges in some way to function properly.  Access to debpkg with those privileges is the same as having
       superuser access to your machine.  debpkg will abort if it finds that it neither being run by root nor setuid root.

       The devscripts package has been designed to allow debpkg to be made setuid root.  This works by using  a  compiled  wrapper  script,  which
       means that suidperl is not required.  See dpkg-statoverride(8) if you wish to make this program setuid root.  sudo or super could also con‐
       ceivably be used.

AUTHOR
       Christoph Lameter <clameter@debian.org>; minor modifications made by Julian Gilbey <jdg@debian.org>.

DEBIAN                                                           Debian Utilities                                                        DEBPKG(1)
