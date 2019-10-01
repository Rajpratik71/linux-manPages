texconfig(1)                                                                                       TeX Live                                                                                      texconfig(1)



NAME
       texconfig - configures teTeX or TeX Live

       texconfig-sys - configures teTeX or TeX Live system-wide

SYNOPSIS
       texconfig

       texconfig [ commands ...]

       texconfig-sys

DESCRIPTION
       texconfig allows one to configure and maintain TeX in an easy and convenient manner, offering a series of dialog boxes to the user.

       The tlmgr program has subsumed this function for TeX Live.  This program is still supported, but the tlmgr interface is much more actively developed and tested.

       After  choosing settings or options, the appropriate files are changed automatically and the new settings are applied for the user.  If needed, copies of files in TEXMFDIST or TEXMFMAIN will be made
       in the user's TEXMFCONFIG tree.

       texconfig uses either the whiptail(1) or dialog(1) program to communicate with the user, so must be run in a terminal.

       For making system-wide changes, which will apply to all users of TeX (for example, default paper size and so on), run texconfig-sys instead.  Changed or generated files  will  be  placed  in  TEXMF‐
       SYSCONFIG.  (You may need to be root to do this.)

       texconfig also offers a non-interactive batch mode which can be accessed with the following commands

COMMANDS
       Commands that accept further options usually display available options if called without them.  For example, texconfig dvipdfm paper will inform about valid paper settings.

       conf   Display the system configuration.

       dvipdfm paper [letter|legal|ledger|tabloid|a4|a3]
              Set up dvipdfm to use papersize PAPER by default.

       dvips add PRINTERNAME
              Create a new (empty) configuration file TEXMFCONFIG/dvips/config/config.PRINTERNAME.  This file can later be filled with the mode, offset or printcmd options

       dvips del PRINTERNAME
              Remove config.PRINTERNAME

       dvips mode
              List available MetaFont modes.

       dvips [-P PRINTER] mode MODE
              Change the MetaFont mode to MODE for PRINTER or for all output files (config.ps), if no -P option is given.

       dvips [-P PRINTER] offset x-OFFSET,y-OFFSET
              Set printer offset for PRINTER or for all output files (config.ps), if no -P option is given.  Offsets must be given with units, e.g.  0pt,10pt You can use testpage.tex from the LaTeX distri‐
              bution to find these numbers.

       dvips [-P PRINTER] printcmd CMD
              Set the printing command for PRINTER or for all output files (config.ps), if no -P option is given.  Commands might be lp or lpr.  See the description of the o option in info dvips or the  -O
              option in dvips(1).

       faq    Display the list of Frequently Asked Questions about teTeX (and their answers).

       font vardir DIR, font ro, font rw

       formats
              This command allows to edit fmtutil.cnf(5) and (re)creates any new or changed formats afterwards.

       hyphen FORMAT
              This  command  allows  to edit the hyphenation configuration file for formats that support this, and recreates the formats afterwards to enable the new languages.  Available formats are shown
              when no FORMAT is given.

              Note that for formats that use LaTeX's language.dat,
               e.g.  (pdf)jadetex and latex itself, this change is not persistent, since this file is a generated file.  You should not use this command in these cases, read update-language(1) for alterna‐
              tives.

       init [format]
              Recreate format or all formats if none is given, and the font information.  This is the same as calling fmtutil --byfmt format or fmtutil --all, respectively, followed by updmap.

       mode-list
              List available printer modes, together with the printers they were developed for, and their DPI resolution

       mode MODE
              Set the default printer mode in /etc/texmf/web2c/mktex.cnf or the respective user file in $TEXMFCONFIG/web2c to MODE.

       paper [a4|letter]
              Set the default papersize for dvips, dvipdfm, pdftex and xdvi.  The set is restricted because not all programs understand all sizes.

       pdftex paper [a4|letter]
              Set the default paper size for pdftex.

       rehash Call mktexlsr.

       xdvi paper PAPER
              Set the default paper size for xdvi.  The (long) list is available with texconfig xdvi paper.


ENVIRONMENT
       To let you change files, texconfig will open the editor specified in the VISUAL or EDITOR variables, or sensible-editor if both are unset.

SEE ALSO
       whiptail(1), dialog(1), tlmgr(1), tex(1), mf(1), vi(1), EDITOR environment variable.

AUTHOR
       Thomas Esser



TeX Live                                                                                         August 2011                                                                                     texconfig(1)
