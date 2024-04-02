Lynis(8)                                                Unix System Administrator's Manual                                                Lynis(8)

NAME
        Lynis - System and security auditing tool

SYNOPSIS
       lynis [scan mode] [other options]

DESCRIPTION
       Lynis  is  a  security  auditing  tool for Linux, Mac OSX, and UNIX systems. It checks the system and the software configuration, to see if
       there is any room for improvement the security defenses. All details are stored in a log file. Findings and other discovered data is stored
       in  a  report  file.  This can be used to compare differences between audits. Lynis can run interactively or as a cronjob. Root permissions
       (e.g. sudo) are not required, however provide more details during the audit.

       The following system areas may be checked:

              - Boot loader files

              - Configuration files

              - Software packages

              - Directories and files related to logging and auditing

FIRST TIME USAGE
       When running Lynis for the first time, run: lynis audit system

COMMON SCAN TYPES
       audit system
              Performs a system audit, which is the most common audit.

       audit system remote <host>
              Provide commands to do a remote scan.

       For more scan modes, see the helper utilities.

OPTIONS
       --auditor <full name>
              Define the name of the auditor/pen-tester. When a full name is used, add double quotes, like "Your Name".

       --checkall (or -c)
              Lynis performs a full check of the system, printing out the results of each test to stdout. Additional  information  will  be  saved
              into a log file (default is /var/log/lynis.log). This option invokes scan mode "audit system".

              In case the outcome of a scan needs to be automated, use the report file.

       --config
              Show which settings file or profile is being used, then quit.

       --cronjob
              Perform automatic scan with cron safe options (no colors, no questions, no breaks).

       --debug
              Display debug information to screen for troubleshooting purposes.

       --developer
              Display developer information when creating tests.

       --dump-options
              Show all available parameters.

       --logfile </path/to/logfile>
              Defines location and name of log file, instead of default /var/log/lynis.log.

       --no-colors
              Do not use colors for messages, warnings and sections.

       --no-log
              Redirect all logging information to /dev/null, prevent sensitive information to be written to disk.

       --pentest
              Run a non-privileged scan, usually for penetration testing. Some of the tests will be skipped if they require root permissions.

       --plugin-dir </path/to/plugins>
              Define location where plugins can be found.

       --profile <file>
              Provide alternative profile to perform the scan.

       --quick (-Q)
              Do a quick scan (don't wait for user input).

       --quiet (-q)
              Run quietly and do not show anything to the screen. Will also enable quick mode.

       --report-file <file>
              Provide an alternative name for report file.

       --reverse-colors
              Optimize screen output for light backgrounds.

       --skip-plugins
              Do not run plugins.

       --tests TEST-IDs
              Only run the specific test(s). When using multiple tests, add quotes around the line.

       --tests-from-group <group>
              Only perform tests from particular group of tests. Use 'show groups' to determine valid options.

       --upload
              Upload data to Lynis Enterprise server.

       --wait Wait for user to continue. This adds a break after each section (opposed of --quick).

       --warnings-only
              Run quietly, except warnings.

              Multiple parameters are allowed, though some parameters can only be used together with others. When running Lynis without any param‐
              eters, help will be shown and the program will exit.

HELPERS
       Lynis has special helpers to do certain tasks. This way the framework of Lynis is used, while at the same time storing most  of  the  func‐
       tionality in a separated file. This speeds up execution and keeps the code clean.

       audit  Run audit on the system or on other targets

       show   Provide details about Lynis

       update Run updater utility

       To use a helper, run Lynis followed by the helper name.

EXIT CODES
       Lynis uses exit codes to signal any invoking script. Currently the following codes are used:

       0      Program exited normally

       1      Fatal error

       64     An unknown parameter is used, or incomplete

       65     Incorrect data encountered

       66     Can't open file or directory

       78     Lynis found 1 or more warnings or configurations errors (with error-on-warnings=yes)

BUGS
       Bugs can be reported via GitHub at https://github.com/CISOfy/lynis

DOCUMENTATION
       Supporting documentation can be found via https://cisofy.com/support/

LICENSING
       Lynis  is  licensed as GPL v3. It was created by Michael Boelen in 2007. Development has been taken over by CISOfy. Plugins may have a dif‐
       ferent license.

CONTACT INFORMATION
       Support requests and project related questions can be addressed via e-mail: lynis-dev@cisofy.com.

1.25                                                                18 Aug 2016                                                           Lynis(8)
