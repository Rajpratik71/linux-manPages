KABCCLIENT(1)                                                                                 KDE User's Manual                                                                                 KABCCLIENT(1)



NAME
       kabcclient - commandline client for the KDE addressbook

SYNOPSIS
       kabcclient [[-A] | [-R] | [-M] | [-S] | [-L]] [--match-case] [--nosave] [-ic codec] [-if format] [-if-opts format-options] [-oc codec] [-of format] [-of-opts format-options] [input-data]

DESCRIPTION
       kabcclient allows commandline access to the KDE addressbook, for example in shell scripts. It supports input from stdin or through additional commandline arguments. Output is always written to
       stdout.

OPTIONS
       Operation modes

           -A, --add
               Add a new contact entry to the addressbook

           -R, --remove
               Removes an existing contact entry from the addressbook

           -M, --merge
               Merges input data with an existing contact entry from the addressbook. This appends any new information to the already existing one

           -S, --search
               Searches the addressbook for matching contact entries

           -L, --list
               Lists all contact entries of the addressbook

       Input options

           -ic, --input-codec
               Pass input text through a specified text encoding. See -ic help for additional information about input codecs. Default is local which will use the codec for the current locale(5) settings

           -if, --input-format
               Parses the input text according to given formatting rules. See -if help for available formats. Default is search

           Instead of reading input text kabcclient can show a dialog for selecting contacts using the input format
               dialog

           -if-opts, --input-format-options
               Additional options for the chosen input format. Can be optional as well as mandatory depending on the format. See -if-opts help for available format options

       Output options

           -oc, --output-codec
               Pass output text through a specified text encoding. See -oc help for additional information about output codecs. Default is local which will use the codec for the current locale(5) settings.

           -of, --output-format
               Formats the output text according to given formatting rules. See -of help for available formats. Default is vcard

           -of-opts, --output-format-options
               Additional options for the chosen output format. Can be optional as well as mandatory depending on the format. See -of-opts help for available format options

       Additional options

           --match-case
               Use case sensitive text matching when comparing input text with contact entries

           --nosave
               Perform information changing operations like -A, -R or -M only in memory but do not write the changes back to the addressbook

DIAGNOSTICS
       As usual an exit status of zero indicates success. Depending on the chosen operation mode a non-zero exit status indicates a certain problem the application encountered

       ADD

           1
               Reading the input text failed

           2
               Creating a suitable contact entry from the input text failed, e.g. not data or wrongly formatted input for the chosen input format

           3
               Saving the addressbook changes failed. This can be caused for example by other applications currently locking the addressbook.

       REMOVE

           1
               Reading the input text failed

           2
               The program could not remove any contact entry from the addressbook. This can be caused by failing to parse the input text, failing to find a matching contact entry in the addressbook or
               finding more than one matching contact entry in the addressbook. In the latter case an error message is written to stderr

           3
               Saving the addressbook changes failed. This can be caused for example by other applications currently locking the addressbook.

       MERGE

           1
               Reading the input text failed

           2
               The program could not merge the input with any contact entry from the addressbook. This can be caused by failing to parse the input text, failing to find a matching contact entry in the
               addressbook or finding more than one matching contact entry in the addressbook. In the latter case an error message is written to stderr

           3
               Saving the addressbook changes failed. This can be caused for example by other applications currently locking the addressbook.

           SEARCH, 1
               Reading the input text failed

           2
               The program could not find any matching contact entry in the addressbook. This can be caused by failing to parse the input text or failing to find a matching contact entry in the addressbook

EXAMPLES
       Look for contact entries with Joe in either name or email addresses

           kabcclient -S Joe

       Do the same but use case sensitive matching

           kabcclient --match-case -S Joe

       Do the same but read input text from stdin

           echo "Joe" | kabcclient --match-case -S

       Try to add a new contact entry using data from a formatted email address

           kabcclient --nosave --add -if email "Marilyn Monroe <mmonroe@moviestars.com>"

       Do the same but this time really save the changed addressbook

           kabcclient --add -if email "Marilyn Monroe <mmonroe@moviestars.com>"

       Listing the available input formats

           kabcclient -if help

       Listing the available output formats

           kabcclient -of help

       Listing the available options for the 'email' output format

           kabcclient -of email -of-opts help

       Listing all email addresses for all contacts containing 'Marilyn'

           kabcclient -of email -of-opts allemails -S Marilyn

       Remove all contacts the user selected in the contact selection dialog

           kabcclient --remove -if dialog

       Export selected contacts to a VCard (default output format) file

           kabcclient -S -if dialog > contacts.vcf

AUTHOR
       This manual page was written by Kevin Krammer <kevin.krammer@gmx.at>. Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version
       2 any later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

AUTHOR
       Kevin Krammer <kevin.krammer@gmx.at>
           Author



K Desktop Environment                                                                             2005-09-08                                                                                    KABCCLIENT(1)
