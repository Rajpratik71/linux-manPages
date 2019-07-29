ITSTOOL(1)                                                    General Commands Manual                                                   ITSTOOL(1)

NAME
       itstool - convert between XML and PO using ITS

SYNOPSIS
       itstool [OPTIONS] XMLFILES...
       itstool -m <MOFILE> [OPTIONS] XMLFILES...
       itstool -j <XMLFILE> [OPTIONS] MOFILES...

DESCRIPTION
       itstool   extracts  messages  from XML files and outputs PO template files, then merges translations from MO files to create translated XML
       files. It determines what to translate and how to chunk it into messages using the W3C Internationalization Tag Set (ITS).

       To extract messages from XML files XMLFILES and output them to OUT.pot:

       itstool -o OUT.pot XMLFILES

       After merging with existing translations or translating strings, generate an MO file with msgfmt(1), then output translated  files  to  the
       directory DIR:

       itstool -m OUT.mo -o DIR XMLFILES

       You can also create a single multilingual XML output file using an input XML file and a set of MO files:

       itstool -j FILE.xml -o OUT.xml MOFILES

       ITS  definitions  are  loaded  from  the  built-in  rules, rules embedded in the source XML files, files passed with the -i option, and ITS
       attributes in the source XML files. Later definitions take precedence. You can disable built-in rules by passing the -n option.

OPTIONS
   Extracting
       -o OUT.pot
       --out OUT.pot
           output PO template to the file OUT.pot

   Merging
       -m MOFILE XMLFILES
       --merge MOFILE XMLFILES
           merge from an MO file MOFILE and output translated XML files for source XMLFILES

       -l LANG
       --lang LANG
           explicitly set the language code output to XML

       -o OUT
       --out OUT
           output XML files in the directory OUT

   Joining
       -j MLIFILE MOFILES
       --join XMLFILE MOFILES
           join translations from MOFILES into a multilingual file based on source XMLFILE

       -o OUT.xml
       --out OUT.xml
           output to the XML file OUT.xml

   Common
       -i ITS
       --its ITS
           load the ITS rules in the file ITS (can specify multiple times)

       -n
       --no-builtins
           do not apply the built-in ITS rules that ship with itstool

       -s
       --strict
           exit with error when PO files contain broken XML

       -d
       --load-dtd
           load external DTDs used by input XML files

       -k
       --keep-entities
           keep entity references unexpanded in PO files

       -p NAME VALUE
       --param NAME VALUE
           define ITS parameter NAME to the value VALUE (can specify multiple times)

AUTHOR
       Shaun McCance <shaunm@gnome.org>

SEE ALSO
       More documentation for itstool is maintained online. For more information, see:

       http://itstool.org/documentation/

itstool 2.0.2                                                      December 2013                                                        ITSTOOL(1)
