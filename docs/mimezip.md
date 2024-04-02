mimecheck(1)                                                                                Check MIME attachments                                                                               mimecheck(1)



NAME
       mimecheck - determine the type of the MIME encoded of an attachment
       mimezip - detect the type of MIME encoded zip archive in an attachment
       mimebzip - detect the type of MIME encoded bzip2 data in an attachment
       mimegzip - detect the type of MIME encoded gzip data in an attachment

SYNOPSIS
       mimecheck boundary [file]
       mimezip boundary [file]
       mimebzip boundary [file]
       mimegzip boundary [file]

DESCRIPTION
       The  scripts  mimecheck, mimezip, mimebzip, and mimegzip  can be used to determine the contents of MIME encoded attachments of the type application/octet-stream.  The scripts require the boundary as
       provided in the headers and/or bodys of mails with enclosed attachments.  The scripts read from standard input if no file was provided and write out the detected MIME type to standard out.

EXAMPLE
       A short filter rule used by procmail(1) to check for DOS executables in MIME encoded zip archives found in many attachments:

           BLANK="[  ]+"
           TYPE="${BLANK}multipart/(alternative|mixed)"

           :0
           * $ ^Content-Type:${TYPE};(${BLANK}|$)*boundary=[\"']?[^ \"';]+
           {
                BOUNDARY="${MATCH}"
                TYPE=""

                :0 B
                   * $ ^Content-Transfer-Encoding:${BLANK}base64
                {
                     TYPE=`mimecheck ${BOUNDARY}`

                     :0
                     * TYPE ?? application/x-zip
                     {
                          TYPE=`mimezip ${BOUNDARY}`
                     }
                }

                :0
                * TYPE ?? executable.*DOS
                * TYPE ?? DOS.*executable
                /dev/null
           }

       there is no guarantee that this piece of a procmailrc(5) file will work.

SEE ALSO
       procmailrc(5), file(1), sed(1), mimencode(1).

COPYRIGHT
       2007 SuSE LINUX Products GmbH, Nuernberg, Germany,
       2007 Werner Fink.

AUTHORS
       Werner Fink <werner@suse.de>.



3rd Berkeley Distribution                                                                       Juni 28, 2007                                                                                    mimecheck(1)
