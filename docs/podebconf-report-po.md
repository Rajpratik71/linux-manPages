PODEBCONF-REPORT-PO(1)                                              po-debconf                                              PODEBCONF-REPORT-PO(1)

NAME
       podebconf-report-po - send outdated debconf PO files to the last translators

SYNOPSIS
       podebconf-report-po [options]

DESCRIPTION
       This program reads a directory with po files to determine which files contain fuzzy or missing translations, launches an editor to allow
       modifications of mail body and headers, asks confirmation to send mails, and sends them to the last translator requesting updates.  The
       mail will contain the PO file which has to be updated.  podebconf-report-po can be called either in the top-level directory, or in debian
       or debian/po subdirectories (or, for non debconf translations, from the po directory itself or its parent directory).

       podebconf-report-po can also be used to send a call for translations to a mailing list.  In that case, the POT file will be attached.

       Different templates exist for translation update requests, request to send updated PO files to a bug report (--submit) or for calls for
       translations (--call).  The template can also be provided by the user.  See the TEMPLATES section for more information on the templates.

OPTIONS
       Many options can be set in a configuration file.  See section CONFIGURATION FILE.

       --addlanguageteam=LANGUAGE:LIST
           Specify a mailing list for a given language.  This mailing list will be added to the CC list for the PO files of this language when
           --languageteam is used, in addition to the language team specified in the PO file (if these mailing lists differ).

           This is useful to keep the specified team informed, and allow a faster reaction when a translator is known to be inactive.

           This option can be specified more than once.  The language code and language mailing list are separated by a colon.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --bts=NUMBER
           After a bug report has been filed (either manually or with the --submit flag) to track down translations, podebconf-report-po can be
           run again, but this time with the --bts=NUMBER flag.  Translators are then requested to respect the Reply-To: header field which is set
           to this bug report, so that all translations are gathered into a single location.

       --call[=MAILING_LIST]
           Send a call for translations.  If the optional MAILING_LIST argument is not specified, the call for translations is sent to the Debian
           Internationalization list (debian-i18n@lists.debian.org).

           Calls for translations are useful to receive translations in new languages.

           By default, calls for translation are combined with regular requests for updates sent to translators, for the existing translations.
           You can disable this default behavior with the --withouttranslators option.

       --conf=FILE
           Specify the configuration file.  By default, podebconf-report-po reads $HOME/.podebconf-report-po.conf.

       --noconf
           Do not read any configuration file.

       --deadline=DEADLINE
           Specify the deadline for receiving the updated translations (default is no deadline).

           This should be a date, which will be prefixed by:
            The deadline for receiving the updated translation is
            DEADLINE.

           If the specified string starts with a '+', it will be interpreted by:
            LC_ALL=C date -R -d DEADLINE

           If no deadline is specified (and the --nodeadline option is not used), a deadline will be prompted to the user, proposing a default
           deadline set to +10days.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --nodeadline
           Deactivate the deadline indication to translators, and avoid the deadline prompts.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --default
           Do not open the editor and use the template as is.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --nodefault
           Open an editor before sending the email(s).

       -f, --force
           Send the email(s) without confirmation.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --noforce
           Ask for confirmation before sending email(s).

       --from=FROM
           Specify the name and the email address of the sender (default is taken from the DEBEMAIL and DEBFULLNAME environment variables, or from
           the EMAIL environment variable, or is set to the package maintainer if these variables are not set).

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --gzip
           Compress PO files in attachment with "gzip".

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --nogzip
           Do not compress PO files.

       -h, --help
           Print usage information and exit.

       --langs=LANGUAGES
           Specify a list of languages to restrict sending the notification only for these languages.  The list of languages is comma separated.
           The PO files must be named according to these languages, with the .po extension.

       --languageteam
           Send the email also to the Language Team as carbon copy.

           It is enabled by default.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --nolanguageteam
           Do not send the email(s) to the language teams.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --mutt
           Send the mails with mutt.  This set the --postpone argument to $HOME/postponed.

       --notdebconf
           Indicate that it is not a debconf translation.  podebconf-report-po will use the translator-po, call-po, or submit-po template (if no
           other templates are requested in the configuration file or in the command line).  These templates do not mention debconf in the subject
           or mail body and are more suitable for non-debconf translations.

           This option also changes the default po directory used by podebconf-report-po (i.e. the --podir option is not needed when the call is
           done from the po directory itself or from its parent directory).

           By default, a debian/po directory is preferred over a po directory.  With this option, only the po directory will be considered.

           This option is usually not necessary. podebconf-report-po tries to determine the type of translation based on the current directory and
           the existence of a debian/po or po directory.

       --package=PACKAGE
           Specify the name of the package (default is the source package name).

       --podir=DIR
           Specify where the PO files are located.  By default, podebconf-report-po checks if it is called from a po directory, or it searches for
           a debian/po directory (this can be disabled with the --notdebconf option), or for a po directory.

       --postpone=MBOX
           Do not send emails, append them in MBOX.  This file can be used as a postponed mailbox with mutt -p.

       --potfile=POTFILE
           Specify the POT file to send to a call for translations (--call).  By default, podebconf-report-po uses the POT file of the PO files
           directory, if there is only one.

           This file is also used to find the package's name and version, if none were specified with an option, and if no debian/changelog files
           were found.

       --sendmessage
           Only send a message, with no attachments.  This can be useful when the translators have a commit access to the package repository.

       --smtp=SERVER
           Specify SMTP server for mailing (default is "localhost").

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --submit
           Instead of sending mails to translators, file a bug report against this package to request for translations.  This is useful e.g. when
           preparing non-maintainer uploads to make sure that translations do not get lost.

       --summary
           Send a status report to the maintainer with the list of emails sent to translators.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --nosummary
           Do not send any status report to the maintainer.

       --utf8
           Send the email in UTF-8.  This allow non-ascii characters in the mail body and mail header.  The editor must support UTF-8.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --noutf8
           Send the email(s) in us-ascii.  Non-ascii characters are replaced by a question mark.

       --version
           Print version information and exit.

       -v, --verbose
           Display additional information while running.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --noverbose
           Do not use the verbose mode.

       --templatecall=TEMPLATE
           Specify a file to use as a template for the call for translations email(s).  The default template is
           /usr/share/po-debconf/templates/call.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --templatesubmit=TEMPLATE
           Specify a file to use as a template for the email(s) sent to translators when the --submit option is used.  The default template is
           /usr/share/po-debconf/templates/submit.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --templatetranslators=TEMPLATE
           Specify a file to use as a template for the email(s) sent to translators.  The default template is
           /usr/share/po-debconf/templates/translators.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --template=TEMPLATE
           Specify file to use it as template for the email(s).  If a template is specified with this option, this template will be used rather
           than a template specified with any of the --templatetranslators, --templatesubmit, or --templatecall options.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --notemplate
           Use the default template.

       --withtranslators
           Send requests for updates to the translators after sending the call for translation.

           This option is ignored when the --call option is not specified.  It is enabled by default.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

       --withouttranslators
           Do not send requests for translation update to the translators after a call for translations.

           This option can be specified in the configuration file to define default behavior of podebconf-report-po.  See section CONFIGURATION
           FILE below.

CONFIGURATION FILE
       By default, podebconf-report-po reads $HOME/.podebconf-report-po.conf.  The configuration file can be set with the --conf option.  You can
       also ignore any configuration file by specifying the --noconf option.  Command line options can be used to override configuration file
       settings.

       The configuration files accept most of the command line options, without the leading --: deadline, nodeadline, smtp, from, verbose, force,
       templatetranslators, templatesubmit, templatecall, template, default, gzip, languageteam, nolanguageteam, addlanguageteam, summary, utf8,
       withouttranslators, withtranslators.

       Lines starting by a number sign (possibly preceded by spaces) are comments and are ignored.

       Here is an example:
        # This is a comment
        smtp smtp.mydomain
        from = Me Myself <me@mydomain>
        utf8

TEMPLATES
       The templates specified with the --template, --templatetranslators, --templatesubmit, or --templatecall options can contain the following
       tags:

       <from>, <subject>, <reply-to>
           Replaced by the corresponding headers of the email(s).

       <filelist>
           In the default mode, it is replaced by comments showing the list of translators with outdated translations.

           In the --submit mode, it is replaced by the list of PO files with outdated translations.

           And in the --call mode, it is replaced by the list of PO files found in the PO directory.

       <reply>
           Replaced by a string that indicates how the translators have to reply (e.g. follow the Reply-To tag or sending the PO to a given bug
           report).

       <deadline>
           Replaced by a string indicating the deadline for the translation (see --deadline).

       <package>
           Replaced by the name of the package (if it was detected).

       <statistics>
           Replaced by the statistics of the PO files found in the PO directory (in the --call mode only).

       The /usr/share/po-debconf/templates directory contains the default templates.

EXAMPLES
       The recommended usage is to call podebconf-report-po from the po directory to be updated:

       podebconf-report-po --call

       This will send a call for new translations to the <debian-i18n@lists.debian.org> mailing list and will ask translation updates to the
       previous translators. The language teams will also be notified and should be able to react if the assigned translator is known to be MIA.

       A prompt will ask a deadline to the user (the default is to request translations and updates within 10 days).

       Then an editor will display the message to be sent to the mailing list.  When this editor exits, podebconf-report-po will ask confirmation
       to send the mail to the mailing list.

       If confirmed, another editor will display the message to be sent to the translators and language teams.  podebconf-report-po will ask for
       another confirmation to send the mails to translators and language teams.

       You should make a new release with the received translations after the deadline.

SEE ALSO
       debconf-updatepo(1)

AUTHOR
         Fabio Tranchitella <kobold@kobold.it>

                                                                    2016-01-07                                              PODEBCONF-REPORT-PO(1)
