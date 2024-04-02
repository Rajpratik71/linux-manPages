mac-robber(1)                               collects data about allocated files in mounted filesystems                               mac-robber(1)

NAME
       mac-robber - collects data about allocated files in mounted filesystems

SYNOPSIS
       mac-robber [OPTION]
       mac-robber <DIRECTORY>

DESCRIPTION
       mac-robber is a digital investigation tool (digital forensics) that collects metadata from allocated files in a mounted filesystem. This is
       useful during incident response when analyzing a live system or when analyzing a dead system in a lab. The data can be used by the  mactime
       tool  in  The Sleuth Kit (TSK or SleuthKit only) to make a timeline of file activity. The mac-robber tool is based on the grave-robber tool
       from TCT (The Coroners Toolkit).

       mac-robber requires that the filesystem be mounted by the operating system, unlike the tools in The Sleuth Kit that process the  filesystem
       themselves.  Therefore, mac-robber will not collect data from deleted files or files that have been hidden by rootkits.

       mac-robber  will also modify the Access times on directories that are mounted with write permissions. When in forensics analysis you should
       mount the target partition as read-only.

       mac-robber is useful when dealing with a filesystem that is not supported by The Sleuth Kit or other filesystem analysis tools. You can run
       mac-robber on an obscure, suspect UNIX filesystem that has been mounted read-only on a trusted system.

OPTIONS
       -h     Print help.

       -V     Show the version.

EXAMPLE
       To see metadata from all files in a directory (recursively):

             $ mac-robber /home/user/directory

       To make a timeline using mactime command from The Sleuth Kit (TSK) and setting Brazilian timezone:

             $ mac-robber /home/user/directory | mactime -z BRT

       An alternative is write the results into a file and read it using mactime:

             $ mac-robber /home/user/directory > /tmp/files.mr
             $ mactime -b /tmp/files.mr -z BRT

AUTHOR
       Brian Carrier <carrier@sleuthkit.org>.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@eriberto.pro.br> for the Debian project (but may be used by others).

MAC-ROBBER 1.02                                                      May 2013                                                        mac-robber(1)
