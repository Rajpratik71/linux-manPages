EXT3GREP(8)                                              recover files on ext3 filesystems                                             EXT3GREP(8)

NAME
       ext3grep - ext3 file recovery tool

SYNOPSIS
       ext3grep [OPTIONS] FILE ...

DESCRIPTION
       ext3grep  is  a  simple tool intended to aid anyone who accidentally deletes a file on an ext3 filesystem, only to find that they wanted it
       shortly thereafter.

OPTIONS
       --superblock
           Print contents of superblock in addition to the rest. If no action is specified then this option is implied.

       --print
           Print contents of block or inode, if any.

       --ls
           Print directories, one line per entry. See the FILTERS section for details on filtering this output.

       --accept FILE
           Accepts 'file' as a legal filename. Can be used multiple times. If you change any --accept you must remove BOTH stage* files!

       --journal
           Prints the contents of the journal.

       --show-path-inodes
           Show the inode of each directory component in paths.

   Filters:
       --group gid
           Only show/process files owned by process group gid.

       --directory
           Only show/process process directory inodes.

       --after dtime
           Only show/process entries deleted on or after dtime.

       --before dtime
           Only show/process entries deleted before dtime.

       --deleted
           Only show/process deleted entries.

       --allocated
           Only show/process allocated inodes/blocks.

       --unallocated
           Only show/process unallocated inodes/blocks.

       --reallocated
           Do not suppress entries with reallocated inodes. Inodes are considered 'reallocated' if the entry is deleted but  the  inode  is  allo‐
           cated, but also when the file type in the dir entry and the inode are different.

       --zeroed-inodes
           Do not suppress entries with zeroed inodes. Linked entries are always shown, regardless of this option.

       --depth depth
           Process directories recursively up till a depth of 'depth'.

   Actions:
       --inode-to-block inode_num
           Print the block that contains inode inode_num.

       --inode inode_num
           Show  info on inode inode_num. If --ls is used and the inode is a directory, then the filters apply to the entries of the directory. If
           you do not use --ls then --print is implied.

       --block block_num
           Show info on block block_num. If --ls is used and the block is the first block of a directory, then the filters apply to entries of the
           directory. If you do not use --ls then --print is implied.

       --histogram=[atime|ctime|mtime|dtime|group]
           Generate  a  histogram  based  on the given specs. Using atime, ctime or mtime will change the meaning of --after and --before to those
           times.

       --journal-block block_num
           Show info on journal block block_num.

       --journal-transaction seq
           Show info on transaction with sequence number seq.

       --dump-names
           Write the paths of files to stdout. This implies --ls but suppresses its output.

       --search-start str
           Find blocks that start with the fixed string str.

       --search str
           Find blocks that contain the fixed string str.

       --search-inode block_num
           Find inodes that refer to block block_num.

       --search-zeroed-inodes
           Return allocated inode table entries that are zeroed.

       --inode-dirblock-table dir
           Print a table for directory path dir of directory block numbers found and the inodes used for each file.

       --show-journal-inodes inode_num
           Show copies of inode inode_num still in the journal.

       --restore-file path
           Will restore file path. path is relative to root of the partition and does not start with a '/' (it must be one of the  paths  returned
           by --dump-names). The restored directory, file or symbolic link is created in the current directory as ./path.

       --restore-all
           As  --restore-file but attempts to restore everything. The use of --after is highly recommended because the attempt to restore very old
           files will only result in them being hard linked to a more recently deleted file and as such pollute the output.

       --show-hardlinks
           Show all inodes that are shared by two or more files.

       --version, -[vV]
           Prints the version information and exits.

       --help,
           Prints a help message and exits.

EXAMPLES
       Restoring all files from the ext3 partition/file /backup/sda1:
       ext3grep --restore-all /backup/sda1
       Listing the files owned by GID 1000 on /backup/sda1:
       ext3grep --ls --group 1000 /backup/sda1
       Finding all files containing the string Critical_report in their name on /backup/sda1:
       ext3grep --dump-names /backup/sda1 | grep 'Critical_report'

LIMITATIONS
       Do not attempt to use ext3grep for recovery from a mounted filesystem. Ever.

       No, not even then.

       ext3grep sometimes runs out of memory spare on 32-bit architectures and crashes. It is highly recommended that you run ext3grep in a 64-bit
       environment when dealing with large filesystems, though this is seen as a bug.

       ext3grep cannot recover files if there are no remnants of them.

       Some files that ext3grep recovers may have trailing null bytes - just scrape them off like the burnt bits on toast.

SEE ALSO
       debugfs(8)

AUTHOR
       ext3grep was written by Carlo Wood <carlo@alinoe.com>.

       This manual page was written by Rich Ercolani <rercola@acm.jhu.edu>, for the Debian project (but may be used by others). It may be distrib‐
       uted under the same terms as ext3grep, the GNU General Public License, either version 2 or (at your option) any later version.

0.8.0                                                               2008-09-14                                                         EXT3GREP(8)
