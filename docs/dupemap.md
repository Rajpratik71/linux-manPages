DUPEMAP(1)                                                         Magic Rescue                                                         DUPEMAP(1)

NAME
       dupemap - Creates a database of file checksums and uses it to eliminate duplicates

SYNOPSIS
       dupemap [ options ] [ -d database ] operation path...

DESCRIPTION
       dupemap recursively scans each path to find checksums of file contents.  Directories are searched through in no particular order.  Its
       actions depend on whether the -d option is given, and on the operation parameter, which must be a comma-seperated list of scan, report,
       delete:

   Without -d
       dupemap will take action when it sees the same checksum repeated more than once, i.e. it simply finds duplicates recursively.  The action
       depends on operation:

       report Report what files are encountered more than once, printing their names to standard output.

       delete[,report]
              Delete files that are encountered more than once.  Print their names if report is also given.

              WARNING: use the report operation first to see what will be deleted.

              WARNING: You are advised to make a backup of the target first, e.g. with "cp -al" (for GNU cp) to create hard links recursively.

   With -d
       The database argument to -d will denote a database file (see the "DATABASE" section in this manual for details) to read from or write to.
       In this mode, the scan operation should be run on one path, followed by the report or delete operation on another (not the same!) path.

       scan   Add the checksum of each file to database.  This operation must be run initially to create the database.  To start over, you must
              manually delete the database file(s) (see the "DATABASE" section).

       report Print each file name if its checksum is found in database.

       delete[,report]
              Delete each file if its checksum is found in database.  If report is also present, print the name of each deleted file.

              WARNING: if you run dupemap delete on the same path you just ran dupemap scan on, it will delete every file! The idea of these
              options is to scan one path and delete files in a second path.

              WARNING: use the report operation first to see what will be deleted.

              WARNING: You are advised to make a backup of the target first, e.g. with "cp -al" (for GNU cp) to create hard links recursively.

OPTIONS
       -d database
              Use database as an on-disk database to read from or write to.  See the "DESCRIPTION" section above about how this influences the
              operation of dupemap.

       -I file
              Reads input files from file in addition to those listed on the command line.  If file is "-", read from standard input.  Each line
              will be interpreted as a file name.

              The paths given here will NOT be scanned recursively.  Directories will be ignored and symlinks will be followed.

       -m minsize
              Ignore files below this size.

       -M maxsize
              Ignore files above this size.

USAGE
   General usage
       The easiest operations to understand is when the -d option is not given.  To delete all duplicate files in /tmp/recovered-files, do:

           $ dupemap delete /tmp/recovered-files

       Often, dupemap scan is run to produce a checksum database of all files in a directory tree.  Then dupemap delete is run on another
       directory, possibly following dupemap report.  For example, to delete all files in /tmp/recovered-files that already exist in $HOME, do
       this:

           $ dupemap -d homedir.map scan $HOME
           $ dupemap -d homedir.map delete,report /tmp/recovered-files

   Usage with magicrescue
       The main application for dupemap is to take some pain out of performing undelete operations with magicrescue(1).  The reason is that
       magicrescue will extract every single file of the specified type on the block device, so undeleting files requires you to find a few files
       out of hundreds, which can take a long time if done manually.  What we want to do is to only extract the documents that don't exist on the
       file system already.

       In the following scenario, you have accidentally deleted some important Word documents in Windows.  If this were a real-world scenario,
       then by all means use The Sleuth Kit.  However, magicrescue will work even when the directory entries were overwritten, i.e. more files
       were stored in the same folder later.

       You boot into Linux and change to a directory with lots of space.  Mount the Windows partition, preferably read-only (especially with
       NTFS), and create the directories we will use.

           $ mount -o ro /dev/hda1 /mnt/windows
           $ mkdir healthy_docs rescued_docs

       Extract all the healthy Word documents with magicrescue and build a database of their checksums.  It may seem a little redundant to send
       all the documents through magicrescue first, but the reason is that this process may modify them (e.g. stripping trailing garbage), and
       therefore their checksum will not be the same as the original documents.  Also, it will find documents embedded inside other files, such as
       uncompressed zip archives or files with the wrong extension.

           $ find /mnt/windows -type f \
             |magicrescue -I- -r msoffice -d healthy_docs
           $ dupemap -d healthy_docs.map scan healthy_docs
           $ rm -rf healthy_docs

       Now rescue all "msoffice" documents from the block device and get rid of everything that's not a *.doc.

           $ magicrescue -Mo -r msoffice -d rescued_docs /dev/hda1 \
             |grep -v '\.doc$'|xargs rm -f

       Remove all the rescued documents that also appear on the file system, and remove duplicates.

           $ dupemap -d healthy_docs.map delete,report rescued_docs
           $ dupemap delete,report rescued_docs

       The rescued_docs folder should now contain only a few files.  This will be the undeleted files and some documents that were not stored in
       contiguous blocks (use that defragger ;-)).

   Usage with fsck
       In this scenario (based on a true story), you have a hard disk that's gone bad.  You have managed to dd about 80% of the contents into the
       file diskimage, and you have an old backup from a few months ago.  The disk is using reiserfs on Linux.

       First, use fsck to make the file system usable again.  It will find many nameless files and put them in lost+found.  You need to make sure
       there is some free space on the disk image, so fsck has something to work with.

           $ cp diskimage diskimage.bak
           $ dd if=/dev/zero bs=1M count=2048 >> diskimage
           $ reiserfsck --rebuild-tree diskimage
           $ mount -o loop diskimage /mnt
           $ ls /mnt/lost+found
           (tons of files)

       Our strategy will be to restore the system with the old backup as a base and merge the two other sets of files (/mnt/lost+found and /mnt)
       into the backup after eliminating duplicates.  Therefore we create a checksum database of the directory we have unpacked the backup in.

           $ dupemap -d backup.map scan ~/backup

       Next, we eliminate all the files from the rescued image that are also present in the backup.

           $ dupemap -d backup.map delete,report /mnt

       We also want to remove duplicates from lost+found, and we want to get rid of any files that are also present in the other directories in
       /mnt.

           $ dupemap delete,report /mnt/lost+found
           $ ls /mnt|grep -v lost+found|xargs dupemap -d mnt.map scan
           $ dupemap -d mnt.map delete,report /mnt/lost+found

       This should leave only the files in /mnt that have changed since the last backup or got corrupted.  Particularly, the contents of
       /mnt/lost+found should now be reduced enough to manually sort through them (or perhaps use magicsort(1)).

   Primitive intrusion detection
       You can use dupemap to see what files change on your system.  This is one of the more exotic uses, and it's only included for inspiration.

       First, you map the whole file system.

           $ dupemap -d old.map scan /

       Then you come back a few days/weeks later and run dupemap report.  This will give you a view of what has not changed.  To see what has
       changed, you need a list of the whole file system.  You can get this list along with preparing a new map easily.  Both lists need to be
       sorted to be compared.

           $ dupemap -d old.map report /|sort > unchanged_files
           $ dupemap -d current.map scan /|sort > current_files

       All that's left to do is comparing these files and preparing for next week.  This assumes that the dbm appends the ".db" extension to
       database files.

           $ diff unchanged_files current_files > changed_files
           $ mv current.map.db old.map.db

DATABASE
       The actual database file(s) written by dupecheck will have some relation to the database argument, but most implementations append an
       extension.  For example, Berkeley DB names the files database.db, while Solaris and GDBM creates both a database.dir and database.pag file.

       dupecheck depends on a database library for storing the checksums.  It currently requires the POSIX-standardized ndbm library, which must
       be present on XSI-compliant UNIXes.  Implementations are not required to handle hash key collisions, and a faliure to do that could make
       dupecheck delete too many files.  I haven't heard of such an implementation, though.

       The current checksum algorithm is the file's CRC32 combined with its size.  Both values are stored in native byte order, and because of
       varying type sizes the database is not portable across architectures, compilers and operating systems.

SEE ALSO
       magicrescue(1), weeder(1)

       This tool does the same thing weeder does, except that weeder cannot seem to handle many files without crashing, and it has no largefile
       support.

BUGS
       There is a tiny chance that two different files can have the same checksum and size.  The probability of this happening is around 1 to
       10^14, and since dupemap is part of the Magic Rescue package, which deals with disaster recovery, that chance becomes an insignificant part
       of the game.  You should consider this if you apply dupemap to other applications, especially if they are security-related (see next
       paragraph).

       It is possible to craft a file to have a known CRC32.  You need to keep this in mind if you use dupemap on untrusted data.  A solution to
       this could be to implement an option for using MD5 checksums instead.

AUTHOR
       Jonas Jensen <jbj@knef.dk>

LATEST VERSION
       This tool is part of Magic Rescue.  You can find the latest version at <http://jbj.rapanden.dk/magicrescue/>

1.1.9                                                               2008-06-26                                                          DUPEMAP(1)
