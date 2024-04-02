REPORTER-RHTSUPPORT(1)                                                                         LIBREPORT MANUAL                                                                        REPORTER-RHTSUPPORT(1)



NAME
       reporter-rhtsupport - Reports problem to RHTSupport.

SYNOPSIS
       reporter-rhtsupport [-v] [-c CONFFILE] [-F FMTFILE] [-u -C UR_CONFFILE] -d DIR

       Or:

       reporter-rhtsupport [-v] [-c CONFFILE] [-d DIR] -t[ID] FILE...

DESCRIPTION
       The tool reads problem directory DIR. Then it logs in to RHTSupport and creates a new case.

       The tool can be configured to submit an uReport to RHTSupport together with creating a new case.

       The URL to new case is printed to stdout and recorded in reported_to element in DIR.

       If not specified, CONFFILE defaults to /etc/libreport/plugins/rhtsupport.conf.

       Option -t uploads FILEs to the already created case on RHTSupport site. The case ID is retrieved from directory specified by -d DIR. If problem data in DIR was never reported to RHTSupport, you will
       be asked to enter case ID to which you want to upload the FILEs.

       Option -tCASE uploads FILEs to the case CASE on RHTSupport site. -d DIR is ignored.

       Option -u uploads uReport along with creating a new case. uReport configuration is loaded from UR_CONFFILE which defaults to /etc/libreport/plugins/ureport.conf.

   Configuration file
       Configuration file lines should have PARAM = VALUE format. The parameters are:

       Login
           Login to RHTSupport account.

       Password
           Password to RHTSupport account.

       URL
           HTTP(S) address. (default: https://api.access.redhat.com/rs)

       SSLVerify
           Use yes/true/on/1 to verify server’s SSL certificate. (default: yes)

       SubmitUReport
           Use yes/true/on/1 to enable submitting uReport together wit creating a new case. (default: no)

       Parameters can be overridden via $RHTSupport_PARAM environment variables.

   Integration with ABRT events
       reporter-rhtsupport can be used as an ABRT reporter. Example fragment for /etc/libreport/report_event.conf:

           # Report Python crashes
           EVENT=report_RHTSupport analyzer=Python
                 reporter-rhtsupport -d . -c /etc/libreport/plugins/rhtsupport.conf

OPTIONS
       -d DIR
           Path to problem directory.

       -c CONFFILE
           Path to configuration file.

       -t[ID]
           Upload FILEs to the already created case on RHTSupport site.

       -u
           Submit uReport together with creating a new case.

       -C UR_CONFFILE
           Configuration file for submitting uReports.

       -F CONF_FORMAT_FILE
           Formatting file for a new case.

FILES
       /usr/share/libreport/conf.d/plugins/rhtsupport.conf
           Readonly default configuration files.

       /etc/libreport/plugins/rhtsupport.conf
           Configuration file.

SEE ALSO
       abrt_event.conf(5), rhtsupport.conf(5), rhtsupport_event.conf(5)



LIBREPORT 2.1.11.1                                                                                08/12/2019                                                                           REPORTER-RHTSUPPORT(1)
