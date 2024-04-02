npage for fatcat

man(1)                                                            fatcat man page                                                           man(1)

NAME
       fatcat - FAT filesystem explore, extract, repair, and forensic tool

SYNOPSIS
       fatcat disk.img [options]

DESCRIPTION
       fatcat  is a standalone tool that allow you to explore, extract, repair and forensic FAT filesystems It currently supports FAT12, FAT16 and
       FAT32.

OPTIONS
       You should provide an option to fatcat, or you will get the help menu

       -i
           Display information about the FAT filesystem

       -l path [-d]
           Lists the entries of the directory path If -d is present, deleted files will be listed.

       -L cluster [-d]
           Same as -l, but using the cluster cluster number as source.  If -d is present, deleted files will be listed.

       -r path
           Reads the file given by path

       -R cluster [-s size]
           Reads the file starting at the cluster cluster number. If size is provied, this will only read size bytes.

       -x target [-c cluster] [-d]
           Extract all the files to the target directory. If you provide a cluster with -c, the extract will start with the given cluster  instead
           that the root directory.  If -d is present, deleted files will be extracted.

       -z, -S
           -z  will  write  all your unallocated data to zero, and -S will write all your unallocated data to random bytes. this will for instance
           cause your deleted files to be unreadable.

       -@ cluster
           This will display information about the given cluster. It will display its address, which is the offset of the cluster  in  the  image,
           and the FAT entries (next cluster, unallocated or end of cluster)

       -2
           Compares  the  two file allocation tables and produce a full diff. This can be used to check that the disk is not corrupted, and have a
           look to it before trying to merge it with -m.

       -m
           Merges the two file allocation tables. This will only keep the allocated entries from on or the other table.

       -b backupfile [-t table]
           Backups your FAT tables to the backupfile file. You can specify with -t the table(s) you want to backup  (0:both,  1:first,  2:second).
           You can then apply the FATs using -p.

       -p backupfile [-t table]
           Patch  your  FAT  table using backupfile previously backuped file (using -b).  You can use -t to specify the table(s) you want to patch
           (0: both, 1:first, 2:second).

       -w cluster -v value [-t table]
           Writes the cluster entry in the FAT to value. You can specify the table using -t (0:both, 1:first, 2: second).

       -o
           Search for orphaned files on the disk. This will produce a log listing files, directories and entries that are found. See -L, -R and -x
           to access those files and directories.

       -f
           Walks the directories from the root (/) and try to fix unallocated files and directories FAT table.

       -e path [-c cluster] [-s size]
           Display information about the entry of the path file or directory. You can edit its cluster or size reference using -c and -s.

       -k cluster
           Walks the directories from the root (/) and search an entry referencing the given cluster.

EXAMPLES
       You can explore your disk using -l:

       $ fatcat disk.img -l /

       And enter directories:

       $ fatcat disk.img -l /some/dir/

       You can read a file using -R:

       $ fatcat disk.img -r /hello.txt Hello world!  $ fatcat disk.img -r /picture.png > out.png

       You can also read files, including deleted ones:

       $ fatat disk.img -l / -d

       And extract all the files to a target directory:

       $ mkdir output/ $ fatcat disk.img -x output/

       Let's have a look at the listing:

        $ fatcat hello-world.img -l /
        Listing path /
        Directory cluster: 2
        f 25/10/2013 13:30:06  hello.txt                      c=3 s=13 (13B)
        d 25/10/2013 13:30:46  files/                         c=4

       The cluster of the files directory is 4, this means that we can list it with -L 4:

        $ fatcat hello-world.img -L 4
        Listing cluster 4
        Directory cluster: 4
        d 25/10/2013 13:30:22  ./                             c=4
        d 25/10/2013 13:30:22  ../                            c=0
        f 25/10/2013 13:30:46  other_file.txt                 c=5 s=29 (29B)

       The cluster of the other_file.txt file is 5, and its size is 29bytes, we can then read it using -R 5 -s 29:

        $ fatcat hello-world.img -R 5 -s 29
        Hello!
        This is another file!

       For  more  examples  and  tutorials,  have  a  look  at  the  fatcat tutorial and examples at: <https://github.com/Gregwar/fatcat/blob/mas‐
       ter/docs/index.md>

SEE ALSO
       fatattr(1), mkdosfs(8)

BUGS
       No known bugs.

AUTHOR
       Grégoire Passault (g.passault@gmail.com)

1.0.5                                                             07 August 2014                                                            man(1)
