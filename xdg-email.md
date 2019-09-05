XDG-EMAIL(1)                                                                               xdg-email Manual                                                                               XDG-EMAIL(1)

NAME
       xdg-email - command line tool for sending mail using the user's preferred e-mail composer

SYNOPSIS
       xdg-email [--utf8] [--cc address] [--bcc address] [--subject text] [--body text] [--attach file] [mailto-uri | address(es)]

       xdg-email {--help | --manual | --version}

DESCRIPTION
       xdg-email opens the user's preferred e-mail composer in order to send a mail to address(es) or mailto-uri. RFC2368 defines mailto: URIs. xdg-email limits support to, cc, subject and body
       fields in mailto-uri, all other fields are silently ignored.  address(es) must follow the syntax of RFC822. Multiple addresses may be provided as separate arguments.

       All information provided on the command line is used to prefill corresponding fields in the user's e-mail composer. The user will have the opportunity to change any of this information before
       actually sending the e-mail.

       xdg-email is for use inside a desktop session only. It is not recommended to use xdg-email as root.

OPTIONS
       --utf8
           Indicates that all command line options that follow are in utf8. Without this option, command line options are expected to be encoded according to locale. If the locale already specifies
           utf8 this option has no effect. This option does not affect mailto URIs that are passed on the command line.

       --cc address
           Specify a recipient to be copied on the e-mail.

       --bcc address
           Specify a recipient to be blindly copied on the e-mail.

       --subject text
           Specify a subject for the e-mail.

       --body text
           Specify a body for the e-mail. Since the user will be able to make changes before actually sending the e-mail, this can be used to provide the user with a template for the e-mail.  text
           may contain linebreaks.

       --attach file
           Specify an attachment for the e-mail.  file must point to an existing file.

           Some e-mail applications require the file to remain present after xdg-email returns.

       --help
           Show command synopsis.

       --manual
           Show this manual page.

       --version
           Show the xdg-utils version information.

ENVIRONMENT VARIABLES
       xdg-email honours the following environment variables:

       XDG_UTILS_DEBUG_LEVEL
           Setting this environment variable to a non-zero numerical value makes xdg-email do more verbose reporting on stderr. Setting a higher value increases the verbosity.

EXIT CODES
       An exit code of 0 indicates success while a non-zero exit code indicates failure. The following failure codes can be returned:

       1
           Error in command line syntax.

       2
           One of the files passed on the command line did not exist.

       3
           A required tool could not be found.

       4
           The action failed.

       5
           No permission to read one of the files passed on the command line.

SEE ALSO
       xdg-open(1), xdg-mime(1), MIME applications associations specification[1], RFC 6068 - The 'mailto' URI Scheme[2]

EXAMPLES
           xdg-email 'Jeremy White <jwhite@example.com>'

           xdg-email --attach /tmp/logo.png \
                     --subject 'Logo contest' \
                     --body 'Attached you find the logo for the contest.' \
                     'jwhite@example.com'

           xdg-email --subject 'Your password is about to expire' \
                     'jwhite@example.com' 'bastian@example.com' 'whipple@example.com'

AUTHORS
       Kevin Krammer
           Author.

       Jeremy White
           Author.

COPYRIGHT
       Copyright © 2006

NOTES
        1. MIME applications associations specification
           http://www.freedesktop.org/wiki/Specifications/mime-apps-spec/

        2. RFC 6068 - The 'mailto' URI Scheme
           https://tools.ietf.org/html/rfc6068

xdg-utils 1.0                                                                                 10/02/2018                                                                                  XDG-EMAIL(1)
