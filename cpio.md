CPIO(1L)                                                                                                                                                                                             CPIO(1L)



NAME
       cpio - copy files to and from archives

SYNOPSIS
       cpio {-o|--create} [-0acvABLV] [-C bytes] [-H format] [-M message] [-O [[user@]host:]archive] [-F [[user@]host:]archive] [--file=[[user@]host:]archive] [--format=format] [--message=message] [--null]
       [--reset-access-time] [--verbose] [--dot] [--append] [--block-size=blocks] [--dereference] [--io-size=bytes] [--quiet] [--force-local] [--rsh-command=command] [--help] [--version] < name-list [> ar-
       chive]

       cpio  {-i|--extract}  [-bcdfmnrtsuvBSV]  [-C  bytes]  [-E  file]  [-H format] [-M message] [-R [user][:.][group]] [-I [[user@]host:]archive] [-F [[user@]host:]archive] [--file=[[user@]host:]archive]
       [--make-directories] [--nonmatching] [--preserve-modification-time] [--numeric-uid-gid] [--rename] [-t|--list] [--swap-bytes] [--swap]  [--dot]  [--unconditional]  [--verbose]  [--block-size=blocks]
       [--swap-halfwords]   [--io-size=bytes]   [--pattern-file=file]  [--format=format]  [--owner=[user][:.][group]]  [--no-preserve-owner]  [--message=message]  [--force-local]  [--no-absolute-filenames]
       [--sparse] [--only-verify-crc] [--to-stdout] [--quiet] [--rsh-command=command] [--extract-over-symlinks] [--help] [--version] [pattern...] [< archive]

       cpio {-p|--pass-through} [-0adlmuvLV] [-R [user][:.][group]] [--null] [--reset-access-time]  [--make-directories]  [--link]  [--quiet]  [--preserve-modification-time]  [--unconditional]  [--verbose]
       [--dot] [--dereference] [--owner=[user][:.][group]] [--no-preserve-owner] [--sparse] [--help] [--version] destination-directory < name-list

DESCRIPTION
       GNU cpio is fully documented in the texinfo documentation. To access the help from your command line, type

       info cpio

       The online copy of the documentation is available at the following address:

       http://www.gnu.org/software/cpio/manual



                                                                                                                                                                                                     CPIO(1L)
