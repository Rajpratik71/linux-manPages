RUNIDN(1)                                                                                  General Commands Manual                                                                                  RUNIDN(1)



NAME
       runidn - A script to allow applications to use internationalized domain names.

SYNOPSIS
       runidn [-e local-codeset] program-name [args..]

DESCRIPTION
       runidn enables applications to use internationalized domain names without recompilation.  Just add ``runidn'' before the application-name, and the application can handle non-ASCII domain names.  For
       example, you can do:

           % runidn telnet non-ASCII-hostname

       Before using runidn, you should set up properties related to internationalized DNS by configuring idnkit's configuration file idn.conf.  See idn.conf(5) which describes the configuration.

OPTION
       The following option is available:

       -e local-codeset
           Specify the application's local codeset.  If the option is not specified, runidn guesses the codeset from the current locale.  See the ``NOTE'' section for more details about local codeset.

IMPLEMENTATION
       runidn is a small shell script that sets up an environment variable called ``LD_PRELOAD'', so that an application dynamically  links  a  shared  library  ``libidnkitres''  before  any  other  shared
       libraries.

       The  library ``libidnkitres'' provides a special version of resolver functions which implement features for handling internationalized domain names.  runidn replaces the following functions with the
       special version:

           gethostbyname
           gethostbyname2
           gethostbyaddr
           gethostbyname_r
           gethostbyname2_r
           gethostbyaddr_r
           getipnodebyname
           getipnodebyaddr
           freehostent
           getaddrinfo
           freeaddrinfo
           getnameinfo

       By overriding them in the standard libraries with the special version provided by ``libidnkitres'', runidn enables applications to use internationalized domain names.

           · These API functions accept non-ASCII domain names encoded in the local codeset that the application is using.  Also the result from these APIs may contain non-ASCII domain names.

           · The normalization and codeset conversion between application's local codeset and the codeset used in DNS protocol data are handled automatically, so users/applications  need  not  worry  about
             them.

       Properties  of  internationalized  DNS  (such  as  the normalization or the codeset used on DNS protocol data) can be configured with the idnkit's configuration file (idn.conf).  See idn.conf(5) for
       details.

NOTE
       Unless -e option is specified, runidn tries to guess the application's local codeset from the application's current locale.  However, sometimes it cannot guess the codeset correctly, for example  if
       the  application does not set the locale appropriately by calling `setlocale()'.  In that case, you can explicitly specify the local codeset by setting an environment variable ``IDN_LOCAL_CODESET''.
       See the section ``LOCAL CODESET'' in idn.conf(5) for details.

       The idea of using ``LD_PRELOAD'' to replace some functions in the standard library was taken from ``runsocks'' script distributed as part of SOCKS5 reference implementation.

BUGS
       There are many cases where runidn does not work.

       Your system must support ``LD_PRELOAD'' mechanism in the first place.

       Due to security reasons, ``LD_PRELOAD'' mechanism is disabled for setuid programs in any sane systems.  So runidn does not work for setuid programs such as ping or rsh.

       If your application uses a function other than the ones runidn supports for name resolution, you lose.

SEE ALSO
       idn.conf(5), runsocks(1)



                                                                                                April 6, 2001                                                                                       RUNIDN(1)
