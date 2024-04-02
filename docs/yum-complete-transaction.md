yum-complete-transaction(8)                                                                                                                                                       yum-complete-transaction(8)



NAME
       yum-complete-transaction - attempt to complete failed or aborted Yum transactions

SYNOPSIS
       yum-complete-transaction [options]

GENERAL OPTIONS
       -h, --help
              Help; display a help message and then quit.

       --cleanup-only
              Only clean up only transaction journal files and exit.


DESCRIPTION
       yum-complete-transaction is a program which finds incomplete or aborted yum transactions on a system and attempts to complete them. It looks at the transaction-all* and transaction-done* files which
       can normally be found in /var/lib/yum if a yum transaction aborted in the middle of execution.

       If it finds more than one unfinished transaction it will attempt to complete the most recent one first. You can run it more than once to clean up all unfinished transactions.

FILES
       As yum-complete-transaction uses YUM libraries for retrieving all the information, it relies on YUM configuration for its default values like which repositories to use. Consult YUM documentation for
       details:

       /etc/yum.conf
       /etc/yum/repos.d/
       /var/cache/yum/


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.


BUGS
       There  are  of  course  no  bugs, but should you find any, you should first consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful in finding a resolution contact the mailing
       list: yum-devel@lists.baseurl.org.  To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos related bugs and http://yum.baseurl.org/report for all other bugs.




Seth Vidal                                                                                     10 December 2007                                                                   yum-complete-transaction(8)
