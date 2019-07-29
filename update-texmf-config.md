UPDATE-TEXMF-CONFIG(8)                                        System Manager's Manual                                       UPDATE-TEXMF-CONFIG(8)

NAME
       update-texmf-config - script used in maintainer scripts to trigger tex-common actions

SYNOPSIS
       update-texmf-config [options]

DESCRIPTION
       This  manual  page  documents  briefly the update-texmf-config command.  This manual page was written for the Debian GNU/Linux distribution
       because the original script was designed for Debian packaging system.

       update-texmf-config is a shell script that is called from maintainer scripts shipping new map files, hyphenation patterns, or any other TeX
       input file.

       The  script simply activates the respective trigger, namely texmf-map for font map files, texmf-hyphen for hyphenation patterns, and texmf-
       format for format updates. All the necessary action will then be carried out by the tex-common package.

OPTIONS
       map    Activate the texmf-map trigger.

       hyphen Activate the texmf-hyphen trigger.

       format Activate the texmf-format trigger.

SEE ALSO
       Further information can be found in /usr/share/doc/tex-common/README.Debian.{txt,pdf.html}

AUTHOR
       This manual page was written by Norbert Preining <preining@logic.at>, for the Debian GNU/Linux system (but may be used by others).

                                                                                                                            UPDATE-TEXMF-CONFIG(8)
