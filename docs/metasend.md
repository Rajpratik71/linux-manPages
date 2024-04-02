metasend(1)                                                                                General Commands Manual                                                                                metasend(1)



NAME
       metasend - Crude interface for sending non-text mail

SYNOPSIS
       metasend   [-b]  [-c  cc]  [-F from] [-e encoding] [-f filename] [-m MIME-type] [-s subject] [-S splitsize] [-t to] [-z] [-n] [-D content-description] [-o outputfile] [-/ multipart-subtype] [-E] [-P
       preamble-file]

DESCRIPTION
       The metasend program will allow a user to send one or more pre-existing data file as non-text multimedia mail.

       With no arguments, the program will ask the user for the To, Subject, and CC fields.  It will then ask for the name of a MIME content-type.  Next, it will ask the user for the name  of  an  existing
       file  containing  that  type  of  data.  After this, it will ask what encoding type, if any, should be applied to this data.  Finally, it  will ask if the user wants to  include information  from an
       additional file, in which case the last three questions will be repeated for  the next file.

       Alternately, all of this information can be provided on the comand line, using the following options:

           -b -- specifies Batch (non-interactive) Mode.  Will exit with an error message if all additional needed information is not provided on the command line.
           -c cc -- specifies the CC address
           -D description -- specifies a string to be used as the Content-description value
           -e encoding -- specifies the encoding type.  Must be either "base64", "quoted-printable", "7bit", or "x-uue".  "7bit" means no encoding is performed.
           -E -- specifies that the file being included is already a full MIME entity, and does not need to have any Content-* or other header fields added.
           -f filename -- specifies the file containing the data
           -F from -- specifies the From address
           -i "<content-id> -- specifies the content-id value for the MIME entity.  Must be a legal content-id value, enclosed in angle brackets.
               -I "<content-id>" -- specifies the content-id for the multipart entity being created by metasend, if any.  Must be a legal content-id value, enclosed in angle brackets.
           -m MIME-type -- specifies the MIME content-type
           -n --  specifies that an additional file is to be included.  Before each use of the -n option on the command line, the  options -m, -c, and -f, at a minimum, must have appeared,and  must  appear
       separately for each included file.
           -o outputfile -- specifies that the output from metasend should go to a named file rather than be delivered as mail.
           -P preamblefile -- specifies a file containing alternative text to be put in the "preamble" area of a MIME multipart message.
           -s subject -- specifies the Subject field
           -S splitsize -- specifies the maximum size before splitting into parts via splitmail(1).
           -t to -- specifies the To address
           -z -- specifies that the temporary files should be deleted EVEN IF DELIVERY FAILS.
           -/ subtype -- specifies the use of a MIME multipart subtype other than "mixed".

       This is intended largely for mail hackers.  A much friendlier interface to non-text mail is provided by mailto(1).

       If more than one file is given,  the parts will be combined into a single multipart MIME  object.

       The  mail  will be delivered using the splitmail(1) program, so if it is very long it will arrive as several pieces which can be automatically reassembled by metamail.  The definition of "very long"
       can be altered using the -S flag or the SPLITSIZE environment variable, as described in the splitmail(1) man page.

SEE ALSO
       audiosend(1), mailto-hebrew(1), mailto(1), metamail(1), mmencode(1), splitmail(1)

BUGS
       Should do a better job of choosing the encoding if you don't specify one.

       Should do MIME syntax checking  on user-supplied content-type fields.  Users are all too likely to provide bogus MIME content-type values, alas.  In particular, there are various characters that are
       not allowed  in parameters  unless the parameters are enclosed in double quotes, but this sort  of  restriction is hard to enforce in a shell script!

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission  to  use,  copy,  modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all
       copies, and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of  Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHOR
       Nathaniel S. Borenstein, Bellcore



                                                                                                  Release 1                                                                                       metasend(1)
