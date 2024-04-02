SALT(1)                                                                Salt                                                                SALT(1)

NAME
       salt - salt

SYNOPSIS
          salt '*' [ options ] sys.doc

          salt -E '.*' [ options ] sys.doc cmd

          salt -G 'os:Arch.*' [ options ] test.ping

          salt -C 'G@os:Arch.* and webserv* or G@kernel:FreeBSD' [ options ] test.ping

DESCRIPTION
       Salt allows for commands to be executed across a swath of remote systems in parallel. This means that remote systems can be both controlled
       and queried with ease.

OPTIONS
       --version
              Print the version of Salt that is running.

       --versions-report
              Show program's dependencies and version number, and then exit

       -h, --help
              Show the help message and exit

       -c CONFIG_DIR, --config-dir=CONFIG_dir
              The location of the Salt configuration directory. This directory contains the configuration files for Salt master and  minions.  The
              default location on most systems is /etc/salt.

       -t TIMEOUT, --timeout=TIMEOUT
              The timeout in seconds to wait for replies from the Salt minions. The timeout number specifies how long the command line client will
              wait to query the minions and check on running jobs. Default: 5

       -s, --static
              By default as of version 0.9.8 the salt command returns data to the console as it is received from minions,  but  previous  releases
              would  return data only after all data was received. Use the static option to only return the data with a hard timeout and after all
              minions have returned.  Without the static option, you will get a separate JSON string per minion which makes JSON output invalid as
              a whole.

       --async
              Instead of waiting for the job to run on minions only print the job id of the started execution and complete.

       --subset=SUBSET
              Execute  the  routine  on  a  random subset of the targeted minions.  The minions will be verified that they have the named function
              before executing. The SUBSET argument is the count of the minions to target.

       -v VERBOSE, --verbose
              Turn on verbosity for the salt call, this will cause the salt command to print out extra data like the job id.

       --hide-timeout
              Instead of showing the return data for all minions. This option prints only the online minions which could be reached.

       -b BATCH, --batch-size=BATCH
              Instead of executing on all targeted minions at once, execute on a progressive set of minions. This option takes an argument in  the
              form of an explicit number of minions to execute at once, or a percentage of minions to execute on.

       -a EAUTH, --auth=EAUTH
              Pass in an external authentication medium to validate against. The credentials will be prompted for. The options are auto, keystone,
              ldap, and pam. Can be used with the -T option.

       -T, --make-token
              Used in conjunction with the -a option. This creates a token that allows for the authenticated user to send commands without needing
              to re-authenticate.

       --return=RETURNER
              Choose  an  alternative returner to call on the minion, if an alternative returner is used then the return will not come back to the
              command line but will be sent to the specified return system.  The options are carbon, cassandra, couchbase, couchdb, elasticsearch,
              etcd,  hipchat,  local,  local_cache,  memcache, mongo, mysql, odbc, postgres, redis, sentry, slack, sms, smtp, sqlite3, syslog, and
              xmpp.

       -d, --doc, --documentation
              Return the documentation for the module functions available on the minions

       --args-separator=ARGS_SEPARATOR
              Set the special argument used as a delimiter between command arguments of compound commands. This is useful when one wants  to  pass
              commas as arguments to some of the commands in a compound command.

   Logging Options
       Logging options which override any settings defined on the configuration files.

       -l LOG_LEVEL, --log-level=LOG_LEVEL
              Console logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

       --log-file=LOG_FILE
              Log file path. Default: /var/log/salt/master.

       --log-file-level=LOG_LEVEL_LOGFILE
              Logfile logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

   Target Selection
       The     default     matching     that     Salt     utilizes     is     shell-style     globbing     around     the     minion    id.    See
       https://docs.python.org/2/library/fnmatch.html#module-fnmatch.

       -E, --pcre
              The target expression will be interpreted as a PCRE regular expression rather than a shell glob.

       -L, --list
              The target expression will be interpreted as a comma-delimited list; example: server1.foo.bar,server2.foo.bar,example7.quo.qux

       -G, --grain
              The target expression matches values returned by the Salt grains system on the minions. The target expression is in  the  format  of
              '<grain value>:<glob expression>'; example: 'os:Arch*'

              This  was changed in version 0.9.8 to accept glob expressions instead of regular expression. To use regular expression matching with
              grains, use the --grain-pcre option.

       --grain-pcre
              The target expression matches values returned by the Salt grains system on the minions. The target expression is in  the  format  of
              '<grain value>:< regular expression>'; example: 'os:Arch.*'

       -N, --nodegroup
              Use a predefined compound target defined in the Salt master configuration file.

       -R, --range
              Instead  of using shell globs to evaluate the target, use a range expression to identify targets. Range expressions look like %clus‐
              ter.

              Using the Range option requires that a range server is set up and the location of the range server is referenced in the master  con‐
              figuration file.

       -C, --compound
              Utilize  many  target  definitions  to make the call very granular. This option takes a group of targets separated by and or or. The
              default matcher is a glob as usual. If something other than a glob is used, preface it with the letter denoting the  type;  example:
              'webserv* and G@os:Debian or E@db*' Make sure that the compound target is encapsulated in quotes.

       -I, --pillar
              Instead of using shell globs to evaluate the target, use a pillar value to identify targets. The syntax for the target is the pillar
              key followed by a glob expression: "role:production*"

       -S, --ipcidr
              Match based on Subnet (CIDR notation) or IPv4 address.

   Output Options
       --out  Pass in an alternative outputter to display the return of data. This outputter can be any of the available outputters:
                 grains, highstate, json, key, overstatestage, pprint, raw, txt, yaml

              Some outputters are formatted only for data returned from specific functions; for instance, the grains outputter will not  work  for
              non-grains data.

              If  an outputter is used that does not support the data passed into it, then Salt will fall back on the pprint outputter and display
              the return data using the Python pprint standard library module.

              NOTE:
                 If using --out=json, you will probably want --static as well.  Without the static option, you will get a separate JSON string per
                 minion  which  makes JSON output invalid as a whole.  This is due to using an iterative outputter. So if you want to feed it to a
                 JSON parser, use --static as well.

       --out-indent OUTPUT_INDENT, --output-indent OUTPUT_INDENT
              Print the output indented by the provided value in spaces. Negative values disable indentation. Only applicable in  outputters  that
              support indentation.

       --out-file=OUTPUT_FILE, --output-file=OUTPUT_FILE
              Write the output to the specified file.

       --out-file-append, --output-file-append
              Append the output to the specified file.

       --no-color
              Disable all colored output

       --force-color
              Force colored output

              NOTE:
                 When using colored output the color codes are as follows:

                 green  denotes success, red denotes failure, blue denotes changes and success and yellow denotes a expected future change in con‐
                 figuration.

       --state-output=STATE_OUTPUT, --state_output=STATE_OUTPUT
              Override the configured state_output value for minion output. One of 'full',  'terse',  'mixed',  'changes'  or  'filter'.  Default:
              'none'.

       --state-verbose=STATE_VERBOSE, --state_verbose=STATE_VERBOSE
              Override the configured state_verbose value for minion output. Set to True or False. Default: none.

SEE ALSO
       salt(7) salt-master(1) salt-minion(1)

AUTHOR
       Thomas S. Hatch <thatch45@gmail.com> and many others, please see the Authors file

2019.2.0                                                           Jan 08, 2019                                                            SALT(1)
