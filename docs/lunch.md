LUNCH(1)                                                           User Commands                                                          LUNCH(1)

NAME
       lunch - Distributed process launcher

SYNOPSIS
       lunch [config file] [options]

DESCRIPTION
       Lunch  is a distributed process launcher for GNU/Linux. The Lunch master launches lunch-slave processes through an encrypted SSH session if
       on a remote host. Those slave processes can in turn launch the desired commands on-demand.

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       -f CONFIG_FILE, --config-file=CONFIG_FILE
              Specifies the python config file. You can also simply specify the config file as the first argument.

       -l LOGGING_DIRECTORY, --logging-directory=LOGGING_DIRECTORY
              Specifies the logging and pidfile directory for the master. Default is /var/tmp/lunch

       -q, --log-to-file
              Enables logging master infos to file and disables logging to standard output.

       -g, --graphical
              Enables the graphical user interface.

       -v, --verbose
              Makes the logging output verbose.

       -d, --debug
              Makes the logging output very verbose.

       -k, --kill
              Kills another lunch master that uses the same config file and logging directory. Exits once it's done.

OPERATION
       The lunch executable is called the lunch master. The lunch-slave executable is called the lunch slave. If run  as  a  master,  it  launches
       slaves.  The slaves are responsible for launching child processes. The master launches slaves (via SSH or not) which, in turn, launch child
       processes.

       The Lunch configuration file can be provided as a first argument to the lunch executable. If not given, the Lunch master will look for  the
       ~/.lunchrc file. If not found, lunch will print an error and exit. The lunch config file is written in the Python programming language, and
       must call the add_command function.

       The process ID of the master is written to a file located in /var/tmp/lunch/master*.pid, where * varies depending on the lunch config  file
       used to configure the master.  Here is how to kill every lunch master on your system :

         for f in /var/tmp/lunch/master-*.pid; do kill -15 $(cat $f); done

GRAPHICAL USER INTERFACE
       When  invoked  with  the  --graphical  option, (-g) the lunch master shows a graphical user interface displaying the state of every managed
       process. When this window is closed, the lunch master exits and kills all its children processes.

SSH KEYS MANAGEMENT
       If using for more than one host, lunch needs a SSH server installed on each remote computer. It is also needed that the public SSH  key  of
       your  user  on  the  master computer must be installed on every slave computer. Here is a summary of the steps to do to create a SSH key on
       your master computer, and send your public key on each slave computer.

         $ mkdir -p ~/.ssh
         $ chmod 700 ~/.ssh
         $ ssh-keygen -f ~/.ssh/id_rsa -t rsa

       Next, for each slave host, do:

         $ ssh-copy-id <username>@<host>
         $ ssh username@host 'echo Hello'

       The latter command should display "Hello" when issued.

       If you start lunch via SSH, and launch from there commands other hosts, you must first make sure that the ssh-agent is running and that you
       have unlocked your private SSH key. It can be done like this:

         $ ssh-agent bash
         $ ssh-add

HISTORY
       2010 - Ported from multiprocessing to Twisted

       2009 - Written by Alexandre Quessy <alexandre@quessy.net> with contributions from Simon Piette <simonp@sat.qc.ca>

EXAMPLES
       See the examples directory for examples. On a Debian or Ubuntu system, they should located in the /usr/share/doc/lunch/examples/ directory.

       Here is the simplest example possible for the contents of a ~/.lunchrc file. It tells Lunch to call only one command, called "xeyes".

         add_command("xeyes")

       If  you add more calls to add_command in this file, it will add more processes to be launched by Lunch. The add_command is the Python func‐
       tion you need to call from your Lunch configuration file in order to add commands to be called by Lunch. If you add more than one  command,
       they will be called in the order you add them in the file.

       Here is a more complex example of a configuration file. It creates three processes, with dependencies between processes.

         add_command("xeyes", identifier="xeyes")
         add_command("xlogo", depends=["xeyes"])
         add_command("xclock", depends=["xeyes", "xlogo"])

       The  configuration  file  above  will  first  start  xeyes, and next xlogo, and finally xclock. If xeyes quits, all three processes will be
       stopped and restarted. If the xlogo process quits, the xclock will be stopped and restarted again when the xlogo is running. The  "depends"
       keyword  argument of the "add_command" function needs a list of strings as argument. Those string must match the "identifier" keyword argu‐
       ment of an already added command.

       In the next example, we use SSH to launch processes on a remote host. Note that the lunch-slave script must be installed  on  each  of  the
       hosts on which to launch child processes.

         add_command("xeyes")
         add_command("xeyes", user="johndoe", host="example.org")

       It will create a process tree such as this one :

       lunch_______________lunch-slave____xeyes
               |____ssh____lunch-slave____xeyes

       The next one is a command that is run only once.

         add_command("ls -l", identifier="listing...", respawn=False)

       If,  for  some  reason,  it  is  easier  for  you to specify the host name for every command you add, even for the local host, you can call
       "add_local_address" with the master's IP as an argument.

         add_local_address("192.168.1.2")
         # We will not use SSH for this one,
         # since we just added its host using the
         # "add_local_address" function.
         add_command("xeyes",
           identifier="local_xeyes",
           user="johndoe", host="192.168.0.2")
         # We will use SSH for the next one,
         # since its host is not set as being the local host.
         add_command("xeyes -geometry 300x400",
           identifier="remote_xeyes",
           user="johndoe", host="example.org")

REPORTING BUGS
       See http://svn.sat.qc.ca/trac/lunch for help and documentation.

SEE ALSO
       lunch-slave (1)

lunch 0.4.0                                                       September 2015                                                          LUNCH(1)
