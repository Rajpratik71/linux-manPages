SGMLDIFF(1)                                                                                                                                                                                       SGMLDIFF(1)



NAME
       sgmldiff - Find differences in the markup of two SGML files

SYNOPSIS
       sgmldiff [ options  ... ] file1 file2 [ -a | --attributes
           | -c  [ attributes | nesting | textpos ] | --context  [ attributes | nesting | textpos ]
           | -s | --statistics
           | -h | --help
           | -v | --version ]


DESCRIPTION
       This  perl  script allows to determine the structural differences between two SGML files. It compares the files, regardless of what is in between the tags, to only focus on the markup. Its output is
       similar to diff(1).

       The typical use of sgmldiff is to compare an SGML file with its translation into another language. If the translation was done cleanly, sgmldiff returns without finding any difference in the markup.

       An example of a typical call to sgmldiff is:

             sgmldiff english.sgml italiano.sgml


       If there are differences in markup between both files, sgmldiff will output a series of differences reports summarized with lines of the form:

       169a164
              At line 169 of the first file, line 164 of the second file has been added.

       8a12,15
              At line 8 of the first file, lines 12 to 15 of the second file have been added.

       41d28  Line 41 of the first file has been destroyed, to obtain line 28 of the second file.

       63,66d61
              Lines 63 to 66 of the first file have been destroyed. to obtain line 61 of the second file.

       52c51  Line 52 of the first file has been changed into line 51 of the second file.

       5,7c8,10
              Lines 5 to 7 of the first file have been changed into lines 8 to 10 of the second line.  In addition to those summaries, the lines of the first file are shown preceeded by '<' and  the  lines
              of the second file are shown preceeded by '>".

OPTIONS
       Here is the list of actions that can be requested to sgmldiff:

                    [ -a | --attributes ]
              Include the attribute values in the difference tests.  Don't set this value if the attributes are likely to be translated. Set this value if the attributes value shouldn't change between both
              files. Default is to don't include the attributes in the difference tests.

                    [ -c  [ attributes | nesting | textpos ] | --context  [ attributes | nesting | textpos ] ]
              Add more context to the difference. Since every test between the tags is removed before testing the differences, sgmldiff is likely to resynchronize itself at the wrong place, by thinking the
              location in both files correspond, while it's not true. By adding more context to the compared area, such risk is disminished.

              The allowed values for the --context option are:

              attributes
                     Take into account the attribute names. The attribute values are controlled by the attributes option.

              nesting
                     Take into account the nesting level of all the compared tags.

              textpos
                     Take into account the position in the text.

                    [ -s | --statistics ]
              Print some SGML information at the end.

                    [ -h | --help ]
              Print a short help message and exit

                    [ -v | --version ]
              Print the version identifier and exit

FILES
AUTHORS
                 Frederik Fouvry
              Developer of sgmldiff.

SEE ALSO
                 jw(1)
              conversion from a SGML file to other file formats

          nsgmls(1)
              a base component of Jade DSSSL engine

          http://sources.redhat.com/docbook-tools/ <URL:http://sources.redhat.com/docbook-tools/>
              the home page of the DocBook tools, a compendium of all tools necessary to process DocBook files, including the DocBook-utils



                                                                                               11 February 2004                                                                                   SGMLDIFF(1)
