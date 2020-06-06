REPORTER-MAILX(1)                                                                              LIBREPORT MANUAL                                                                             REPORTER-MAILX(1)



NAME
       reporter-mailx - Sends contents of a problem directory via email.

SYNOPSIS
       reporter-mailx [-v] -d DIR [-c CONFFILE] [-F FMTFILE]

DESCRIPTION
       The tool reads a problem directory, composes an email message from the directory contents, and uses mailx to send the message to specified recipient.

       Properties of email messages can be specified in a configuration file, and via environment variables.

   Configuration file
       Configuration file contains entries in a format "Option = Value".

       The options are:

       Subject
           The subject of the email message.

       EmailFrom
           The sender of the email message.

       EmailTo
           The recipient of the email message.

       SendBinaryData
           Use yes/true/on/1 to attach all binary files from the problem directory to the email. This can cause the emails to be very large.

   Formatting configuration files
       Lines starting with # are ignored.

       Lines can be continued on the next line using trailing backslash.

       Format:

       "%summary
           subject format"

       "section
           element1[,element2]..." The literal text line to be added to email. Can be empty. (Empty lines are NOT ignored!)

               Subject format is a line of text, where %element% is replaced by
               text element's content, and [[...%element%...]] block is used only if
               %element% exists. [[...]] blocks can nest.

               Sections can be:
               - %summary: email subject format string.
               - %attach: a list of elements to attach.
               - text, double colon (::) and the list of comma-separated elements.

               Elements can be:
               - problem directory element names, which get formatted as
                 <element_name>: <contents>
                 or
                 <element_name>:
                 :<contents>
                 :<contents>
                 :<contents>
               - problem directory element names prefixed by "%bare_",
                 which is formatted as-is, without "<element_name>:" and colons
               - %oneline, %multiline, %text wildcards, which select all corresponding
                 elements for output or attachment
               - %binary wildcard, valid only for %attach section, instructs to attach
                 binary elements
               - problem directory element names prefixed by "-",
                 which excludes given element from all wildcards

               Nonexistent elements are silently ignored.
               If none of elements exists, the section will not be created.

   Integration with ABRT events
       reporter-mailx can be used as a reporter, to allow users report problems via email when they decide to do it. This usage is pre-configured in /etc/libreport/events.d/mailx_event.conf:

           EVENT=report_Mailx      reporter-mailx

       It can also be used to notify administrator automatically when a problem happens. When this is desired, modify the event configuration file to run the tool on the post-create event:

           EVENT=post-create       reporter-mailx

OPTIONS
       -d DIR
           Path to problem directory.

       -c CONFFILE
           Path to configuration file. When used in ABRT event system, the file contains site-wide configuration. Users can change the values via environment variables.

       -F CONF_FORMAT_FILE Formatting file for an email.

ENVIRONMENT VARIABLES
       Environment variables take precedence over values provided in the configuration file.

       Mailx_Subject
           Subject of the email message.

       Mailx_EmailFrom
           Sender of the email message.

       Mailx_EmailTo
           Recipient of the email message. If nor the environment variable nor the corresponding option is defined, the message is send to "root@localhost".

       Mailx_SendBinaryData
           Use yes/true/on/1 to attach all binary files from the problem directory to the email.

FILES
       /usr/share/libreport/conf.d/plugins/mailx.conf
           Readonly default configuration files.

       /etc/libreport/plugins/mailx.conf
           Configuration files.

SEE ALSO
       mailx_event.conf(5), mailx.conf(5), report_mailx.conf(5)

AUTHORS
       ·   ABRT team



LIBREPORT 2.1.11.1                                                                                08/12/2019                                                                                REPORTER-MAILX(1)
