LOCALE-GEN(8)                           System Manager's Manual                          LOCALE-GEN(8)

NAME
       locale-gen — generates localisation files from templates

SYNOPSIS
       locale-gen

DESCRIPTION
       This manual page documents briefly the locale-gen command.

       By  default,  the locale package which provides the base support for localisation of libc-based
       programs does not contain usable localisation files for every supported language. This  limita‐
       tion has became necessary because of the substantial size of such files and the large number of
       languages supported by libc. As a result, Debian uses a special mechanism where we prepare  the
       actual localisation files on the target host and distribute only the templates for them.

       locale-gen  is a program that reads the file /etc/locale.gen and invokes localedef for the cho‐
       sen localisation profiles.  Run locale-gen after you have modified the /etc/locale.gen file.

FILES
       /etc/locale.gen

       The main configuration file, which has a simple format: every line that is not empty  and  does
       not begin with a # is treated as a locale definition that is to be built.

       /var/lib/locales/supported.d/

       A  directory  containing  locale.gen  snippets provided by language-pack packages.  Do not edit
       these manually, they will be overwritten on package upgrades.

SEE ALSO
       localedef(1), locale(1), locale.gen(5).

AUTHOR
       This manual page was written by Eduard Bloch <blade@debian.org> for the Debian GNU/Linux system
       (but may be used by others).  Permission is granted to copy, distribute and/or modify this doc‐
       ument under the terms of the GNU Free Documentation License, Version 1.1 or any  later  version
       published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts and
       no Back-Cover Texts.

                                                                                         LOCALE-GEN(8)
