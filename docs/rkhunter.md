rkhunter(8)                                                   System Manager's Manual                                                  rkhunter(8)

NAME
       rkhunter - RootKit Hunter

SYNOPSIS
       rkhunter {--check | --unlock | --update | --versioncheck |
                 --propupd [{filename | directory | package name},...] |
                 --list [tests | {lang | languages} | rootkits | perl |
                         propfiles] |
                 --config-check | --version | --help} [options]

DESCRIPTION
       rkhunter  is a shell script which carries out various checks on the local system to try and detect known rootkits and malware. It also per‐
       forms checks to see if commands have been modified, if the system startup files have been modified,  and  various  checks  on  the  network
       interfaces, including checks for listening applications.

       rkhunter  has been written to be as generic as possible, and so should run on most Linux and UNIX systems. It is provided with some support
       scripts should certain commands be missing from the system, and some of these are perl scripts.  rkhunter does require certain commands  to
       be  present  for  it  to be able to execute. Additionally, some tests require specific commands, but if these are not present then the test
       will be skipped. rkhunter needs to be run under a Bourne-type shell, typically bash or ksh. rkhunter can be run as a cron job or  from  the
       command-line.

COMMAND OPTIONS
       If no command option is given, then --help is assumed.  rkhunter will return a non-zero exit code if any error or warning occurs.

       -c, --check
              This  command option tells rkhunter to perform various checks on the local system. The result of each test will be displayed on std‐
              out. If anything suspicious is found, then a warning will be displayed. A log file of the tests and the results  will  be  automati‐
              cally produced.

              It is suggested that this command option is run regularly in order to ensure that the system has not been compromised.

       --unlock
              This command option simply unlocks (removes) the lock file. If this option is used on its own, then no log file is created.

       --update
              This  command option causes rkhunter to check if there is a later version of any of its text data files. A command-line web browser,
              for example wget or lynx, must be present on the system when using this option.

              It is suggested that this command option is run regularly in order to ensure that the data files are kept up to date.

              If this option is used via cron, then it is recommended that the --nocolors option is also used.

              An exit code of zero for this command option means that no updates were available. An exit code of one means that a  download  error
              occurred, and a code of two means that no error occurred but updates were available and have been installed.

       --propupd [{filename | directory | package name},...]
              One  of  the checks rkhunter performs is to compare various current file properties of various commands, against those it has previ‐
              ously stored. This command option causes rkhunter to update its data file of stored values with the current values.

              If the filename option is used, then it must either be a full pathname, or a plain file name (for example, 'awk'). When  used,  then
              only the entry in the file properties database for that file will be updated. If the directory option is used, then only those files
              listed in the database that are in the given directory will be updated. Similarly, if the package name option  is  used,  then  only
              those  files  in the database which are part of the specified package will be updated. The package name must be the base part of the
              name, no version numbers should be included - for example, 'coreutils'. Package names will, of course, only be stored  in  the  file
              properties  database  if  a  package manager is being used. If a package name is the same as a file name - for example, 'file' could
              refer to the 'file' command or to the RPM 'file' package (which contains the 'file' command) - the package name will be used.  If no
              specific option is given, then the entire database is updated.

              WARNING:  It is the users responsibility to ensure that the files on the system are genuine and from a reliable source. rkhunter can
              only report if a file has changed, but not on what has caused the change. Hence, if a file has changed, and  the  --propupd  command
              option is used, then rkhunter will assume that the file is genuine.

       --versioncheck
              This  command option causes rkhunter to check if there is a later version of the program. A command-line web browser must be present
              on the system when using this option.

              If this option is used via cron, then it is recommended that the --nocolors option is also used.

              An exit code of zero for this command option means that no new version was available. An exit  code  of  one  means  that  an  error
              occurred downloading the latest version number, and a code of two means that no error occurred but a new version is available.

       --list [tests | {lang | languages} | rootkits | perl | propfiles]
              This command option will list some of the supported capabilities of the program, and then exit. The tests option lists the currently
              available test names (see the README file for more details about test names). The languages option  lists  the  currently  available
              languages, and the rootkits option lists the rootkits that are searched for by rkhunter. The perl option lists the installation sta‐
              tus of the perl command and perl modules that may be used by some of the tests. Note that it is not required to install  these  mod‐
              ules.  However,  if rkhunter is forced to use perl to execute a test then the module must be present. The propfiles option will list
              the file names that are used to generate the file properties database. If no specific option is given, then all  the  lists,  except
              for the file properties database, are displayed.

       -C, --config-check
              This  command option causes rkhunter to check its configuration file(s), and then exit. The program will run through its normal con‐
              figuration checks as specified by the enable and disable options on the command-line and in the configuration files. That  is,  only
              the configuration options for tests which would normally run are checked. In order to check all the configured options, then use the
              --enable all --disable none options on the command line. Additionally, the program will check to see if there are  any  unrecognised
              configuration options. If any configuration problems are found, then they will be displayed and the return code will be set to 1.

              It is suggested that this option is used whenever the configuration file(s) have been changed.

       -V, --version
              This command option causes rkhunter to display its version number, and then exit.

       -h, --help
              This command option displays the help screen menu, and then exits.

OPTIONS
       rkhunter  uses  a  configuration  file,  named rkhunter.conf, for many of its configuration options. It will also use a local configuration
       file, named rkhunter.conf.local, if it is present. However, some options can also be specified on the command-line, and these will override
       the configuration file options. The configuration file options are well documented within the main configuration file itself. The following
       are the command-line options. The defaults mentioned here are the program defaults, unless explicitly  stated  as  the  configuration  file
       default.

       --appendlog
              By  default  a new log file will be created when rkhunter runs, and the previous log file will be renamed by having .old appended to
              its name.  This option tells rkhunter to append to the existing log file. If the log file does not exist, then it will be created.

       --bindir <directory>...
              This option modifies which directories rkhunter looks in to find the various commands it requires (that is, its PATH).  The  default
              is  the root PATH, and an internal list of some common command directories. By default a specified directory will be appended to the
              default list. However, if the directory name begins with the '+' character, then it will be prepended to the list (that is, it  will
              be put at the start of the list).

       --cs2, --color-set2
              By  default  rkhunter  will  display its test results in color. The colors used are green for successful tests, red for failed tests
              (warnings), and yellow for skipped tests. These colors are visible when a black background is used, but are difficult to  see  on  a
              white background. This option tells rkhunter to use a different color set which is more suited to a white background.

       --configfile <file>
              The  installation  process  will  automatically  tell  rkhunter where its configuration file is located. However, if necessary, this
              option can be used to specify a different pathname.

              If a local configuration file is to be used, then it must reside in the same directory as the configuration file specified  by  this
              option.

       --cronjob
              This is similar to the --check command option, but it disables several of the interactive options. When this option is used --check,
              --nocolors and --skip-keypress are assumed. By default no output is sent to stdout, so the --report-warnings-only option may be use‐
              ful with this option.

       --dbdir <directory>
              The  installation  process  will  automatically  configure where the data files are stored for rkhunter. However, if necessary, this
              option can be used to specify a different directory. The directory can be read-only, after installation, provided  that  neither  of
              the  --update  or --propupd options are specified, and that the --versioncheck option is not specified if ROTATE_MIRRORS is set to 1
              in the configuration file.

       --debug
              This is a special option mainly for the developers. It produces no output on stdout. Regular logging will continue as per default or
              as  specified  by  the  --logfile  option,  and  the  debug  output  will  be  in  a  randomly  generated filename which starts with
              /tmp/rkhunter-debug.

       --disable <test>[,<test>...]
              This option tells rkhunter not to run the specified tests. Read the README file for more information about test names. By default no
              tests are disabled.

       --display-logfile
              This option will cause the logfile to be displayed on the screen once rkhunter has finished.

       --enable <test>[,<test>...]
              This  option  tells  rkhunter to only run the specified tests. If only one test name, other than all, is given, then the --skip-key‐
              press option is assumed. Read the README file for more information about test names. By default all tests are enabled. All the  test
              names are listed below under TESTS.

       --hash {MD5 | SHA1 | SHA224 | SHA256 | SHA384 | SHA512 |
               NONE | <command>}
              Both  the  file  properties check and the --propupd command option will use a hash function to determine a files current hash value.
              This option tells rkhunter which hash function to use. The MD5 and SHA options will look for  the  relevant  command,  and,  if  not
              found,  a perl support script will then be used to see if a perl module supporting the function has been installed. Alternatively, a
              specific command may be specified. A value of NONE can be used to indicate that the hash values should not be obtained  or  used  as
              part of the file properties check. The default is SHA1, or MD5 if no SHA1 command can be found.

              Systems using prelinking must use either MD5, SHA1 or NONE.

       --lang, --language <language>
              This  option  specifies which language to use for the displayed tests and results.  The currently supported languages can be seen by
              the --list command option. The default is en (English). If a message to be displayed cannot be found in the language file, then  the
              English version will be used. As such, the English language file must always be present. The --update command option will update the
              language files when new versions are available.

       -l, --logfile [file]
              By default rkhunter will write out a log file. The default location of the file is /var/log/rkhunter.log. However, this location can
              be changed by using this option. If /dev/null is specified as the log file, then no log file will be written. If no specific file is
              given, then the default will be used. By default rkhunter will create a new log file each time it is run.  Any  previously  existing
              logfile is moved out of the way, and has .old appended to it.

       --noappend-log
              This option reverts rkhunter to its default behaviour of creating a new log file rather than appending to it.

       --nocf
              This  option  is only valid when the command-line --disable option is used.  When the --disable option is used, by default, the con‐
              figuration file option to disable tests is also used to determine which tests to run. If only the --disable option is to be used  to
              determine which tests to run, then --nocf must be given.

       --nocolors
              This  option  causes  the result of each test to not be displayed in a specific color. The default color, usually the reverse of the
              background color, will be used (typically this is just black and white).

       --nolog
              This option tells rkhunter not to write anything to a log file.

       --nomow, --no-mail-on-warning
              The configuration file has an option which will cause a simple email message to be sent to a user should rkhunter detect  any  warn‐
              ings  during  system  checks.  This  command-line option overrides the configuration file option, and prevents an email message from
              being sent. The configuration file default is not to email a message.

       --ns, --nosummary
              When the --check command option is used, by default a short summary of results is displayed at the end.  This  option  prevents  the
              summary from being displayed.

       --novl, --no-verbose-logging
              During  some  tests rkhunter will log a lot of information. Use of this option reduces the amount of logging, and so can improve the
              performance of rkhunter. However, the log file will contain less information should any warnings occur. By default  verbose  logging
              is enabled.

       --pkgmgr {RPM | DPKG | BSD | SOLARIS | NONE}
              This  option is used during the file properties check or when the --propupd command option is given. It tells rkhunter that the cur‐
              rent file property values should be obtained from the relevant package manager.  See the  README  file  for  more  details  of  this
              option. The default is NONE, which means not to use a package manager.

       -q, --quiet
              This option tells rkhunter not to display any output. It can be useful when only the exit code is going to be checked. Other options
              may be used with this one, to force only specific items to be displayed.

       --rwo, --report-warnings-only
              This option causes only warning messages to be displayed. This can be useful when rkhunter is run via cron.  Other  options  may  be
              used to force other items of information to be displayed.

       --sk, --skip-keypress
              When the --check command option is used, after certain sections of tests, the user will be prompted to press the return key in order
              to continue. This option disables that feature, and rkhunter will run until all the tests have completed.

              If this option has not been given, and the user is prompted to press the return key, a single 's' character, in upper- or lowercase,
              may  be  given followed by the return key. rkhunter will then continue the tests without prompting the user again (as if this option
              had been given).

       --summary
              This option will cause the summary of test results to be displayed. This is the default.

       --syslog [facility.priority]
              When the --check command option is used, this option will cause the start and finish times to be logged to syslog.  The  default  is
              not to log anything to syslog, but if the option is used, then the default level is authpriv.notice.

       --tmpdir <directory>
              The  installation  process  will automatically configure where temporary files are to be created. However, if necessary, this option
              can be used to specify a different directory. The directory must not be a symbolic link, and must be secure (root access only).

       --vl, --verbose-logging
              This option tells rkhunter that when it runs some tests, it should log as much information as possible. This can be useful when try‐
              ing to diagnose why a warning has occurred, but it obviously also takes more time. The default is to use verbose logging.

       -x, --autox
              When  this option is used, rkhunter will try and detect if the X Window system is in use. If it is in use, then the second color set
              will automatically be used (see the --color-set2 option). This allows rkhunter to be run on, for example, a server console (where  X
              is not present, so the default color set should be used), and on a users terminal (where X is in use, so the second color set should
              be used). In both cases rkhunter will use the correct color set. The configuration file default is to try and detect X.

       -X, --no-autox
              This option prevents rkhunter from automatically detecting if the X Window system is being used. See the --autox option.

TESTS
       [This section to be written]

       additional_rkts
              This test is for SHORT_EXPLANATION. It works as part of GROUP. Corresponding configuration file entries: ONE=one,  TWO=two  and  for
              white-listing THREE=three,three. Simple globbing (/dev/shm/file-*) works.

       all

       apps

       attributes

       avail_modules

       deleted_files

       filesystem

       group_accounts

       group_changes

       hashes

       hidden_ports

       hidden_procs

       immutable

       known_rkts

       loaded_modules

       local_host

       malware

       network

       none

       os_specific

       other_malware

       packet_cap_apps

       passwd_changes

       ports

       possible_rkt_files

       possible_rkt_strings

       promisc

       properties

       rootkits

       running_procs

       scripts

       shared_libs

       shared_libs_path

       startup_files

       startup_malware

       strings

       suspscan

       system_commands

       system_configs

       trojans

FILES
       (For a default installation)
       /etc/rkhunter.conf
       /var/log/rkhunter.log

SEE ALSO
       See the CHANGELOG file for recent changes.
       The README file has information about installing rkhunter, as well as specific sections on test names and using package managers.
       The FAQ file should also answer some questions.

LICENSING
       RootKit Hunter is licensed under the GPL, copyright Michael Boelen.  See the LICENSE file for details of GPL licensing.

CONTACT INFORMATION
       RootKit  Hunter  is  under  active development by the RootKit Hunter project team. For reporting bugs, updates, patches, comments and ques‐
       tions, please go to http://rkhunter.sourceforge.net/

                                                                   January 2014                                                        rkhunter(8)
