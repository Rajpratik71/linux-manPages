GETFATTR(1)                                                                                   File Utilities                                                                                  GETFATTR(1)

NAME
       getfattr - get extended attributes of filesystem objects

SYNOPSIS
       getfattr [-hRLP] -n name [-e en] pathname...
       getfattr [-hRLP] -d [-e en] [-m pattern] pathname...

DESCRIPTION
       For each file, getfattr displays the file name, and the set of extended attribute names (and optionally values) which are associated with that file.

       The output format of getfattr -d is as follows:
               1:  # file: somedir/
               2:  user.name0="value0"
               3:  user.name1="value1"
               4:  user.name2="value2"
               5:  ...

       Line 1 identifies the file name for which the following lines are being reported.  The remaining lines (lines 2 to 4 above) show the name and value pairs associated with the specified file.

OPTIONS
       -n name, --name=name
           Dump the value of the named extended attribute extended attribute.

       -d, --dump
           Dump the values of all extended attributes associated with pathname.

       -e en, --encoding=en
           Encode values after retrieving them.  Valid values of en are "text", "hex", and "base64".  Values encoded as text strings are enclosed in double quotes ("), while strings encoded as hexidec‐
           imal and base64 are prefixed with 0x and 0s, respectively.

       -h, --no-dereference
           Do not dereference symlinks. Instead of the file a symlink refers to, the symlink itself is examined.  Unless doing a logical (-L) traversal, do not traverse symlinks to directories.

       -m pattern, --match=pattern
           Only include attributes with names matching the regular expression pattern.  The default value for pattern is "^user\\.", which includes all the attributes in the user namespace. Specify "-"
           for including all attributes.  Refer to attr(5) for a more detailed discussion of namespaces.

       --absolute-names
           Do not strip leading slash characters ('/').  The default behaviour is to strip leading slash characters.

       --only-values
           Dump out the raw extended attribute value(s) without encoding them.

       -R, --recursive
           List the attributes of all files and directories recursively.

       -L, --logical
           Logical  walk,  follow  symbolic links to directories.  The default behaviour is to follow symbolic link arguments unless --no-dereference is given, and to skip symbolic links encountered in
           subdirectories.  Only effective in combination with -R.

       -P, --physical
           Physical walk, do not follow symbolic links to directories.  This also skips symbolic link arguments.  Only effective in combination with -R.

       --version
           Print the version of getfattr and exit.

       --help
           Print help explaining the command line options.

       --  End of command line options.  All remaining parameters are interpreted as file names, even if they start with a dash character.

AUTHOR
       Andreas Gruenbacher, <a.gruenbacher@bestbits.at> and the SGI XFS development team, <linux-xfs@oss.sgi.com>.

       Please send your bug reports or comments to these addresses.

SEE ALSO
       setfattr(1), and attr(5).

Dec 2001                                                                                   Extended Attributes                                                                                GETFATTR(1)
