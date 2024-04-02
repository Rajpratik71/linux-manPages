AMGETCONF(8)                                                                            System Administration Commands                                                                           AMGETCONF(8)



NAME
       amgetconf - look up configuration parameters and manipulate debug logs

SYNOPSIS
       amgetconf [-l|--list] [--client] [--execute-where client|server] [-o configoption...] [config] parameter

DESCRIPTION
       Amgetconf has three main jobs: to fetch configuration information from the Amanda configuration; to fetch build-time configuration values; and to open and close debug logs for shell scripts. Each is
       treated in its own subsection, below.

       If config is not specified, amgetconf assumes it is being run from the configuration directory and that amanda.conf is present. The order of options and arguments does not matter.  parameter is
       always case-insensitive, and '-' and '_' are treated as identical, just as in amanda.conf(5).

       See the "CONFIGURATION OVERRIDE" section in amanda(8) for information on the -o option.

   AMANDA CONFIGURATION
       If parameter is a configuration keyword (from amanda.conf(5)), then amgetconf will return the corresponding value. For keywords which can take multiple values, amgetconf will return all values, one
       on each line.

       Values in configuration subsections are specified with parameters of the form TYPE:NAME:PARAMETER, where TYPE is the subsection type (one of dumptype, tapetype, interface, holdingdisk,
       application-tool, or script-tool; NAME is the name of the subsection (e.g., user-tar), and PARAMETER is the name of the disired parameter within that subsection.

       The --list option lists the subsections of a certain type, where the type is givein as the parameter.

       The --client option is equivalent to --execute-where server (below).

       The --execute-where option tells amgetconf whether to operate on the client or the server; the server is the default.

   BUILD CONFIGURATION
       If parameter begins with build., then the following name is a build environment variable. Variables without a value (e.g.  XFSDUMP on a system that does not support that type of file system) will
       not report an error and will return an empty string as the value. Some boolean variables (e.g.  USE_AMANDAHOSTS) will return 1 if the flag is set or an empty string if it is not, while others return
       yes or no, as indicated below (the difference is historical).

       Combining the --list option with the parameter build will enumerate all available build parameters.

       Build Parameters

       bindir, sbindir, libexecdir, mandir
           Install directories

       AMANDA_TMPDIR, CONFIG_DIR, AMANDA_DBGDIR, GNUTAR_LISTED_INCREMENTAL_DIR
           Runtime directories

       listed_inc_dir
           Same as GNUTAR_LISTED_INCREMENTAL_DIR

       CC, VERSION, ASSERTIONS, LOCKING
           Build information.  ASSERTIONS is 1 or empty.

       DUMP, RESTORE, VDUMP, VRESTORE, XFSDUMP, XFSRESTORE, VXDUMP, VXRESTORE, SAMBA_CLIENT, GNUTAR, STAR, COMPRESS_PATH, UNCOMPRESS_PATH
           Paths to various utility progarms (empty if they are not found or not used)

       AIX_BACKUP
           Is DUMP the AIX backup program? (empty or 1)

       DUMP_RETURNS_1
           Does DUMP return 1 on success? (empty or 1)

       BSD_SECURITY, BSDUDP_SECURITY, BSDTCP_SECURITY, KRB5_SECURITY, SSH_SECURITY, RSH_SECURITY
           Indicate which authentication mechanisms are available (yes or no).

       USE_AMANDAHOSTS
           Should the "bsd" authentication mechanism use amandahosts? (yes or no).

       AMANDA_DEBUG_DAYS
           Number of days after which debug logs are deleted.

       DEFAULT_SERVER, DEFAULT_CONFIG, DEFAULT_TAPE_SERVER, DEFAULT_TAPE_DEVICE
           Default values for configuration parameters

       CLIENT_LOGIN
           Userid under which the client runs (from --with-user).

       USE_RUNDUMP
           Should Amanda use the rundump wrapper? (empty or 1)

       CHECK_USERID
           Does Amanda check that userids are correct? (empty or 1)

       COMPRESS_SUFFIX, COMPRESS_FAST_OPT, COMPRESS_BEST_OPT, UNCOMPRESS_OPT
           Command-line options for the compression program.

       TICKET_LIFETIME, SERVER_HOST_PRINCIPAL, SERVER_HOST_INSTANCE, SERVER_HOST_KEY_FILE, CLIENT_HOST_PRINCIPAL, CLIENT_HOST_INSTANCE, CLIENT_HOST_KEY_FILE
           Kerberos parameters.

   DEBUG LOG MANAGEMENT
           Note
           That this application is responsible for debug logs is a historical quirk, but the functionality is widely used.

       If parameter begins with dbopen., the string following the period is a program name and an Amanda debug file will be created for the caller. The name of the logfile is returned.

       If parameter begins with dbclose., the string following the period is a program name previously used with dbopen., followed by a colon (:) and the previously opened file name. The name of the
       logfile is returned.

EXAMPLES
       Find out the path to the log file directory:
       % amgetconf daily logdir
       /usr/local/etc/amanda/daily/logs

       Find out the current tape type:
       % amgetconf daily tapetype
       DLT4000-IV

       Find out that tape type's length:
       % amgetconf daily tapetype:DLT4000-IV:length
       1024000

       List the other available tapetype:
       % amgetconf daily --list tapetype
       DISK
       QIC-60
       DEC-DLT2000
       ...

       Find out the configuration directory:
       % amgetconf build.CONFIG_DIR
       /usr/local/etc/amanda/

       List all build-time parameters
       % amgetconf --list build
       AIX_BACKUP
       AMANDA_DBGDIR
       AMANDA_DEBUG_DAYS
       ...

       Create, use and close a debug file in a script:
       % debug_file=`amgetconf daily dbopen.myscript`
       % echo debug information >> $debug_file
       % amgetconf daily dbclose.myscript:$debug_file

MESSAGES
       amgetconf: no such parameter param
           Parameter param is not a known keyword (e.g. not a valid amanda.conf keyword).

SEE ALSO
       amanda(8), amanda.conf(5), amanda-client.conf(5)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHOR
       Jean-Louis Martineau <martineau@zmanda.com>
           Zmanda, Inc. (http://www.zmanda.com)



Amanda 3.3.3                                                                                      01/10/2013                                                                                     AMGETCONF(8)
