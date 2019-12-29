CIFS.IDMAP(8)                                                                            CIFS.IDMAP(8)

NAME
       cifs.idmap - Userspace helper for mapping ids for Common Internet File System (CIFS)

SYNOPSIS
          cifs.idmap [--help|-h] [--timeout|-t] [--version|-v] {keyid}

DESCRIPTION
       This tool is part of the cifs-utils suite.

       cifs.idmap   is  a  userspace  helper program for the linux CIFS client filesystem. There are a
       number of activities that the kernel cannot easily do itself. This program is a callout program
       that does these things for the kernel and then returns the result.

       cifs.idmap  is generally intended to be run when the kernel calls request-key(8) for a particu‐
       lar key type. While it can be run directly from the command-line, it is not generally  intended
       to be run that way.

       This  program  is  only  called if a share is mounted with the cifsacl mount option. The kernel
       will only upcall to do this conversion if that mount option is specified.

       cifs.idmap  relies on a plugin to handle the ID mapping. If it can't find the  plugin  then  it
       will    not    work    properly.   The   plugin   (or   a   symlink   to   it)   must   be   at
       /etc/cifs-utils/idmap-plugin.

       In the case where cifs.idmap or the plugin are unavailable, file objects in a mounted share are
       assigned  uid  and gid of the credentials of the process that mounted the share. It is strongly
       recomemended to use mount options of uid and gid to specify a default uid and gid to map  owner
       SIDs and group SIDs in this situation.

OPTIONS
       --help|-h
              Print the usage message and exit.

       --timeout|-t
              Set  the  expiration  timer,  in seconds on the key. The default is 600 seconds (10 min‐
              utes). Setting this to 0 will cause the key to never expire.

       --version|-v
              Print version number and exit.

CONFIGURATION FOR KEYCTL
       cifs.idmap  is designed to be called from the kernel via the request-key callout program.  This
       requires  that  request-key  be  told where and how to call this program.  Currently cifs.idmap
       handles a key type of:

          cifs.idmap

       This keytype is for mapping a SID to either an uid or a gid.

       To make this program  useful  for  CIFS,  you  will  need  to  set  up  entry  for  it  in  re‐
       quest-key.conf(5). Here is an example of an entry for this key type:

          #OPERATION  TYPE           D C PROGRAM ARG1 ARG2...
          #=========  =============  = = ================================
          create      cifs.idmap     * * /usr/sbin/cifs.idmap %k

       See request-key.conf(5) for more info on each field.

NOTES
       Support for upcalls to cifs.idmap was initially introduced in the 3.0 kernel.

SEE ALSO
       request-key.conf(5), mount.cifs(8)

AUTHOR
       Shirish Pargaonkar wrote the cifs.idmap program.

       The Linux CIFS Mailing list is the preferred place to ask questions regarding these programs.

                                                                                         CIFS.IDMAP(8)
