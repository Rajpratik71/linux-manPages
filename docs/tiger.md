TIGER(8)                                                      Administrator Commands                                                      TIGER(8)

NAME
       tiger - UNIX Security Checker

SYNOPSIS
       tiger [-vthqGSH] [-B dir] [-l dir|@host] [-w dir] [-b dir] [-e|-E] [-c config] [-A arch] [-O os] [-R release]

DESCRIPTION
       Tiger  is  a  package  consisting of Bourne Shell scripts, C code and data files which is used for checking for security problems on a UNIX
       system.  It scans system configuration files, file systems, and user configuration files for possible security problems and  reports  them.
       The command tigexp(8) can be used to obtain explanations of the problems reported by tiger.

       You can configure tiger by adjusting the Tiger_ variables in the /etc/tiger/tigerrc configuration file. For each available module (see MOD‐
       ULES below) there is a corresponding variable in the configuration file that determines whether the module is run.  All  of  the  variables
       names start with Tiger_check_ and should be set equal to Y to run, or N to skip. Other configuration variables will modify the behaviour of
       some modules, and should be adjusted based on the operating system.

       The /etc/tiger/tiger.ignore configuration file defines a set of messages that will not be presented in the report even if any of  the  mod‐
       ules  generate them.  If the file exists, all the entries (line by line) are used as extended regular expressions that are compared against
       each message (notice that it will introduce some overhead which grows with the size of the file).  For more information on  this  mechanism
       read the README.ignore document.

OPTIONS
       The following arguments can be used when calling the program:

       -B tigerdir
              Specify the directory where tiger is installed.  If not specified, /usr/lib/tiger is used.

       -l logdir|@logserver
              Specify the name of the directory where tiger will write the security report.  This defaults to /var/log/tiger.  The filename of the
              report will be of the form 'security.report.hostname.date.time'.  If the directory begins with a @, the name will be interpreted  as
              a  tiger  logging server.  Tiger logging's server is currently a server that listens in port (tcp) 5353 on a remote host.  The tiger
              process will just send the results to that server using a telnet connection.

       -w workdir
              Specify a directory to use for creating scratch files.  This defaults to /var/lib/tiger/work.

       -b bindir
              Specify the directory which contains (or will contain) the binaries generated from the C modules.  If the systems  directories  con‐
              tain all the binaries, they will be used directly from there.  If not, then if bindir contains the binaries, these will be used.  If
              none are found in either place, then an attempt will be made to compile the C code and install the executables into bindir.

       -c tigerrc
              Specify an alternate name for the tigerrc control file.  The default is '/etc/tiger/tigerrc'.

       -e     This option will cause explanations to be inserted into the security report following each message.  This can greatly  increase  the
              size of the report, as explanations may appear repeatedly.

       -E     This  option indicates that a separate explanation report should be created, with explanations for each type of message only appear‐
              ing once.  The filename of the explanation report will be of the form 'explain.report.hostname.date.time'.

       -G     Generate the signatures (MD5 hashes and file permissions) for system binary files.

       -H     This option will format the report into HTML creating local links to the problem descriptions.

       -S     This option indicates that a surface level check of the configuration files of any diskless clients served by this machine should be
              checked at the same time.  The checks will not be as in depth as they would be if run on the client itself.

       -q     Suppress messages to be as quiet as possible, only security messages will be shown.

       -A arch
              This  option  overrides  the  default value obtained for the current architecture detected by the internal configuration engine to a
              value defined by the user.

       -O os  This option overrides the default value obtained for the current operating system detected by the internal configuration engine to a
              value defined by the user.

       -R release
              This  option  overrides  the  default value obtained for the current operating system release detected by the internal configuration
              engine to a value defined by the user.

       Notice that changing the real values for the operating system and architecture Tiger is running in might result in scripts being run  which
       are  not  appropriate  to  it, and, as a consequence, unexpected (and potentially dangerous) errors might be generated. When executed Tiger
       will show which operating system, release and architecture thinks it is running in.

MODULES
       Tiger is composed of a series of modules. Each of these modules check specific security issues related to UNIX systems.  The framework pro‐
       vided  by  Tiger allows the provision of both generic modules and those specific for the operating system the software runs in. Modules can
       be executed stand alone, from cron or through the tiger program (which will execute all those available).

       If you want to write additional modules for your system read the README.writemodules document.

       Tiger currently provides the following modules:

       check_accounts
              Checks the accounts provided in the system, looking for disabled accounts with cron, rhosts, .forward, and valid shells.

       check_aliases
              Performs a check for mail aliases and improper configuration.

       check_anonftp
              Determines if the anonymous FTP service is properly configured.

       check_cron
              Validates the cron entries in the system.

       check_embedded
              Determines if embedded pathnames are configured properly.

       check_exports
              Analyses configuration files for NFS exported filesystems to see if access is properly restricted.

       check_group
              Checks the UNIX groups available in the system, looking for conflicts and improper entries.

       check_inetd
              Checks the inetd configuration file: compares against services definition, valid directory paths, non-existent binaries  and  active
              services.

       check_known
              Looks for known intrusion signs including backdoors and mail spools.

       check_netrc
              Checks if users's netrc files are insecurely configured.

       check_nisplus
              Looks for wrong configuration in the NIS+ entries.

       check_passwd
              Checks the UNIX users available in the system, looking for conflicts and improper entries.

       check_path
              Validates the binaries in user's PATHs as well as PATH definitions used by scripts in order to determine insecure definitions.

       check_perms
              Check filepermissions and inconsistencies.

       check_printcap
              Analyses the configuration for the printer control file.

       check_rhosts
              Checks rhosts files in order to see if user's configuration leaves the system open to attack.

       check_sendmail
              Checks  sendmail  configuration files.  check_signatures Compares binary files signatures against those stored in the local database
              (provided with the program).

       check_system
              This module calls the operating system's specific modules available at /usr/lib/tiger/systems/.

       check_apache
              Checks the Apache configuration file and reports on generic issues which might introduce exposures or vulnerabilities in the system.

       check_devices
              Checks for devices's permissions, warning about devices that have world permissions.

       check_exrc
              Analyses .exrc files that are not in user's home directories. The vi command will look for the existence of such a file in the  cur‐
              rent directory, and so may inadvertently perform commands that can compromise your system's security when starting vi or ex.

       check_finddeleted
              Checks  if  deleted files are being used by any process in the current system. This might be an indication of intrusion (a user exe‐
              cuting processes and then deleting its files) or of unpatched servers (which, if not restarted use old library files and  are  still
              vulnerable).

       check_ftpusers
              Analyses the system's /etc/ftpusers and determines if the administrative users are in that file.

       check_issue
              Checks the /etc/issue and /etc/issue.net file to determine if they contain the appropriate content (this is defined in the ISSUEFILE
              and ISSUENETFILE).

       check_logfiles
              Checks for the existence of log files (wtmp, btmp, lastlog and utmp).  It will also check for proper umask settings.

       check_lilo
              Analyses configuration files for lilo and grub boot loaders (Linux-specific).

       check_listeningprocs
              Checks for processes listening on TCP/IP sockets (servers) in the system as well as users running them. Will warn if the  user  run‐
              ning a server is not an authorised one or if the server is listening on all available interfaces.

       check_passwdformat
              Checks the format of the /etc/passwd file in order to determine inconsistencies which indicate an intrusion or misconfiguration.

       check_patches
              Checks  if  patches  are  available for the system (i.e. new packages).  It will use autorpm or apt-get to check this (so this tools
              need to be properly configured). This check is specific to Linux (RedHat or Debian).

       check_root
              Checks if remote root login is allowed to the local system.

       check_rootdir
              Checks the permissions for the root directory.

       check_rootkit
              Tries to find systems which have been rootkited, it does so by looking for trojaned ls and find commands.  It also includes a  wrap‐
              per to run the chkrootkit program and format the results in Tiger's message format.

       check_single
              Checks if the system is properly configured to disallow single-user access. This check is specific to Linux.

       check_release
              Analyses  the  version  of  the operating system and determines if it is too out of date. This check is specific to Linux (RedHat or
              Debian).

       check_runprocs
              This module will check if the processes configured in tigerrc are running currently in the system. If any of the  processes  is  not
              running, Tiger will warn the administrator (this acts as a lightweight software watchdog)

       check_services
              Check  which services are configured in the system (usually in /etc/services) versus the ones that should be configured (in the pro‐
              vided services file)

       check_tcpd
              Tests for the existence of tcp-wrappers and changes in their configuration it also determines which services are running wrapped  in
              tcp-wrappers.

       check_umask
              Check for umask setting in configuration files.

       check_xinetd
              Checks which xinetd services are enabled or disabled.

       crack_run
              Runs a local installation of the Crack program which can be used to determine if local user passwords are easy (or not) to guess.

       tripwire_run aide_run integrit_run
              Wrappers  for  a  number  of integrity checkers, these programs enhance the support of Tiger for MD5 and SHA-1 binary signatures and
              file system permission checks (implemented with the the check_perms and check_signatures scripts).  You should  consider  installing
              any  of  these  three  programs (Tripwire, Aide or Integrit) and use read-only locations (such as CD-ROM) to store the hashes of the
              system.

       deb_checkadvisories
              This module checks against a list of stored Debian Security Advisories in order to see if the system has any package installed whose
              version might be subject to any security vulnerability (Debian-specific).

       deb_checkmd5sums
              Compares the MD5 sums of binary files against those provided after installation.  Changes in these files might be an indication of a
              compromised system (Debian-specific).

       deb_nopackfiles
              Looks for files installed in the system's directories that are not provided by any installed Debian packages (Debian-specific).

FILES
       /etc/tiger/tigerrc
              Configuration file for the Tiger tool.

       /etc/tiger/cronrc
              Configuration file for the Tigercron tool.

       /var/log/tiger
              Location of the log messages generated by Tiger when run through cron.

       /var/lib/tiger/work
              Working directory used by Tiger scripts to create temporary files.

       /etc/tiger/tiger.ignore
              Configuration file that defines which messages generated by modules will be ignored by Tiger and will not be presented in the  final
              report.

SEE ALSO
       tigexp(8)

       There  are also a number of README files that describe in detail the behaviour of Tiger and how it can be used to setup a host-based intru‐
       sion detection system. These can be found in the top directory of the sources or in /usr/lib/tiger once it  is  installed  (in  Debian  the
       location of the full documentation set is /usr/share/doc/tiger/)

BUGS
       There are a lot more things to check.

       Some places in the package are not shell meta-character or white-space safe.

       You can report or read known bugs at the http://savannah.nongnu.org/projects/tiger webpage.

       For Debian-specific (known) bugs read the /usr/share/doc/tiger/README.Debian document or the http://bugs.debian.org/tiger webpage.

AUTHOR
       Tiger  was  originally developed by a team of the Texas A&M University Supercomputer Center, as of September 1993, the development done via
       the Network Group, Computing & Information Services.

       This software was written originally by Douglas Lee Schales, Dave K. Hess, Khalid Warraich, and Dave R. Safford (circa 1993).

       A lot of changes were introduced by the ARSC team (a.k.a. the TARA team)  Liam  Forbes  <lforbes  at  arsc.edu>,  Nathan  Bills  <bills  AT
       arsc.edu> and Mike Kienenberger <mkienenb at arsc.edu>, including support for quite a number of operating systems.

       Current   upstream   maintenance   of   Tiger   is   being  done  by  Javier  Fernandez-Sanguino  Peña  and  coordinated  at  http://savan‐
       nah.nongnu.org/projects/tiger.

       The adaptation for the GNU/Linux operating system was made by Robert L. Ziegler <rlz at mediaone.net>

       The modifications for the Debian GNU/Linux operating system have been made by Javier Fernandez-Sanguino Peña <jfs at computer.org>, includ‐
       ing  a  number  of  checks  for  the  GNU/Linux operating systems (check_listeningprocs) and some specific for Debian (deb_checkadvisories,
       deb_checkmd5sums and deb_nopackfiles).

Security                                                          12 August 2003                                                          TIGER(8)
