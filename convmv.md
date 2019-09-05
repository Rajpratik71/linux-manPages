CONVMV(1)                                                                                                                                                                                           CONVMV(1)



NAME
       convmv - converts filenames from one encoding to another

SYNOPSIS
       convmv [options] FILE(S) ... DIRECTORY(S)

OPTIONS
       -f ENCODING
           specify the current encoding of the filename(s) from which should be converted

       -t ENCODING
           specify the encoding to which the filename(s) should be converted

       -i  interactive mode (ask y/n for each action)

       -r  recursively go through directories

       --nfc
           target files will be normalization form C for UTF-8 (Linux etc.)

       --nfd
           target files will be normalization form D for UTF-8 (OS X etc.).

       --qfrom , --qto
           be more quiet about the "from" or "to" of a rename (if it screws up your terminal e.g.). This will in fact do nothing else than replace any non-ASCII character (bytewise) with ? and any control
           character with * on printout, this does not affect rename operation itself.

       --exec command
           execute the given command. You have to quote the command and #1 will be substituted by the old, #2 by the new filename. Using this option link targets will stay untouched.

           Example:

           convmv -f latin1 -t utf-8 -r --exec "echo #1 should be renamed to #2" path/to/files

       --list
           list all available encodings. To get support for more Chinese or Japanese encodings install the Perl HanExtra or JIS2K Encode packages.

       --lowmem
           keep memory footprint low by not creating a hash of all files. This disables checking if symlink targets are in subtree. Symlink target pointers will be converted regardlessly. If you convert
           multiple hundredthousands or millions of files the memory usage of convmv might grow quite high. This option would help you out in that case.

       --nosmart
           by default convmv will detect if a filename is already UTF8 encoded and will skip this file if conversion from some charset to UTF8 should be performed.  "--nosmart" will also force conversion
           to UTF-8 for such files, which might result in "double encoded UTF-8" (see section below).

       --fixdouble
           using the "--fixdouble" option convmv does only convert files which will still be UTF-8 encoded after conversion. That's useful for fixing double-encoded UTF-8 files. All files which are not
           UTF-8 or will not result in UTF-8 after conversion will not be touched. Also see chapter "How to undo double UTF-8 ..."  below.

       --notest
           Needed to actually rename the files. By default convmv will just print what it wants to do.

       --parsable
           This is an advanced option that people who want to write a GUI front end will find useful (some others maybe, too). It will convmv make print out what it would do in an easy parsable way. The
           first column contains the action or some kind of information, the second column mostly contains the file that is to be modified and if appropriate the third column contains the modified value.
           Each column is separated by \0\n (nullbyte newline). Each row (one action) is separated by \0\0\n (nullbyte nullbyte newline).

       --preserve-mtimes
           modifying filenames usually causes the parent directory's mtime being updated.  This option allows to reset the mtime to the old value. If your filesystem supports sub-second resolution the sub-
           second part of the atime and mtime will be lost as Perl does not yet support that.

       --replace
           if the file to which shall be renamed already exists, it will be overwritten if the other file content is equal.

       --unescape
           this option will remove this ugly % hex sequences from filenames and turn them into (hopefully) nicer 8-bit characters. After --unescape you might want to do a charset conversion. This sequences
           like %20 etc. are sometimes produced when downloading via http or ftp.

       --upper , --lower
           turn filenames into all upper or all lower case. When the file is not ASCII-encoded, convmv expects a charset to be entered via the -f switch.

       --dotlessi
           care about the dotless i/I issue. A lowercase version of "I" will also be dotless while an uppercase version of "i" will also be dotted. This is an issue for Turkish and Azeri.

           By the way: The superscript dot of the letter i was added in the Middle Ages to distinguish the letter (in manuscripts) from adjacent vertical strokes in such letters as u, m, and n. J is a
           variant form of i which emerged at this time and subsequently became a separate letter.

       --help
           print a short summary of available options

       --dump-options
           print a list of all available options

DESCRIPTION
       convmv is meant to help convert a single filename, a directory tree and the contained files or a whole filesystem into a different encoding. It just converts the filenames, not the content of the
       files. A special feature of convmv is that it also takes care of symlinks, also converts the symlink target pointer in case the symlink target is being converted, too.

       All this comes in very handy when one wants to switch over from old 8-bit locales to UTF-8 locales. It is also possible to convert directories to UTF-8 which are already partly UTF-8 encoded. convmv
       is able to detect if certain files are UTF-8 encoded and will skip them by default. To turn this smartness off use the "--nosmart" switch.

   Filesystem issues
       Almost all POSIX filesystems do not care about how filenames are encoded, here are some exceptions:

       HFS+ on OS X / Darwin

       Linux and (most?) other Unix-like operating systems use the so called normalization form C (NFC) for its UTF-8 encoding by default but do not enforce this.  Darwin, the base of the Macintosh OS
       enforces normalization form D (NFD), where a few characters are encoded in a different way. On OS X it's not possible to create NFC UTF-8 filenames because this is prevented at filesystem layer.  On
       HFS+ filenames are internally stored in UTF-16 and when converted back to UTF-8, for the underlying BSD system to be handable, NFD is created.  See http://developer.apple.com/qa/qa2001/qa1173.html
       for defails. I think it was a very bad idea and breaks many things under OS X which expect a normal POSIX conforming system. Anywhere else convmv is able to convert files from NFC to NFD or vice
       versa which makes interoperability with such systems a lot easier.

       JFS

       If people mount JFS partitions with iocharset=utf8, there is a similar problem, because JFS is designed to store filenames internally in UTF-16, too; that is because Linux' JFS is really JFS2, which
       was a rewrite of JFS for OS/2. JFS partitions should always be mounted with iocharset=iso8859-1, which is also the default with recent 2.6.6 kernels. If this is not done, JFS does not behave like a
       POSIX filesystem and it might happen that certain files cannot be created at all, for example filenames in ISO-8859-1 encoding. Only when interoperation with OS/2 is needed iocharset should be set
       according to your used locale charmap.

       NFS4

       Despite other POSIX filesystems RFC3530 (NFS 4) mandates UTF-8 but also says: "The nfs4_cs_prep profile does not specify a normalization form.  A later revision of this specification may specify a
       particular normalization form." In other words, if you want to use NFS4 you might find the conversion and normalization features of convmv quite useful.

       FAT/VFAT and NTFS

       NTFS and VFAT (for long filenames) use UTF-16 internally to store filenames.  You should not need to convert filenames if you mount one of those filesystems.  Use appropriate mount options instead!

   How to undo double UTF-8 (or other) encoded filenames
       Sometimes it might happen that you "double-encoded" certain filenames, for example the file names already were UTF-8 encoded and you accidently did another conversion from some charset to UTF-8. You
       can simply undo that by converting that the other way round. The from-charset has to be UTF-8 and the to-charset has to be the from-charset you previously accidently used.  If you use the
       "--fixdouble" option convmv will make sure that only files will be processed that will still be UTF-8 encoded after conversion and it will leave non-UTF-8 files untouched. You should check to get
       the correct results by doing the conversion without "--notest" before, also the "--qfrom" option might be helpful, because the double utf-8 file names might screw up your terminal if they are being
       printed - they often contain control sequences which do funny things with your terminal window. If you are not sure about the charset which was accidently converted from, using "--qfrom" is a good
       way to fiddle out the required encoding without destroying the file names finally.

   How to repair Samba files
       When in the smb.conf (of Samba 2.x) there hasn't been set a correct "character set" variable, files which are created from Win* clients are being created in the client's codepage, e.g. cp850 for
       western european languages. As a result of that the files which contain non-ASCII characters are screwed up if you "ls" them on the Unix server. If you change the "character set" variable afterwards
       to iso8859-1, newly created files are okay, but the old files are still screwed up in the Windows encoding. In this case convmv can also be used to convert the old Samba-shared files from cp850 to
       iso8859-1.

       By the way: Samba 3.x finally maps to UTF-8 filenames by default, so also when you migrate from Samba 2 to Samba 3 you might have to convert your file names.

   Netatalk interoperability issues
       When Netatalk is being switched to UTF-8 which is supported in version 2 then it is NOT sufficient to rename the file names. There needs to be done more. See
       http://netatalk.sourceforge.net/2.0/htmldocs/upgrade.html#volumes-and-filenames and the uniconv utility of Netatalk for details.

SEE ALSO
       locale(1) utf-8(7) charsets(7)

BUGS
       no bugs or fleas known

AUTHOR
       Bjoern JACKE

       Send mail to bjoern [at] j3e.de for bug reports and suggestions.



perl v5.18.2                                                                                      2011-08-20                                                                                        CONVMV(1)
