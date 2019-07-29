SUPPORTCONFIG(8)                                                                           Support Utilities Manual                                                                          SUPPORTCONFIG(8)



NAME
       supportconfig - Gathers system troubleshooting information

SYNOPSIS
       supportconfig [-ACDFLQabdeghklmpqsuvy][-B string][-E string][-G gpg_uid][-H number][-I number][-M string][-N string][-O string][-P string][-R directory path][-S number][-T seconds][-U URI string][-W
       string][-X number][-f directory][-i keyword list][-o keyword list][-r srnum][-t directory][-x keyword list]

DESCRIPTION
       Creates a tar ball that can be attached to a SUSE service request and/or sent to a SUSE Technical Services engineer. Collects comprehensive system information for troubleshooting and reducing  reso-
       lution time.

       This tool will create a tar ball in the default /var/log directory. Please attach the tar ball to your open service request, using the following URL: https://secure-support.novell.com/eService_enu

       If you cannot attach the tar ball to the service request, then email it to the support engineer assigned to your service request.

DISCLAIMER
       Detailed  system information and logs are collected and organized in a manner that helps reduce service request resolution times. Private system information can be disclosed when using this tool. If
       this is a concern, please prune private data from the log files. Several startup options are available to exclude more sensitive information. Refer to the OPTIONS below.

OPTIONS
       -h     This screen

       -A     Activates all supportconfig functions with additional logging and full rpm verification.

       -B string
              Includes the string in the tar ball filename in the format nts_<string>. See supportconfig.conf(5) under VAR_OPTION_CUSTOM_ARCH for string qualifiers.

       -C     Creates a new default /etc/supportconfig.conf

       -D     Use defaults; ignore  /etc/supportconfig.conf

       -E string
              Contact email address. This is an optional email address that is included in the basic-environment.txt file.

       -F     Display available supportconfig feature keywords (case-sensitive) used with -i and -x

       -G gpg_uid
              The GPG recipient user ID used to encrypt the supportconfig tar ball for more secure uploads.

       -H number
              Limit number of included HA Policy engine files

       -I number
              Default log file line count

       -L     Create a full file listing from '/'

       -M string
              Contact company terminal ID. This is an optional terminal identifier that is included in the basic-environment.txt file.

       -N string
              Contact name. This is an optional contact name that is included in the basic-environment.txt file.

       -O string
              Contact company name. This is an optional company name that is included in the basic-environment.txt file.

       -P string
              Contact phone number. This is an optional phone number that is included in the basic-environment.txt file.

       -Q     Run in quiet mode, no output

       -R directory_path
              Directory path for supportconfig output files

       -S number
              Limit number of included SAR files

       -T seconds
              Binary execution timeout. Some binaries are executed with a timeout value. If the timeout value is exceeded, supportconfig assumes the binary is unresponsive and continues gathering  informa-
              tion.

       -U URI_string
              Sets the upload target URI and initiates an upload. Supported services: ftp, http, https, scp
              Examples:
              supportconfig -r 12345678901 -U 'https://secure-www.novell.com/upload?appname=supportconfig&file={tarball}'
              supportconfig -r 12345678901 -U ftp://ftp.novell.com/incoming

              Uploads the supportconfig tar ball to SUSE's secure server or ftp server respectively, and includes the open service request number.

              supportconfig -U scp://central.server.foo.com/supportconfig/archives

              You might want to create an ssh trusted host configuration for the scp service. This would allow supportconfig to copy the files to the upload target without being prompted for a password.

              supportconfig -U https://secure.server.foo.com/supportconfig/upload.php?file={TARBALL}

              The  "{TARBALL}"  is  a  reserved case insensitive word that supportconfig replaces with the supportconfig tar ball filename. The upload.php script is code you would have to supply that would
              receive the connection and copy the file locally. The supportconfig sends a User-Agent string to the HTTP server called "SupportConfig".

       -W string
              Contact company store ID. This is an optional store identifier that is included in the basic-environment.txt file.

       -X number
              Max system logs line count

       -a     Upload the tar ball to the specified alternate target VAR_OPTION_UPLOAD_ALT

       -b     Switch to screen buffer mode. This mode echos the current action, but not a status. Useful for third party applications running supportconfig.

       -c     Disables curl checks to SUSE update servers. Helpful for local servers. If the server is registered to SMT or SUSE Manager, they are still  checked  and  would  be  checked  instead  of  SUSE
              servers.

       -d     Exclude detailed disk information and scans. Disks are still scanned, but this switch attempts to minimize the disk scans.

       -e     Search root filesystem for eDirectory instances; -L implied. Be patient.

       -f directory
              From directory. Don't collect report files, just use files in that directory.

       -g     Use gzip instead of the default bzip2 compression.

       -i keyword[,keyword]
              Include  keywords.  A  comma separated list of feature keywords that specify which features to include.  Use -F to see a list of valid keywords. Do not use spaces and keywords are case-sensi-
              tive.
              Example:
              supportconfig -i BOOT,aFSLIST,pgroupwise

       -k     Disable automatic kernel module loading. Some of the system commands (ie hwinfo), automatically load kernel modules for probing purposes. On rare occassions these  additional  kernel  modules
              have caused unexpected behavior. This option will not run any system command that is known to load kernel modules. Do not use this option, unless directed by NTS.

       -l     Includes all log file lines. Gathers additional rotated logs. Includes commented lines in all configuration files.

       -m     Only gather a minimum amount of info: basic env, basic health, hardware, rpm, messages, y2logs

       -o keyword[,keyword]
              Toggle  keywords  on or off. A comma separated list of feature keywords that changes the feature state opposite it's current state. For example, if OPTION_PAM is set, -o PAM will turn it off.
              If OPTION_PAM is not set, -o PAM will turn it on.

       -p     Disable all plugin execution

       -q     Add a unique identifier to the supportconfig tar ball filename. You usually do not need this, as hostnames, date and times are unique enough within an organization. However, when uploading to
              Novell or some other central public repository, it is needed.

       -r srnum
              Includes the service request number in the basic-environment.txt file and the tar ball filename. Use this option when uploading (-u) tar balls to SUSE.

       -s     Include full SLP service lists

       -t directory
              Target directory. Just save log files here, do not create tarball. Uses the newest nts_* directory found.

       -u     Uploads the supportconfig tar ball to the specified VAR_OPTION_UPLOAD_TARGET. See supportconfig.conf(5) for more details. The following upload services are supported: ftp, http, https, scp.

       -v     Performs an rpm -V for each installed rpm on systems prior to SLES11. For SLES11 this is included in the Supportability Analysis. NOTE: This takes a long time to complete

       -w     Enable verbose wait trace logging. Shows the start and stop times of each command supportconfig is running.

       -x keyword[,keyword]
              Exclude  keywords.  A  comma separated list of feature keywords that specify which features to exclude.  Use -F to see a list of valid keywords. Do not use spaces and keywords are case-sensi-
              tive.
              Example:
              supportconfig -x aFSLIST,aEDIR,X,SMART

       -y     Gathers full YaST log files.

       Use Ctrl-\ to try and skip a function that is hanging.

ENVIRONMENT
       SC_CONF
              You can use the SC_CONF environment variable to specify an alternate configuration file path.
              Example: export SC_CONF=/opt/supportconfig.conf

FILES
       /etc/supportconfig.conf
              The supportconfig configuration file. See supportconfig.conf(5) for further details.
       /usr/lib/supportconfig/plugins
              The supportconfig plugin directory. See PLUGINS below for further details.

PLUGINS
       You can include your own scripts or applications with the supportconfig tar ball.  Simply create the /usr/lib/supportconfig/plugins directory, and copy your script file there.  The  plugin  will  be
       executed, but not sourced into the supportconfig environment. This means you won't have access to the functions and variables in supportconfig. Any file with execute permissions that sends it's out-
       put to the stdout and stderr is supported.

       For example, say you want to include the pstree output with the supportconfig. Do the following,
       1. mkdir -p /usr/lib/supportconfig/plugins
       2. cp -a /usr/bin/pstree /usr/lib/supportconfig/plugins/
       3. The output will be in the plugin-pstree.txt file.

       Supportconfig will include a text file called plugin-myscript.txt in it's tar ball after executing myscript, where myscript is your plugin filename.  If you don't want to include plugins,  just  run
       supportconfig with the -p parameter.

REPORTING BUGS
       Please submit bug fixes or comments via: http://en.opensuse.org/Supportutils#Reporting_Bugs

AUTHOR
       Jason Record <jrecord@suse.com>

COPYRIGHT
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; version 2 of the License.

       This  program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Gen-
       eral Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, see <http://www.gnu.org/licenses/>.

SEE ALSO
       supportconfig.conf(5) scplugin.rc(3)



supportutils                                                                                     05 Apr 2017                                                                                 SUPPORTCONFIG(8)
