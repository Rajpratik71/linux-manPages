SALT-KEY(1)                                                            Salt                                                            SALT-KEY(1)

NAME
       salt-key - salt-key Documentation

SYNOPSIS
          salt-key [ options ]

DESCRIPTION
       Salt-key executes simple management of Salt server public keys used for authentication.

       On  initial  connection, a Salt minion sends its public key to the Salt master. This key must be accepted using the salt-key command on the
       Salt master.

       Salt minion keys can be in one of the following states:

       · unaccepted: key is waiting to be accepted.

       · accepted: key was accepted and the minion can communicate with the Salt master.

       · rejected: key was rejected using the salt-key command. In this state the minion does not receive any communication from the Salt master.

       · denied: key was rejected automatically by the Salt master.  This occurs when a minion has a duplicate ID, or when a minion was rebuilt or
         had  new keys generated and the previous key was not deleted from the Salt master. In this state the minion does not receive any communi‐
         cation from the Salt master.

       To change the state of a minion key, use -d to delete the key and then accept or reject the key.

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

       -u USER, --user=USER
              Specify user to run salt-key

       --hard-crash
              Raise any original exception rather than exiting gracefully. Default is False.

       -q, --quiet
              Suppress output

       -y, --yes
              Answer 'Yes' to all questions presented, defaults to False

       --rotate-aes-key=ROTATE_AES_KEY
              Setting  this  to False prevents the master from refreshing the key session when keys are deleted or rejected, this lowers the secu‐
              rity of the key deletion/rejection operation. Default is True.

   Logging Options
       Logging options which override any settings defined on the configuration files.

       --log-file=LOG_FILE
              Log file path. Default: /var/log/salt/minion.

       --log-file-level=LOG_LEVEL_LOGFILE
              Logfile logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

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

   Actions
       -l ARG, --list=ARG
              List the public keys. The args pre, un, and unaccepted will list unaccepted/unsigned keys. acc or accepted will list accepted/signed
              keys. rej or rejected will list rejected keys.  Finally, all will list all keys.

       -L, --list-all
              List all public keys. (Deprecated: use --list all)

       -a ACCEPT, --accept=ACCEPT
              Accept the specified public key (use --include-all to match rejected keys in addition to pending keys). Globs are supported.

       -A, --accept-all
              Accepts all pending keys.

       -r REJECT, --reject=REJECT
              Reject the specified public key (use --include-all to match accepted keys in addition to pending keys). Globs are supported.

       -R, --reject-all
              Rejects all pending keys.

       --include-all
              Include non-pending keys when accepting/rejecting.

       -p PRINT, --print=PRINT
              Print the specified public key.

       -P, --print-all
              Print all public keys

       -d DELETE, --delete=DELETE
              Delete the specified key. Globs are supported.

       -D, --delete-all
              Delete all keys.

       -f FINGER, --finger=FINGER
              Print the specified key's fingerprint.

       -F, --finger-all
              Print all keys' fingerprints.

   Key Generation Options
       --gen-keys=GEN_KEYS
              Set a name to generate a keypair for use with salt

       --gen-keys-dir=GEN_KEYS_DIR
              Set the directory to save the generated keypair.  Only works with 'gen_keys_dir' option; default is the current directory.

       --keysize=KEYSIZE
              Set the keysize for the generated key, only works with the '--gen-keys' option, the key size must be 2048 or  higher,  otherwise  it
              will be rounded up to 2048. The default is 2048.

       --gen-signature
              Create  a signature file of the master's public-key named master_pubkey_signature. The signature can be sent to a minion in the mas‐
              ter's auth-reply and enables the minion to verify the master's public-key cryptographically. This requires  a  new  signing-key-pair
              which can be auto-created with the --auto-create parameter.

       --priv=PRIV
              The private-key file to create a signature with

       --signature-path=SIGNATURE_PATH
              The path where the signature file should be written

       --pub=PUB
              The public-key file to create a signature for

       --auto-create
              Auto-create a signing key-pair if it does not yet exist

SEE ALSO
       salt(7) salt-master(1) salt-minion(1)

AUTHOR
       Thomas S. Hatch <thatch45@gmail.com> and many others, please see the Authors file

2019.2.0                                                           Jan 08, 2019                                                        SALT-KEY(1)
