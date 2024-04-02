GETDELAYS(1)                                                                               General Commands Manual                                                                               GETDELAYS(1)



NAME
       getdelays -- Display delay statistics

SYNOPSIS
       getdelays -c  command
       getdelays -p  pid
       getdelays -t  tid

DESCRIPTION
       The  getdelays  utility  helps  pin-point possible resource shortages when running an application. The SLES10 kernel includes patches to implement delay accounting, which measures the time a process
       spends waiting for disk I/O, swap I/O and CPU time slices. For example, if an application is running rather slowly, delay accounting can tell you where it spends all its time.

       For instance, when the CPU delay is high, this means the application is competing with other proces for run time, but is losing quite often.

       High memory delays mean that the sum of applications running on this system need more physical memory than is available, and are swapping quite a lot.

       In order to enable delay accounting, you need to specify delayacct on the kernel command line when booting the system.

       Getdelays has three modes of operation:

       getdelays -c command
              This will invoke command and print a summary of delay statistics when the command finishes.

       getdelays -p pid
              This will print the current delay statistics of the process identified pid.

       getdelays -t tid
              This will print the current delay statistics of the thread group identified tid.

AUTHOR
       Balbir Singh, IBM Corp.

       Shailabh Nagar, IBM Corp.

       Manpage contributed by Olaf Kirch <okir@suse.de>



                                                                                                April 13, 2006                                                                                   GETDELAYS(1)
