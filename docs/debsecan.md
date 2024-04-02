DEBSECAN(1)                                                                                                                            DEBSECAN(1)

NAME
       debsecan - Debian Security Analyzer

SYNOPSIS
       debsecan options...

DESCRIPTION
       debsecan analyzes the list of installed packages on the current host and reports vulnerabilities found on the system.

OPTIONS
       --suite count
              Choose a specific suite.  debsecan produces more informative output (including obsolete packages) if the correct suite is specified.
              The release code name has to be used ("sid"), not the temporal name ("unstable").

       --whitelist file
              Change the name of the whitelist file.

       --add-whitelist, --remove-whitelist, --show-whitelist
              Add or remove entries from the whitelist, or print the whitelist to standard output.  See the CHANGING THE WHITELIST section below.

       --source url
              Override the default download URL for vulnerability data.

       --status file
              Evaluate a different dpkg status file.

       --format format
              Change the output format.  If format is summary (the default), a short summary for each vulnerability is printed.  The simple format
              is like the summary format, except that only the bug packages names are printed.  For bugs and packages, debsecan lists the names of
              vulnerabilities and binary packages, respectively.  --format detail requests a verbose output format, showing  all  available  data.
              The report format is used for email reports.

       --line-length characters
              Specifies the line length in report mode.  The default is 72.

       --mailto mailbox
              The  --mailto option instructions debsecan to the send the report to the email address mailbox.  No report is sent if there where no
              changes since the last invocation with --update-history.  This option requires the --format report output format.  The option  value
              may contain macros, see the section CONFIGURATION FILE MACROS below.

       --only-fixed
              Only  list  vulnerabilities for which a fix is available in the archive.  Note that it can happen that a fix is listed, although the
              package has not been built for the system's architecture and is not yet available for download.  (If you use this option,  you  also
              must specify the correct suite using --suite.)

       --no-obsolete
              Do  not  list any obsolete packages (see below).  Using this option is not recommended because it hides real vulnerabilities on some
              systems, not just false positives.

       --history file
              Change the name of the history file used by --format report.

       --disable-https-check
              Turn off certificate validation for HTTPS.

       --update-history
              Update the vulnerability status information after reporting it using --format report.

       --cron Internal option used for invocations from cron.  Checks if the vulnerability data has already been downloaded today.  In this  case,
              further processing is skipped.  See debsecan-create-cron(8) for instructions how to create a suitable cron entry.

       --config file
              Sets the location of the configuration file.

       --help Display a short help message and exit.

       --version
              Display version information and exit.

CONFIGURATION FILE
       The  configuration  file  contains the following variables.  It follows name=value shell syntax.  If value contains white space, it must be
       surrounded by double quotes.  Some variables may contain macros; see the section CONFIGURATION FILE MACROS below.

       MAILTO Sets the email address to which reports are sent in --cron mode.  May contain macros.

       REPORT Controls whether debsecan does any processing whatsoever in --cron mode.  (Permitted values: true and false.)

       SOURCE Controls the URL from which vulnerability information is fetched.  If empty, the built-in default is used.

       SUITE  Sets the default value of the --suite option (see there).

       SUBJECT
              Changes the subject line of reports.  May contain macros.

       DISABLE_HTTPS_CHECK
              Disables HTTPS certificate checking, just like the --disable-https-check command line option.

CONFIGURATION FILE MACROS
       Macro processing replaces strings of the form %s(key)s with system-dependent values.  Support keys are:

       hostname
              The host name on which debsecan runs, without the domain name part.

       fqdn   The fully-qualified domain name of the host on which debsecan runs.

       ip     The IP address of the host on which debsecan runs.  This may be inaccurate on multi-homed systems.

CHANGING THE WHITELIST
       You can use the --add-whitelist and --remove-whitelist options to change the whitelist.  Whitelisted vulnerabilities are  not  included  in
       the reports.  For example,

              debsecan --add-whitelist CVE-2005-4601

       ignores the vulnerability CVE-2005-4601 completely, while

              debsecan --add-whitelist CVE-2005-4601 perlmagick

       ignores  it  only  as  far  as  the perlmagick is concerned.  (This is the same format that is produced by the --format simple option.)  To
       remove all whitelist entries for the CVE-2005-4601 vulnerability, use:

              debsecan --remove-whitelist CVE-2005-4601

       If you want to remove an entry for a specific vulnerability/package pair, list the package name explicitly, as in:

              debsecan --remove-whitelist CVE-2005-4601 imagemagick

       You can list multiple vulnerability and packages.  For example,

              debsecan --add-whitelist CVE-2005-4601 \
                 CVE-2006-0082 imagemagick perlmagick

       whitelists CVE-2005-4601 for all packages, and CVE-2006-0082 for the imagemagick and perlmagick packages only.

CAVEATS
       Much like the official Debian security advisories, debsecan's vulnerability tracking is mostly based on source packages.  This can be  con‐
       fusing  because  tools  like  dpkg only display binary package names.  Therefore, debsecan displays the more familiar binary package names.
       This has the unfortunate effect that all binary packages (including packages containing only documentation, for  example)  are  flagged  as
       vulnerable, and not only those packages which actually contain the vulnerable code.

       If  the  correct  --suite option is specified, debsecan may mark some packages as obsolete.  This means that the binary package in question
       has been removed from the archive.  In this case, you need to update all the packages depending on the obsolete package,  and  subsequently
       remove the obsolete package.

       For  certain architectures, build daemons may lag considerably.  In such case, debsecan may incorrectly mark a package as fixed, even if an
       update is not yet available in the Debian archive.

       Note that debsecan version uses the --suite option only to determine the availability of corrected packages and to  detect  obsolete  pack‐
       ages.   If  you specify the wrong suite, only the information on available security updates and obsolete packages is wrong, but the list of
       vulnerabilities is correct.

       Mixing packages from different Debian releases is supported, as long as the packages still carry their official version  numbers.   Unknown
       package  versions  (from backported packages, for example) are compared to the version in Debian unstable only, which may lead to incorrect
       reports.

EXAMPLES
       This command prints all package names for which security fixes are available:

              debsecan --suite suite --format packages --only-fixed

       If you pass this output to apt-get, you can download new packages which contain security fixes.  For example, if you are running sid:

              apt-get install \
                 $(debsecan --suite sid --format packages --only-fixed)

       The following command can be invoked periodically, to get notifications of new security issues:

              debsecan --suite suite --format report \
                 --update-history --mailto root

       See debsecan-create-cron(8) for a tool which creates a suitable cron entry.

ENVIRONMENT
       http_proxy
              This environment variable instructs debsecan to use a proxy server to fetch  the  vulnerability  data.   It  must  be  of  the  form
              http://proxy.example.net:8080/ (mimicking a URL).

FILES
       /etc/default/debsecan
              Built-in location of the configuration file.

       /var/lib/dpkg/status
              File from which the package information is fetched by default.

AUTHOR
       debsecan was written by Florian Weimer.

SEE ALSO
       dpkg(1), debsecan-create-cron(8), apt-get(8)

                                                                    2005-12-23                                                         DEBSECAN(1)
