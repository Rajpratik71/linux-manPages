MSGHACK(1)                                                                                      User Commands                                                                                      MSGHACK(1)



NAME
       msghack - alter PO files in ways

SYNOPSIS
       msghack [OPTION] file.po [ref.po]

DESCRIPTION
       This program can be used to alter .po files in ways no sane mind would think about.

       -o     result will be written to FILE

       --invert
              invert a po file by switching msgid and msgstr

       --master
              join any number of files in a master-formatted catalog

       --empty
              empty the contents of the .po file, creating a .pot

       --append
              append entries from ref.po that don't exist in file.po

       Note: It is just a replacement of msghack for backward support.

       This program can be used to alter .po files in ways no sane mind would think about.

       -o     result will be written to FILE

       --invert
              invert a po file by switching msgid and msgstr

       --master
              join any number of files in a master-formatted catalog

       --empty
              empty the contents of the .po file, creating a .pot

       --append
              append entries from ref.po that don't exist in file.po

       Note: It is just a replacement of msghack for backward support.



msghack                                                                                           June 2013                                                                                        MSGHACK(1)
