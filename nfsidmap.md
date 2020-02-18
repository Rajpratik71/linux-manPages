nfsidmap(5)                File Formats Manual               nfsidmap(5)

NAME
       nfsidmap - The NFS idmapper upcall program

SYNOPSIS
       nfsidmap [-v] [-t timeout] key desc
       nfsidmap [-v] [-c]
       nfsidmap [-v] [-u|-g|-r user]

DESCRIPTION
       The file /usr/sbin/nfsidmap is used by the NFS idmapper to trans‐
       late user and group ids into names, and  to  translate  user  and
       group  names  into  ids. Idmapper uses request-key to perform the
       upcall and cache the result.   /usr/sbin/nfsidmap  is  called  by
       /sbin/request-key,  and will perform the translation and initial‐
       ize a key with the resulting information.

       nfsidmap can also used to clear the keyring of all  the  keys  or
       revoke  one  particular key.  This is useful when the id mappings
       have failed to due to a lookup error resulting in all the  cached
       uids/gids to be set to the user id nobody.

OPTIONS
       -c     Clear the keyring of all the keys.

       -g user
              Revoke the gid key of the given user.

       -r user
              Revoke both the uid and gid key of the given user.

       -t timeout
              Set  the  expiration  timer,  in seconds, on the key.  The
              default is 600 seconds (10 mins).

       -u user
              Revoke the uid key of the given user.

       -v     Increases the verbosity of the output to  syslog  (can  be
              specified multiple times).

CONFIGURING
       The  file  /etc/request-key.conf  will  need  to  be  modified so
       /sbin/request-key can properly direct the upcall.  The  following
       line should be added before a call to keyctl negate:

       create    id_resolver    *    *    /usr/sbin/nfsidmap  -t  600 %k
       %d

       This  will  direct  all  id_resolver  requests  to  the   program
       /usr/sbin/nfsidmap.  The -t 600 defines how many seconds into the
       future the key will expire.  This is an  optional  parameter  for
       /usr/sbin/nfsidmap and will default to 600 seconds when not spec‐
       ified.

       The idmapper system uses four key descriptions:

              uid: Find the UID for the given user
              gid: Find the GID for the given group
             user: Find the user name for the given UID
            group: Find the group name for the given GID

       You can choose to handle any of these individually,  rather  than
       using  the generic upcall program.  If you would like to use your
       own program for a uid lookup then you would  edit  your  request-
       key.conf so it looks similar to this:

       create    id_resolver    uid:*     *    /some/other/program %k %d
       create    id_resolver    *         *    /usr/sbin/nfsidmap %k %d

       Notice that the new line was added above the line for the generic
       program.  request-key will find the first matching line  and  run
       the  corresponding  program.   In  this case, /some/other/program
       will handle all uid lookups, and /usr/sbin/nfsidmap  will  handle
       gid, user, and group lookups.

AUTHOR
       Bryan Schumaker, <bjschuma@netapp.com>

                             1 October 2010                  nfsidmap(5)
