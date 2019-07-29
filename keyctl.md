KEYCTL(1)                                                 Linux Key Management Utilities                                                 KEYCTL(1)

NAME
       keyctl - Key management facility control

SYNOPSIS
       keyctl --version
       keyctl show [-x] [<keyring>]
       keyctl add <type> <desc> <data> <keyring>
       keyctl padd <type> <desc> <keyring>
       keyctl request <type> <desc> [<dest_keyring>]
       keyctl request2 <type> <desc> <info> [<dest_keyring>]
       keyctl prequest2 <type> <desc> [<dest_keyring>]
       keyctl update <key> <data>
       keyctl pupdate <key>
       keyctl newring <name> <keyring>
       keyctl revoke <key>
       keyctl clear <keyring>
       keyctl link <key> <keyring>
       keyctl unlink <key> [<keyring>]
       keyctl search <keyring> <type> <desc> [<dest_keyring>]
       keyctl read <key>
       keyctl pipe <key>
       keyctl print <key>
       keyctl list <keyring>
       keyctl rlist <keyring>
       keyctl describe <keyring>
       keyctl rdescribe <keyring> [sep]
       keyctl chown <key> <uid>
       keyctl chgrp <key> <gid>
       keyctl setperm <key> <mask>
       keyctl new_session
       keyctl session
       keyctl session - [<prog> <arg1> <arg2> ...]
       keyctl session <name> [<prog> <arg1> <arg2> ...]
       keyctl instantiate <key> <data> <keyring>
       keyctl pinstantiate <key> <keyring>
       keyctl negate <key> <timeout> <keyring>
       keyctl reject <key> <timeout> <error> <keyring>
       keyctl timeout <key> <timeout>
       keyctl security <key>
       keyctl reap [-v]
       keyctl purge <type>
       keyctl purge [-i] [-p] <type> <desc>
       keyctl purge -s <type> <desc>
       keyctl get_persistent <keyring> [<uid>]

DESCRIPTION
       This program is used to control the key management facility in various ways using a variety of subcommands.

KEY IDENTIFIERS
       The key identifiers passed to or returned from keyctl are, in general, positive integers. There are, however, some special values with spe‐
       cial meanings that can be passed as arguments:

       (*) No key: 0

       (*) Thread keyring: @t or -1

       Each thread may have its own keyring. This is searched first, before all others. The thread keyring is replaced by (v)fork, exec and clone.

       (*) Process keyring: @p or -2

       Each process (thread group) may have its own keyring. This is shared between all members of a group and will be searched after  the  thread
       keyring. The process keyring is replaced by (v)fork and exec.

       (*) Session keyring: @s or -3

       Each  process subscribes to a session keyring that is inherited across (v)fork, exec and clone. This is searched after the process keyring.
       Session keyrings can be named and an extant keyring can be joined in place of a process's current session keyring.

       (*) User specific keyring: @u or -4

       This keyring is shared between all the processes owned by a particular user. It isn't searched directly, but is normally linked to from the
       session keyring.

       (*) User default session keyring: @us or -5

       This is the default session keyring for a particular user. Login processes that change to a particular user will bind to this session until
       another session is set.

       (*) Group specific keyring: @g or -6

       This is a place holder for a group specific keyring, but is not actually implemented yet in the kernel.

       (*) Assumed request_key authorisation key: @a or -7

       This selects the authorisation key provided to the request_key() helper to permit it to access the callers  keyrings  and  instantiate  the
       target key.

       (*) Keyring by name: %:<name>

       A named keyring.  This will be searched for in the process's keyrings and in /proc/keys.

       (*) Key by name: %<type>:<name>

       A named key of the given type.  This will be searched for in the process's keyrings and in /proc/keys.

COMMAND SYNTAX
       Any  non-ambiguous shortening of a command name may be used in lieu of the full command name. This facility should not be used in scripting
       as new commands may be added in future that then cause ambiguity.

       (*) Display the package version number

       keyctl --version

       This command prints the package version number and build date and exits:

              testbox>keyctl --version
              keyctl from keyutils-1.5.3 (Built 2011-08-24)

       (*) Show process keyrings

       keyctl show [-x] [<keyring>]

       By default this command recursively shows what keyrings a process is subscribed to and what keys and keyrings they contain.  If  a  keyring
       is specified then that keyring will be dumped instead.  If -x is specified then the keyring IDs will be dumped in hex instead of decimal.

       (*) Add a key to a keyring

       keyctl add <type> <desc> <data> <keyring>
       keyctl padd <type> <desc> <keyring>

       This  command  creates  a  key  of the specified type and description; instantiates it with the given data and attaches it to the specified
       keyring. It then prints the new key's ID on stdout:

              testbox>keyctl add user mykey stuff @u
              26

       The padd variant of the command reads the data from stdin rather than taking it from the command line:

              testbox>echo -n stuff | keyctl padd user mykey @u
              26

       (*) Request a key

       keyctl request <type> <desc> [<dest_keyring>]
       keyctl request2 <type> <desc> <info> [<dest_keyring>]
       keyctl prequest2 <type> <desc> [<dest_keyring>]

       These three commands request the lookup of a key of the given type and description. The process's keyrings will be searched, and if a match
       is  found  the  matching  key's  ID will be printed to stdout; and if a destination keyring is given, the key will be added to that keyring
       also.

       If there is no key, the first command will simply return the error ENOKEY and fail. The second and third commands will create a partial key
       with  the  type and description, and call out to /sbin/request-key with that key and the extra information supplied. This will then attempt
       to instantiate the key in some manner, such that a valid key is obtained.

       The third command is like the second, except that the callout information is read from stdin rather than being passed on the command line.

       If a valid key is obtained, the ID will be printed and the key attached as if the original search had succeeded.

       If there wasn't a valid key obtained, a temporary negative key will be  attached  to  the  destination  keyring  if  given  and  the  error
       "Requested key not available" will be given.

              testbox>keyctl request2 user debug:hello wibble
              23
              testbox>echo -n wibble | keyctl prequest2 user debug:hello
              23
              testbox>keyctl request user debug:hello
              23

       (*) Update a key

       keyctl update <key> <data>
       keyctl pupdate <key>

       This  command  replaces the data attached to a key with a new set of data. If the type of the key doesn't support update then error "Opera‐
       tion not supported" will be returned.

              testbox>keyctl update 23 zebra

       The pupdate variant of the command reads the data from stdin rather than taking it from the command line:

              testbox>echo -n zebra | keyctl pupdate 23

       (*) Create a keyring

       keyctl newring <name> <keyring>

       This command creates a new keyring of the specified name and attaches it to the specified keyring. The  ID  of  the  new  keyring  will  be
       printed to stdout if successful.

              testbox>keyctl newring squelch @us
              27

       (*) Revoke a key

       keyctl revoke <key>

       This  command  marks  a  key as being revoked. Any further operations on that key (apart from unlinking it) will return error "Key has been
       revoked".

              testbox>keyctl revoke 26
              testbox>keyctl describe 26
              keyctl_describe: Key has been revoked

       (*) Clear a keyring

       keyctl clear <keyring>

       This command unlinks all the keys attached to the specified keyring. Error "Not a directory" will be returned if the key specified is not a
       keyring.

              testbox>keyctl clear 27

       (*) Link a key to a keyring

       keyctl link <key> <keyring>

       This  command makes a link from the key to the keyring if there's enough capacity to do so. Error "Not a directory" will be returned if the
       destination is not a keyring. Error "Permission denied" will be returned if the key doesn't have link permission  or  the  keyring  doesn't
       have  write  permission.  Error  "File  table  overflow" will be returned if the keyring is full. Error "Resource deadlock avoided" will be
       returned if an attempt was made to introduce a recursive link.

              testbox>keyctl link 23 27
              testbox>keyctl link 27 27
              keyctl_link: Resource deadlock avoided

       (*) Unlink a key from a keyring or the session keyring tree

       keyctl unlink <key> [<keyring>]

       If the keyring is specified, this command removes a link to the key from the keyring. Error "Not a directory" will be returned if the  des‐
       tination  is not a keyring. Error "Permission denied" will be returned if the keyring doesn't have write permission. Error "No such file or
       directory" will be returned if the key is not linked to by the keyring.

       If the keyring is not specified, this command performs a depth-first search of the session keyring tree and removes all the  links  to  the
       nominated key that it finds (and that it is permitted to remove).  It prints the number of successful unlinks before exiting.

              testbox>keyctl unlink 23 27

       (*) Search a keyring

       keyctl search <keyring> <type> <desc> [<dest_keyring>]

       This command non-recursively searches a keyring for a key of a particular type and description. If found, the ID of the key will be printed
       on stdout and the key will be attached to the destination keyring if present. Error "Requested key not available" will be returned  if  the
       key is not found.

              testbox>keyctl search @us user debug:hello
              23
              testbox>keyctl search @us user debug:bye
              keyctl_search: Requested key not available

       (*) Read a key

       keyctl read <key>
       keyctl pipe <key>
       keyctl print <key>

       These  commands  read the payload of a key. "read" prints it on stdout as a hex dump, "pipe" dumps the raw data to stdout and "print" dumps
       it to stdout directly if it's entirely printable or as a hexdump preceded by ":hex:" if not.

       If the key type does not support reading of the payload, then error "Operation not supported" will be returned.

              testbox>keyctl read 26
              1 bytes of data in key:
              62
              testbox>keyctl print 26
              b
              testbox>keyctl pipe 26
              btestbox>

       (*) List a keyring

       keyctl list <keyring>
       keyctl rlist <keyring>

       These commands list the contents of a key as a keyring. "list" pretty prints the contents and "rlist" just produces a space-separated  list
       of key IDs.

       No attempt is made to check that the specified keyring is a keyring.

              testbox>keyctl list @us
              2 keys in keyring:
                     22: vrwsl----------  4043    -1 keyring: _uid.4043
                     23: vrwsl----------  4043  4043 user: debug:hello
              testbox>keyctl rlist @us
              22 23

       (*) Describe a key

       keyctl describe <keyring>
       keyctl rdescribe <keyring> [sep]

       These  commands fetch a description of a keyring. "describe" pretty prints the description in the same fashion as the "list" command; "rde‐
       scribe" prints the raw data returned from the kernel.

              testbox>keyctl describe @us
                     -5: vrwsl----------  4043    -1 keyring: _uid_ses.4043 testbox>keyctl rdescribe @us keyring;4043;-1;3f1f0000;_uid_ses.4043

       The raw string is "<type>;<uid>;<gid>;<perms>;<description>", where uid and gid are the decimal user and group IDs, perms  is  the  permis‐
       sions mask in hex, type and description are the type name and description strings (neither of which will contain semicolons).

       (*) Change the access controls on a key

       keyctl chown <key> <uid>
       keyctl chgrp <key> <gid>

       These  two  commands  change the UID and GID associated with evaluating a key's permissions mask. The UID also governs which quota a key is
       taken out of.

       The chown command is not currently supported; attempting it will earn the error "Operation not supported" at best.

       For non-superuser users, the GID may only be set to the process's GID or a GID in the process's groups list. The superuser may set any  GID
       it likes.

              testbox>sudo keyctl chown 27 0
              keyctl_chown: Operation not supported
              testbox>sudo keyctl chgrp 27 0

       (*) Set the permissions mask on a key

       keyctl setperm <key> <mask>

       This  command changes the permission control mask on a key. The mask may be specified as a hex number if it begins "0x", an octal number if
       it begins "0" or a decimal number otherwise.

       The hex numbers are a combination of:

              Possessor UID       GID       Other     Permission Granted
              ========  ========  ========  ========  ==================
              01000000  00010000  00000100  00000001  View
              02000000  00020000  00000200  00000002  Read
              04000000  00040000  00000400  00000004  Write
              08000000  00080000  00000800  00000008  Search
              10000000  00100000  00001000  00000010  Link
              20000000  00200000  00002000  00000020  Set Attribute
              3f000000  003f0000  00003f00  0000003f  All

       View permits the type, description and other parameters of a key to be viewed.

       Read permits the payload (or keyring list) to be read if supported by the type.

       Write permits the payload (or keyring list) to be modified or updated.

       Search on a key permits it to be found when a keyring to which it is linked is searched.

       Link permits a key to be linked to a keyring.

       Set Attribute permits a key to have its owner, group membership, permissions mask and timeout changed.

              testbox>keyctl setperm 27 0x1f1f1f00

       (*) Start a new session with fresh keyrings

       keyctl session
       keyctl session - [<prog> <arg1> <arg2> ...]
       keyctl session <name> [<prog> <arg1> <arg2> ...]

       These commands join or create a new keyring and then run a shell or other program with that keyring as the session key.

       The variation with no arguments just creates an anonymous session keyring and attaches that as the session keyring; it then exec's $SHELL.

       The variation with a dash in place of a name creates an anonymous session keyring and attaches that as the session keyring; it then  exec's
       the supplied command, or $SHELL if one isn't supplied.

       The variation with a name supplied creates or joins the named keyring and attaches that as the session keyring; it then exec's the supplied
       command, or $SHELL if one isn't supplied.

              testbox>keyctl rdescribe @s
              keyring;4043;-1;3f1f0000;_uid_ses.4043

              testbox>keyctl session
              Joined session keyring: 28
              testbox>keyctl rdescribe @s
              keyring;4043;4043;3f1f0000;_ses.24082

              testbox>keyctl session -
              Joined session keyring: 29
              testbox>keyctl rdescribe @s
              keyring;4043;4043;3f1f0000;_ses.24139

              testbox>keyctl session - keyctl rdescribe @s
              Joined session keyring: 30
              keyring;4043;4043;3f1f0000;_ses.24185

              testbox>keyctl session fish
              Joined session keyring: 34
              testbox>keyctl rdescribe @s
              keyring;4043;4043;3f1f0000;fish

              testbox>keyctl session fish keyctl rdesc @s
              Joined session keyring: 35
              keyring;4043;4043;3f1f0000;fish

       (*) Instantiate a key

       keyctl instantiate <key> <data> <keyring>
       keyctl pinstantiate <key> <keyring>
       keyctl negate <key> <timeout> <keyring>
       keyctl reject <key> <timeout> <error> <keyring>

       These commands are used to attach data to a partially set up key (as created by the kernel and passed to /sbin/request-key).  "instantiate"
       marks  a  key as being valid and attaches the data as the payload.  "negate" and "reject" mark a key as invalid and sets a timeout on it so
       that it'll go away after a while.  This prevents a lot of quickly sequential requests from slowing the system down overmuch when  they  all
       fail,  as  all  subsequent  requests  will then fail with error "Requested key not found" (if negated) or the specified error (if rejected)
       until the negative key has expired.

       Reject's error argument can either be a UNIX error number or one of 'rejected', 'expired' or 'revoked'.

       The newly instantiated key will be attached to the specified keyring.

       These commands may only be run from the program run by request-key - a special authorisation key is set up by the kernel  and  attached  to
       the request-key's session keyring. This special key is revoked once the key to which it refers has been instantiated one way or another.

              testbox>keyctl instantiate $1 "Debug $3" $4
              testbox>keyctl negate $1 30 $4
              testbox>keyctl reject $1 30 64 $4

       The pinstantiate variant of the command reads the data from stdin rather than taking it from the command line:

              testbox>echo -n "Debug $3" | keyctl pinstantiate $1 $4

       (*) Set the expiry time on a key

       keyctl timeout <key> <timeout>

       This  command  is  used to set the timeout on a key, or clear an existing timeout if the value specified is zero. The timeout is given as a
       number of seconds into the future.

              testbox>keyctl timeout $1 45

       (*) Retrieve a key's security context

       keyctl security <key>

       This command is used to retrieve a key's LSM security context.  The label is printed on stdout.

              testbox>keyctl security @s
              unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023

       (*) Give the parent process a new session keyring

       keyctl new_session

       This command is used to give the invoking process (typically a shell) a new session keyring, discarding its old session keyring.

              testbox> keyctl session foo
              Joined session keyring: 723488146
              testbox> keyctl show
              Session Keyring
                     -3 --alswrv      0     0  keyring: foo
              testbox> keyctl new_session
              490511412
              testbox> keyctl show
              Session Keyring
                     -3 --alswrv      0     0  keyring: _ses

       Note that this affects the parent of the process that invokes the system call, and so may only affect processes with matching  credentials.
       Furthermore,  the change does not take effect till the parent process next transitions from kernel space to user space - typically when the
       wait() system call returns.

       (*) Remove dead keys from the session keyring tree

       keyctl reap

       This command performs a depth-first search of the caller's session keyring tree and attempts to unlink any key that it finds that is  inac‐
       cessible  due  to  expiry, revocation, rejection or negation.  It does not attempt to remove live keys that are unavailable simply due to a
       lack of granted permission.

       A key that is designated reapable will only be removed from a keyring if the caller has Write permission on that keyring, and only keyrings
       that grant Search permission to the caller will be searched.

       The  command  prints  the number of keys reaped before it exits.  If the -v flag is passed then the reaped keys are listed as they're being
       reaped, together with the success or failure of the unlink.

       (*) Remove matching keys from the session keyring tree

       keyctl purge <type>
       keyctl purge [-i] [-p] <type> <desc>
       keyctl purge -s <type> <desc>

       These commands perform a depth-first search to find matching keys in the caller's session keyring tree and attempts to  unlink  them.   The
       number of keys successfully unlinked is printed at the end.

       The  keyrings must grant Read and View permission to the caller to be searched, and the keys to be removed must also grant View permission.
       Keys can only be removed from keyrings that grant Write permission.

       The first variant purges all keys of the specified type.

       The second variant purges all keys of the specified type that also match the given description literally.  The -i flag allows a  case-inde‐
       pendent match and the -p flag allows a prefix match.

       The third variant purges all keys of the specified type and matching description using the key type's comparator in the kernel to match the
       description.  This permits the key type to match a key with a variety of descriptions.

       (*) Get persistent keyring

       keyctl get_persistent <keyring> [<uid>]

       This command gets the persistent keyring for either the current UID or the specified UID and attaches it to  the  nominated  keyring.   The
       persistent keyring's ID will be printed on stdout.

       The  kernel  will  create  the  keyring if it doesn't exist and every time this command is called, will reset the expiration timeout on the
       keyring to the value in:

              /proc/sys/kernel/keys/persistent_keyring_expiry

       (by default three days).  Should the timeout be reached, the persistent keyring will be removed and everything it pins can then be  garbage
       collected.

       If  a  UID  other  than  the  process's  real  or effective UIDs is specified, then an error will be given if the process does not have the
       CAP_SETUID capability.

ERRORS
       There are a number of common errors returned by this program:

       "Not a directory" - a key wasn't a keyring.

       "Requested key not found" - the looked for key isn't available.

       "Key has been revoked" - a revoked key was accessed.

       "Key has expired" - an expired key was accessed.

       "Permission denied" - permission was denied by a UID/GID/mask combination.

SEE ALSO
       keyctl(1), request-key.conf(5)

Linux                                                               20 Feb 2014                                                          KEYCTL(1)
