lrelease(1)                                                   General Commands Manual                                                  lrelease(1)

NAME
       lrelease - generate Qt message files from Qt Linguist translation files

SYNOPSIS
       lrelease [ options ] project-file
       lrelease [ options ] ts-files [ -qm qm-file ]

DESCRIPTION
       This  page  documents  the Qt Linguist Release tool for the Qt GUI toolkit.  Lrelease reads a qmake/tmake project file (.pro file) and con‐
       verts the translation files (.ts files) specified in it into Qt message files (.qm files) used by the application to translate.

       The .qm file format is a compact binary format that provides extremely fast lookups for translations and that is used by Qt.

OPTIONS
       -help  Display the usage and exit.

       -compress
              Compress the .qm files.

       -nounfinished
              Do not include unfinished translations.

       -removeidentical
              If the translated text is the same as the source text, do not include the message.

       -silent
              Do not explain what is being done.

       -version
              Display the version of lrelease and exit.

USAGE
       Here is an example .pro file that can be given to lrelease:

           HEADERS         = funnydialog.h \
                             wackywidget.h
           SOURCES         = funnydialog.cpp \
                             main.cpp \
                             wackywidget.cpp
           FORMS           = fancybox.ui
           TRANSLATIONS    = gnomovision_dk.ts \
                             gnomovision_fi.ts \
                             gnomovision_no.ts \
                             gnomovision_se.ts

       When running lrelease on this project file, the Qt message  files  gnomovision_dk.qm,  gnomovision_fi.qm,  gnomovision_no.qm  and  gnomovi‐
       sion_se.qm will be generated from gnomovision_dk.ts, gnomovision_fi.ts, gnomovision_no.ts and gnomovision_se.ts, respectively.

       Lrelease can also be invoked with a list of .ts files to convert:

           lrelease gnomovision_*.ts

SEE ALSO
       lupdate(1) and http://doc.trolltech.com/i18n.html

Nokia Corporation and/or its subsidiary(-ies)                     18 October 2001                                                      lrelease(1)
