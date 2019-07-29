Logcheck(8)                                                   System Manager's Manual                                                  Logcheck(8)

NAME
       logcheck — program to scan system logs for interesting lines

SYNOPSIS
       logcheck [OPTIONS]

DESCRIPTION
       The  logcheck  program helps spot problems and security violations in your logfiles automatically and will send the results to you periodi‐
       cally in an e-mail. By default logcheck runs as an hourly cronjob just off the hour and after every reboot.

       logcheck supports three level of filtering: "paranoid" is for high-security machines running as few services as possible. Don't use  it  if
       you  can't handle its verbose messages.  "server" is the default and contains rules for many different daemons.  "workstation" is for shel‐
       tered machines and filters most of the messages.  The ignore rules work in additive manner. "paranoid" rules are  also  included  at  level
       "server". "workstation" level includes both "paranoid" and "server" rules.

       The  messages  reported  are  sorted into three layers, system events, security events and attack alerts. The verbosity of system events is
       controlled by which level you choose, paranoid, server or workstation.  However, security events and attack  alerts  are  not  affected  by
       this.

EXAMPLES
       logcheck  can  be  invoked directly thanks to su(8) or sudo(8), which change the user ID. The following example checks the logfiles without
       updating the offset and outputs everything to STDOUT.

       sudo -u logcheck logcheck -o -t

OPTIONS
       A summary of options is included below.

       -c CFG    Overrule default configuration file.

       -d        Debug mode.

       -h        Show usage information.

       -H        Use this hostname string in the subject of logcheck mail.

       -l LOG    Run logfile through logcheck.

       -L CFG    Overrule default logfiles list.

       -m        Mail report to recipient.

       -o        STDOUT mode, not sending mail.

       -p        Set the report level to "paranoid".

       -r DIR    Overrule default rules directory.

       -R        Adds "Reboot:" to the email subject line.

       -s        Set the report level to "server".

       -S DIR    Overrule default state directory.

       -t        Testing mode does not update offset.

       -T        Do not remove the TMPDIR.

       -u        Enable syslog-summary.

       -v        Print current version.

       -w        Set the report level to "workstation".

FILES
       /etc/logcheck/logcheck.conf is the main configuration file.

       /etc/logcheck/logcheck.logfiles is the list of files to monitor.

       /usr/share/doc/logcheck-database/README.logcheck-database.gz for hints on how to write, test and maintain rules.

EXIT STATUS
       0 upon success; 1 upon failure

SEE ALSO
       logtail(8)

AUTHOR
       logcheck is developed by Debian logcheck Team at alioth: http://alioth.debian.org/projects/logcheck/.

       This manual page was written by Jon Middleton.

                                                                                                                                       Logcheck(8)
