TS(1)                                                         General Commands Manual                                                        TS(1)

NAME
       ts - task spooler. A simple unix batch system

SYNOPSIS
       tsp [actions] [options] [command...]

       Actions: [-KClhV] [-t [id]] [-c [id]] [-p [id]] [-o [id]] [-s [id]] [-r [id]] [-w [id]] [-u [id]] [-i [id]] [-U <id-id>] [-S [num]]

       Options: [-nfgmd] [-L <label>] [-D <id>]

DESCRIPTION
       ts  will run by default a per user unix task queue. The user can add commands to the queue, watch that queue at any moment, and look at the
       task results (actually, standard output and exit error).

SIMPLE USE
       Calling ts with a command will add that command to the queue, and calling it without commands or parameters will show the task list.

COMMAND OPTIONS
       When adding a job to ts, we can specify how it will be run and how will the results be collected:

       -n     Do not store the standard output/error in a file at $TMPDIR - let it use the file descriptors decided by the calling process. If  it
              is not used, the jobid for the new task will be outputed to stdout.

       -g     Pass the output through gzip (only if -n ). Note that the output files will not have a .gz extension.

       -f     Don  not  put  the  task into background. Wait the queue and the command run without getting detached of the terminal. The exit code
              will be that of the command, and if used together with -n, no result will be stored in the queue.

       -m     Mail the results of the command (output and exit code) to $TS_MAILTO , or to the $USER using /usr/sbin/sendmail.  Look  at  ENVIRON‐
              MENT.

       -L <label>
              Add a label to the task, which will appear next to its command when listing the queue. It makes more comfortable distinguishing sim‐
              ilar commands with different goals.

       -d     Run the command only if the command before finished well (errorlevel = 0). This new task enqueued depends on the result of the  pre‐
              vious command. If the task is not run, it is considered as failed for further dependencies.

       -D <id>
              Run the command only if the job of given id finished well (errorlevel = 0). This new task enqueued depends on the result of the pre‐
              vious command. If the task is not run, it is considered as failed for further dependencies.  If the server doesn't have the  job  id
              in its list, it will be considered as if the job failed.

       -B     In the case the queue is full (due to TS_MAXCONN or system limits), by default ts will block the enqueuing command. Using -B, if the
              queue is full it will exit returning the value 2 instead of blocking.

       -E     Keep two different output files for the command stdout and stderr. stdout goes to the file announced by ts (look at -o), and  stderr
              goes  to  the  stdout  file with an additional ".e". For example, /tmp/ts-out.SKsDw8 and /tmp/ts-out.SKsDw8.e.  Only the stdout file
              gets created with mkstemp, ensuring it does not overwrite any other; the ".e" will be overwritten if it existed.

       -N <num>
              Run the command only if there are num slots free in the queue. Without it, the job will run if there is one slot free. For  example,
              if you use the queue to feed cpu cores, and you know that a job will take two cores, with -N you can let ts know that.

ACTIONS
       Instead of giving a new command, we can use the parameters for other purposes:

       -K     Kill the ts server for the calling client. This will remove the unix socket and all the ts processes related to the queue. This will
              not kill the command being run at that time.

              It is not reliable to think that ts -K will finish when the server is really killed. By now it is a race condition.

       -C     Clear the results of finished jobs from the queue.

       -l     Show the list of jobs - to be run, running and finished - for the current queue.  This is the default  behaviour  if  ts  is  called
              without options.

       -t [id]
              Show  the last ten lines of the output file of the named job, or the last running/run if not specified. If the job is still running,
              it will keep on showing the additional output until the job finishes. On exit, it returns the errorlevel of the job, as in -c.

       -c [id]
              Run the system's cat to the output file of the named job, or the last running/run if not specified. It will block until all the out‐
              put can be sent to standard output, and will exit with the job errorlevel as in -c.

       -p [id]
              Show the pid of the named job, or the last running/run if not specified.

       -o [id]
              Show the output file name of the named job, or the last running/run if not specified.

       -s [id]
              Show the job state of the named job, or the last in the queue.

       -r [id]
              Remove the named job, or the last in the queue.

       -w [id]
              Wait for the named job, or for the last in the queue.

       -u [id]
              Make  the named job (or the last in the queue) urgent - this means that it goes forward in the queue so it can run as soon as possi‐
              ble.

       -i [id]
              Show information about the named job (or the last run). It will show the command line, some times related to the task, and also  any
              information resulting from TS_ENV (Look at ENVIRONMENT).

       -U <id-id>
              Interchange the queue positions of the named jobs (separated by a hyphen and no spaces).

       -h     Show help on standard output.

       -V     Show the program version.

MULTI-SLOT
       ts by default offers a queue where each job runs only after the previous finished.  Nevertheless, you can change the maximum number of jobs
       running at once with the -S [num] parameter. We call that number the amount of slots. You can also set the initial number of jobs with  the
       environment variable TS_SLOTS .  When increasing this setting, queued waiting jobs will be run at once until reaching the maximum set. When
       decreasing this setting, no other job will be run until it can meet the amount of running jobs set.   When using an amount of slots greater
       than 1, the action of some commands may change a bit. For example, -t without jobid will tail the first job running, and -d will try to set
       the dependency with the last job added.

       -S [num]
              Set the maximum amount of running jobs at once. If you don't specify num it will return the maximum amount of running jobs set.

ENVIRONMENT
       TS_MAXFINISHED
              Limit the number of job results (finished tasks) you want in the queue. Use this option if you are tired of -C.

       TS_MAXCONN
              The maximum number of ts server connections to clients. This will make the ts clients block until connections are freed. This helps,
              for  example,  on systems with a limited number of processes, because each job waiting in the queue remains as a process. This vari‐
              able has to be set at server start, and cannot be modified later.

       TS_ONFINISH
              If the variable exists pointing to an executable, it will be run by the client after the queued job. It uses execlp, so PATH is used
              if  there  are  no slashes in the variable content. The executable is run with four parameters: jobid errorlevel output_filename and
              command.

       TMPDIR As the program output and the unix socket are thought to be stored in a temporary directory, TMPDIR will be used if defined, or /tmp
              otherwise.

       TS_SOCKET
              Each queue has a related unix socket. You can specify the socket path with this environment variable. This way, you can have a queue
              for your heavy disk operations, another for heavy use of ram., and have a simple script/alias wrapper  over  ts  for  those  special
              queues. If it is not specified, it will be $TMPDIR/socket-ts.[uid].

       TS_SLOTS
              Set  the  number of slots at the start of the server, similar to -S, but the contents of the variable are read only when running the
              first instance of ts.

       TS_MAILTO
              Send the letters with job results to the address specified in this variable.  Otherwise, they are sent to $USER or if  not  defined,
              nobody.  The system /usr/sbin/sendmail is used. The job outputs are not sent as an attachment, so understand the consequences if you
              use the -gm flags together.

       USER   As seen above, it is used for the mail destination if TS_MAILTO is not specified.

       TS_SAVELIST
              If it is defined when starting the queue server (probably the first ts command run), on SIGTERM the queue status will  be  saved  to
              the file pointed by this environment variable - for example, at system shutdown.

       TS_ENV This  has a command to be run at enqueue time through /bin/sh. The output of the command will be readable through the option -i. You
              can use a command which shows relevant environment for the command run.  For example, you may use TS_ENV='pwd;set;mount'.

FILES
       /tmp/ts.error
              if ts finds any internal problem, you should find an error report there.  Please send this to the author as part of the bug report.

BUGS
       ts expects a simple command line. It does not start a shell parser.  If you want to run complex shell commands, you may want  to  run  them
       through  sh  -c  'commands...'   Also, remember that stdin/stdout/stderr will be detached, so do not use your shell's redirection operators
       when you put a job into background.  You can use them inside the sh -c in order to set redirections to the command run.

       If an internal problem is found in runtime, a file /tmp/ts.error is created, which you can submit to the developer in order to fix the bug.

SEE ALSO
       at(1)

AUTHOR
       Lluis Batlle i Rossell

NOTES
       This page describes ts as in version 0.7.5. Other versions may differ. The file TRICKS found in the  distribution  package  can  show  some
       ideas on special uses of ts.

       The Debian version of ts is called tsp to avoid name conflict with moreutils package.

Task Spooler 0.7.5                                                    2015-03                                                                TS(1)
