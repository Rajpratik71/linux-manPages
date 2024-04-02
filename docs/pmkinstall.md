PMKINSTALL(1)                                               BSD General Commands Manual                                              PMKINSTALL(1)

NAME
     pmkinstall — install binaries and data

SYNOPSIS
     pmkinstall [-bcs] [-B suffix] [-g group] [-m mode] [-o owner] file1 file2
     pmkinstall [-bcs] [-B suffix] [-g group] [-m mode] [-o owner] file1 ...  fileN directory
     pmkinstall -d [-g group] [-m mode] [-o owner] directory ...
     pmkinstall -v
     pmkinstall -h

DESCRIPTION
     The file(s) are copied to the target file or directory.  If the destination is a directory, then the file is copied into directory with its
     original filename.  If the -b option is given and the target file already exists, it is renamed to the original name folloeb by the backup
     suffix.  The default suffix is ".old" but can be overriden with the -B option.

     The options are as follows:

     -B suffix
             Orverride backup suffix

     -b      Backup any existing files before overwriting.

     -c      Copy the file.  This is actually the default.  The -c option is only included for backwards compatibility.

     -d      Create directories.  Missing parent directories are created as required.

     -g group
             Specify a group.  A numeric GID is allowed.

     -h      Display usage.

     -m mode
             Specify an alternate mode.  The default mode is set to rwxr-xr-x (0755).  The specified mode may be either an octal or symbolic
             value; see chmod(1) for a description of possible mode values.

     -o owner
             Specify an owner.  A numeric UID is allowed.

     -s      pmkinstall exec's the command of environment variable STRIP to strip binaries so that install can be portable over a large number of
             systems and binary types.  If the environment variable STRIP is not set, the action is skipped.

     -h      Display version.
     The pmkinstall utility exits 0 on success, and >0 if an error occurs.

ENVIRONMENT
     STRIP  Set which strip(1) program to run.

SEE ALSO
     pmk(1), pmkscan(1), pmksetup(8)

AUTHOR
     Damien Couderc.

BSD                                                                June 6, 1993                                                                BSD
