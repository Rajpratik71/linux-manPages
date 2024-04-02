STARTPAR(8)                                                                                System Manager's Manual                                                                                STARTPAR(8)



NAME
       startpar - start runlevel scripts in parallel


SYNOPSIS
       startpar [-p par] [-i iorate] [-t timeout] [-T global_timeout] [-a arg] prg1 prg2 ...
       startpar [-p par] [-i iorate] [-t timeout] [-T global_timeout] -M [ boot|start|stop]


DESCRIPTION
       startpar  is  used  to  run  multiple  run-level  scripts in parallel.  The degree of parallelism on one CPU can be set with the -p option, the default is full parallelism. An argument to all of the
       scripts can be provided with the -a option.  Processes blocked by pending I/O will cause new process creation to be weighted by the iorate factor 800.  To change this factor the  option  -i  can  be
       used  to specify another value.  The amount weight=(nblocked×iorate)/1000 will be subtracted from the total number of processes which could be started, where nblocked is the number of processes cur-
       rently blocked by pending I/O.

       The output of each script is buffered and written when the script exits, so output lines of different scripts won't mix. You can modify this behaviour by setting a timeout.

       The timeout set with the -t option is used as buffer timeout. If the output buffer of a script is not empty and the last output was timeout seconds ago, startpar will flush the buffer.

       The -T option timeout works more globally. If no output is printed for more than global_timeout seconds, startpar will flush the buffer of the script with the oldest output. Afterwards it will  only
       print output of this script until it is finished.

       The  -M  option switches startpar into a make(1) like behaviour.  This option takes three different arguments: boot, start, and stop for reading .depend.boot or .depend.start or .depend.stop respec-
       tively in the directory /etc/init.d/.  By scanning the boot and runlevel directories in /etc/init.d/ it then executes the appropriate scripts in parallel.


FILES
       /etc/init.d/.depend.boot
       /etc/init.d/.depend.start
       /etc/init.d/.depend.stop


SEE ALSO
       init.d(7), insserv(8), startproc(8).


COPYRIGHT
       2003,2004 SuSE Linux AG, Nuernberg, Germany.
       2007 SuSE LINUX Products GmbH, Nuernberg, Germany.


AUTHOR
       Michael Schroeder <mls@suse.de>
       Takashi Iwai <tiwai@suse.de>
       Werner Fink <werner@suse.de>



                                                                                                   Jun 2003                                                                                       STARTPAR(8)
