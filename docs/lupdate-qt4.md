lupdate(1)                                                    General Commands Manual                                                   lupdate(1)

NAME
       lupdate - update Qt Linguist translation files

SYNOPSIS
       lupdate [ options ] project-file
       lupdate [ options ] source-files -ts ts-files

DESCRIPTION
       This  page  documents  the Qt Linguist Update tool for the Qt GUI toolkit.  Lupdate reads a qmake/tmake project file (.pro file), finds the
       translatable strings in the specified source, header and interface files, and updates the translation files (.ts files)  specified  in  it.
       The translation files are given to the translator who uses Qt Linguist to read the files and insert the translations.

       The .ts file format is a simple human-readable XML format that can be used with version control systems if required.

OPTIONS
       -disable-heuristic {sametext|similartext|number}
              Disable the named merge heuristic. Can be specified multiple times.

       -extensions <ext>[,<ext>...]
              Process  files  with  the  given  extensions only.  The extension list must be separated with commas, not with whitespace.  Default:
              'ui,c,c++,cc,cpp,cxx,ch,h,h++,hh,hpp,hxx'.

       -help  Display the usage and exit.

       -locations {absolute|relative|none}
              Specify/override how source code references are saved in ts files.  Default is absolute.

       -no-obsolete
              Drop all obsolete strings.

       -no-recursive
              Do not recursively scan the following directories.

       -no-sort
              Do not sort contexts in .ts files.

       -pluralonly
              Only include plural form messages.

       -pro <filename>
              Name of a .pro file. Useful for files with .pro file syntax but different file suffix

       -recursive
              Recursively scan the following directories.

       -silent
              Don't explain what is being done.

       -source-language <language>[_<region>]
              Specify/override the language of the source strings. Defaults to POSIX if not specified and the file does not name it yet.

       -target-language <language>[_<region>]
              Specify/override the language of the translation.  The target language is guessed from the file name if this option is not specified
              and the file contents name no language yet.  -version Display the version of lupdate and exit.

USAGE
       Here is an example .pro file that can be given to lupdate:

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

       When  running lupdate on this project file, the translatable strings in all the files listed in the HEADERS, SOURCES and FORMS entries will
       be put in the translation files listed in the TRANSLATIONS entry. Previous translations will be reused as far as possible,  and  translated
       strings that have vanished from the source files are marked obsolete.

       lupdate can also be invoked with a list of C++ source files, .ui files and .ts files:

           lupdate *.cpp *.h *.ui -ts gnomovision_dk.ts

SEE ALSO
       lrelease(1) and http://doc.trolltech.com/i18n.html

Nokia Corporation and/or its subsidiary(-ies)                     18 October 2001                                                       lupdate(1)
