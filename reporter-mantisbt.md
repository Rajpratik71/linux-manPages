REPORTER-MANTISBT(1)                                                                           LIBREPORT MANUAL                                                                          REPORTER-MANTISBT(1)



NAME
       reporter-mantisbt - Reports problem to Mantis Bug Tracker.

SYNOPSIS
       reporter-mantisbt [-vrf] [-c CONFFILE]... [-F FMTFILE] [-A FMTFILE2] -d DIR

       Or:

       reporter-mantisbt [-v] [-c CONFFILE]... [-d DIR] -t[ID] FILE...

       Or:

       reporter-mantisbt [-v] [-c CONFFILE]... -h DUPHASH

DESCRIPTION
       The tool reads problem directory DIR. Then it logs in to MantisBT and tries to find an issue with the same duphash HEXSTRING in abrt_hash field.

       If such issue is not found, then a new issue is created. Elements of DIR are stored in the issue as part of issue description or as attachments, depending on their type and size.

       Otherwise, if such issue is found and it is marked as CLOSED DUPLICATE, the tool follows the chain of duplicates until it finds a non-DUPLICATE issue. The tool adds a new note to found issue.

       The URL to new or modified issue is printed to stdout and recorded in reported_to element in DIR.

       Option -t uploads FILEs to the already created issue on MantisBT site. The issue ID is retrieved from directory specified by -d DIR. If problem data in DIR was never reported to MantisBT, upload
       will fail.

       Option -tID uploads FILEs to the issue with specified ID on MantisBT site. -d DIR is ignored.

       Option -r sets the last url from reporter_to element which is prefixed with TRACKER_NAME to URL field. This option is applied only when a new issue is to be filed. The default value is ABRT Server"

   Configuration file
       If not specified, CONFFILE defaults to /etc/libreport/plugins/mantisbt.conf. Configuration file lines should have PARAM = VALUE format. The parameters are:

       Login
           Login to MantisBT account.

       Password
           Password to MantisBT account.

       MantisbtURL
           MantisBT HTTP(S) address. (default: http://localhost/mantisbt)

       SSLVerify
           Use yes/true/on/1 to verify server’s SSL certificate. (default: no)

       Project
           Project issue field value. Useful if you needed different project than specified in /etc/os-release

       ProjectVersion
           Version issue field value. Useful if you needed different project version than specified in /etc/os-release

       CreatePrivate
           Create private MantisBT issue. (default: no)

       Parameters can be overridden via $Mantisbt_PARAM environment variables.

   Formatting configuration files
       Lines starting with # are ignored.

       Lines can be continued on the next line using trailing backslash.

       Format:

       "%summary
           summary format"

       "section
           element1[,element2]..." The literal text line to be added to MantisBT Description or Additional information. Can be empty. (Empty lines are NOT ignored!)

               Summary format is a line of text, where %element% is replaced by
               text element's content, and [[...%element%...]] block is used only if
               %element% exists. [[...]] blocks can nest.

               Sections can be:
               - %summary: issue Summary format string.
               - %attach: a list of elements to attach.
               - %Additional info: issue Additional Information content.
               - text, double colon (::) and the list of comma-separated elements.

               Description and Additional information MantisBT's fields:
               All text, double colons (::) and lists of comma-separated elements which
               are placed above the section '%Additional info::' in the configuration file are
               stored in the 'Description' field in MantisBT. All text etc. which are placed
               under the '%Additional info::' are stored in the 'Additional information' field.

               For example:
               |:: comment               |  (Description)
               |                         |  (Description)
               |Package:: package        |  (Description)
               |                         |  (Description)
               |%Additional_info::       |
               |%reporter%               |  (Additional info)
               |User:: user_name,uid     |  (Additional info)
               |                         |  (Additional info)
               |Directories:: root,cwd   |  (Additional info)

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
       reporter-mantisbt can be used as an ABRT reporter. Example fragment for /etc/libreport/report_event.conf:

           # Report Python crashes
           EVENT=report_CentOSBugTracker analyzer=Python
                 reporter-mantisbt -d . -c /etc/libreport/plugins/mantisbt.conf

OPTIONS
       -d DIR
           Path to problem directory.

       -c CONFFILE
           Path to configuration file.

       -f
           Force reporting even if this problem is already reported.

       -F CONF_FORMAT_FILE
           Formatting file for new issues. Default: /etc/libreport/plugins/mantisbt_format.conf

       -A CONF_FORMAT_FILE
           Formatting file for duplicates. Default: /etc/libreport/plugins/mantisbt_formatdup.conf

       -t[ID]
           Upload FILEs to the already created issue on MantisBT site.

       -h, --duphash DUPHASH
           Search in MantisBT by abrt’s DUPHASH and print ISSUE_ID.

       -r TRACKER_NAME
           Set the last url from reporter_to element which is prefixed with TRACKER_NAME to URL field in MantisBT.

ENVIRONMENT VARIABLES
       Environment variables take precedence over values provided in the configuration file.

       Mantisbt_Login
           Login to MantisBT account.

       Mantisbt_Password
           Password to MantisBT account.

       Mantisbt_MantisbtURL
           MantisBT HTTP(S) address. (default: http://localhost/mantisbt)

       Mantisbt_SSLVerify
           Use yes/true/on/1 to verify server’s SSL certificate. (default: no)

       Mantisbt_Project
           Project issue field value. Useful if you needed different project than specified in /etc/os-release

       Mantisbt_ProjectVersion
           Version issue field value. Useful if you needed different project version than specified in /etc/os-release

       Mantisbt_CreatePrivate
           Create private MantisBT issue. (default: no)

FILES
       /usr/share/libreport/conf.d/plugins/mantisbt.conf
           Readonly default configuration files.

       /etc/libreport/plugins/mantisbt.conf
           Configuration file.

       /etc/libreport/plugins/mantisbt_format.conf
           Configure formating for reporting.

       /etc/libreport/plugins/mantisbt_formatdup.conf
           Configure formating for reporting duplicates.

SEE ALSO
       report_event.conf(5), mantisbt_format.conf(5), mantisbt_formatdup.conf(5)

AUTHORS
       ·   ABRT team



LIBREPORT 2.1.11.1                                                                                08/12/2019                                                                             REPORTER-MANTISBT(1)
