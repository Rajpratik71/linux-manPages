scl(1)                                                                                     General Commands Manual                                                                                     scl(1)



NAME
       scl - Setup and run software from Software Collection environment

SYNOPSIS
       scl <action> <collection1> [<collection2> ...] <command>

       scl <action> <collection1> [<collection2> ...] -- <command>

       scl {-l|--list} [<collection1> <collection2> ...]

       scl register <path>

       scl deregister <collection> [--force]

DESCRIPTION
       This manual page documents scl, a program which is an utility for running software packaged as a Software Collection.

       scl utility allows to execute an application which is not located in the filesystem root hierarchy but is present in an alternative location. This application can still use and benefit from software
       installed in the root filesystem. In order to let an application be visible to the system one has to use scl utility as an interface.

       <action> is a script name to execute in a bash environment before the application itself takes in executed. Currently only enable scriptlet is mandatory which is needed to update search paths, etc.

       One can enable more Software Collections if needed and therefore one can use multiple collections which are enabled by the left-right order as present on scl command-line.

       <command> marks specified Software Collections as enabled. Executes the script, which is expected to set proper environment. Executes the <command>.  Control is returned back to the caller with  the
       original environment as soon as the command finishes. If <command> is '-' (dash) then it is read from the standard input.

       Note:  if  you  use  <command>  consisting of multiple arguments, you either need to use quotes or the -- command separator. Everything that follows the separator will be considered a command or its
       argument.

       Note: some commands modify user environment in some way. Those commands may potentially break SCLs, as their activation also usually depends on env.  modification as well. Typical examples  of  such
       commands are su and sudo. Every collection modifies the environment differently, thus more details may be found in the documentation of the particular collection.

OPTIONS
       -l, --list
              Lists all installed Software Collections on the system.

       -l, --list <collection1> <collection2> ...
              If a collection name is specified then list of installed packages belonging to the collection is listed.

       register <path>
              If  <path>  leads  to  valid  SCL file structure, scl will register that as a SCL.  <path> directory needs to contain enable  scriptlet and root directory, to be considered valid SCL.  <path>
              needs to be an absolute path to the collection location.

       deregister <collection> [--force]
              <collection> will no longer be considered SCL.  If the <collection> was installed locally, then the use of --force is needed.i

EXAMPLES
       scl enable example 'less --version'
              runs command 'less --version' in the environment with collection 'example' enabled

       scl enable foo bar bash
              runs bash instance with foo and bar Software Collections enabled

       cat my_command | scl enable baz -
              run set of commands listed in my_command file in the environment with baz Software Collection enabled

       scl -l list all installed collections

       scl -l example
              list all packages within example collection scl register /foo/bar registers new collection with a name bar

       scl deregister bar --force
              forces the deregistration of collection bar


       AUTHOR

       scl was written by Jindrich Novy <jnovy@redhat.com> and Jan Zeleny <jzeleny@redhat.com>



                                                                                                                                                                                                       scl(1)
