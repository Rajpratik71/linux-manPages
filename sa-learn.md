SA-LEARN(1p)                                            User Contributed Perl Documentation                                           SA-LEARN(1p)

NAME
       sa-learn - train SpamAssassin's Bayesian classifier

SYNOPSIS
       sa-learn [options] [file]...

       sa-learn [options] --dump [ all | data | magic ]

       Options:

        --ham                 Learn messages as ham (non-spam)
        --spam                Learn messages as spam
        --forget              Forget a message
        --use-ignores         Use bayes_ignore_from and bayes_ignore_to
        --sync                Synchronize the database and the journal if needed
        --force-expire        Force a database sync and expiry run
        --dbpath <path>       Allows commandline override (in bayes_path form)
                              for where to read the Bayes DB from
        --dump [all|data|magic]  Display the contents of the Bayes database
                              Takes optional argument for what to display
         --regexp <re>        For dump only, specifies which tokens to
                              dump based on a regular expression.
        -f file, --folders=file  Read list of files/directories from file
        --dir                 Ignored; historical compatibility
        --file                Ignored; historical compatibility
        --mbox                Input sources are in mbox format
        --mbx                 Input sources are in mbx format
        --max-size <b>        Skip messages larger than b bytes;
                              defaults to 256 KB, 0 implies no limit
        --showdots            Show progress using dots
        --progress            Show progress using progress bar
        --no-sync             Skip synchronizing the database and journal
                              after learning
        -L, --local           Operate locally, no network accesses
        --import              Migrate data from older version/non DB_File
                              based databases
        --clear               Wipe out existing database
        --backup              Backup, to STDOUT, existing database
        --restore <filename>  Restore a database from filename
        -u username, --username=username
                              Override username taken from the runtime
                              environment, used with SQL
        -C path, --configpath=path, --config-file=path
                              Path to standard configuration dir
        -p prefs, --prefspath=file, --prefs-file=file
                              Set user preferences file
        --siteconfigpath=path Path for site configs
                              (default:  /usr/etc/spamassassin)
        --cf='config line'    Additional line of configuration
        -D, --debug [area=n,...]  Print debugging messages
        -V, --version         Print version
        -h, --help            Print usage message

DESCRIPTION
       Given a typical selection of your incoming mail classified as spam or ham (non-spam), this tool will feed each mail to SpamAssassin,
       allowing it to 'learn' what signs are likely to mean spam, and which are likely to mean ham.

       Simply run this command once for each of your mail folders, and it will ''learn'' from the mail therein.

       Note that csh-style globbing in the mail folder names is supported; in other words, listing a folder name as "*" will scan every folder
       that matches.  See "Mail::SpamAssassin::ArchiveIterator" for more details.

       If you are using mail boxes in format other than maildir you should use the --mbox or --mbx parameters.

       SpamAssassin remembers which mail messages it has learnt already, and will not re-learn those messages again, unless you use the --forget
       option. Messages learnt as spam will have SpamAssassin markup removed, on the fly.

       If you make a mistake and scan a mail as ham when it is spam, or vice versa, simply rerun this command with the correct classification, and
       the mistake will be corrected.  SpamAssassin will automatically 'forget' the previous indications.

       Users of "spamd" who wish to perform training remotely, over a network, should investigate the "spamc -L" switch.

OPTIONS
       --ham
           Learn the input message(s) as ham.   If you have previously learnt any of the messages as spam, SpamAssassin will forget them first,
           then re-learn them as ham.  Alternatively, if you have previously learnt them as ham, it'll skip them this time around.  If the
           messages have already been filtered through SpamAssassin, the learner will ignore any modifications SpamAssassin may have made.

       --spam
           Learn the input message(s) as spam.   If you have previously learnt any of the messages as ham, SpamAssassin will forget them first,
           then re-learn them as spam.  Alternatively, if you have previously learnt them as spam, it'll skip them this time around.  If the
           messages have already been filtered through SpamAssassin, the learner will ignore any modifications SpamAssassin may have made.

       --folders=filename, -f filename
           sa-learn will read in the list of folders from the specified file, one folder per line in the file.  If the folder is prefixed with
           "ham:type:" or "spam:type:", sa-learn will learn that folder appropriately, otherwise the folders will be assumed to be of the type
           specified by --ham or --spam.

           "type" above is optional, but is the same as the standard for ArchiveIterator: mbox, mbx, dir, file, or detect (the default if not
           specified).

       --mbox
           sa-learn will read in the file(s) containing the emails to be learned, and will process them in mbox format (one or more emails per
           file).

       --mbx
           sa-learn will read in the file(s) containing the emails to be learned, and will process them in mbx format (one or more emails per
           file).

       --use-ignores
           Don't learn the message if a from address matches configuration file item "bayes_ignore_from" or a to address matches
           "bayes_ignore_to".  The option might be used when learning from a large file of messages from which the hammy spam messages or spammy
           ham messages have not been removed.

       --sync
           Synchronize the journal and databases.  Upon successfully syncing the database with the entries in the journal, the journal file is
           removed.

       --force-expire
           Forces an expiry attempt, regardless of whether it may be necessary or not.  Note: This doesn't mean any tokens will actually expire.
           Please see the EXPIRATION section below.

           Note: "--force-expire" also causes the journal data to be synchronized into the Bayes databases.

       --forget
           Forget a given message previously learnt.

       --dbpath
           Allows a commandline override of the bayes_path configuration option.

       --dump option
           Display the contents of the Bayes database.  Without an option or with the all option, all magic tokens and data tokens will be
           displayed.  magic will only display magic tokens, and data will only display the data tokens.

           Can also use the --regexp RE option to specify which tokens to display based on a regular expression.

       --clear
           Clear an existing Bayes database by removing all traces of the database.

           WARNING: This is destructive and should be used with care.

       --backup
           Performs a dump of the Bayes database in machine/human readable format.

           The dump will include token and seen data.  It is suitable for input back into the --restore command.

       --restore=filename
           Performs a restore of the Bayes database defined by filename.

           WARNING: This is a destructive operation, previous Bayes data will be wiped out.

       -h, --help
           Print help message and exit.

       -u username, --username=username
           If specified this username will override the username taken from the runtime environment.  You can use this option to specify users in
           a virtual user configuration when using SQL as the Bayes backend.

           NOTE: This option will not change to the given username, it will only attempt to act on behalf of that user.  Because of this you will
           need to have proper permissions to be able to change files owned by username.  In the case of SQL this generally is not a problem.

       -C path, --configpath=path, --config-file=path
           Use the specified path for locating the distributed configuration files.  Ignore the default directories (usually
           "/usr/share/spamassassin" or similar).

       --siteconfigpath=path
           Use the specified path for locating site-specific configuration files.  Ignore the default directories (usually "/etc/spamassassin" or
           similar).

       --cf='config line'
           Add additional lines of configuration directly from the command-line, parsed after the configuration files are read.   Multiple --cf
           arguments can be used, and each will be considered a separate line of configuration.

       -p prefs, --prefspath=prefs, --prefs-file=prefs
           Read user score preferences from prefs (usually "$HOME/.spamassassin/user_prefs").

       --progress
           Prints a progress bar (to STDERR) showing the current progress.  In the case where no valid terminal is found this option will behave
           very much like the --showdots option.

       -D [area,...], --debug [area,...]
           Produce debugging output. If no areas are listed, all debugging information is printed. Diagnostic output can also be enabled for each
           area individually; area is the area of the code to instrument. For example, to produce diagnostic output on bayes, learn, and dns, use:

                   spamassassin -D bayes,learn,dns

           For more information about which areas (also known as channels) are available, please see the documentation at:

                   C<http://wiki.apache.org/spamassassin/DebugChannels>

           Higher priority informational messages that are suitable for logging in normal circumstances are available with an area of "info".

       --no-sync
           Skip the slow synchronization step which normally takes place after changing database entries.  If you plan to learn from many folders
           in a batch, or to learn many individual messages one-by-one, it is faster to use this switch and run "sa-learn --sync" once all the
           folders have been scanned.

           Clarification: The state of --no-sync overrides the bayes_learn_to_journal configuration option.  If not specified, sa-learn will learn
           to the database directly.  If specified, sa-learn will learn to the journal file.

           Note: --sync and --no-sync can be specified on the same commandline, which is slightly confusing.  In this case, the --no-sync option
           is ignored since there is no learn operation.

       -L, --local
           Do not perform any network accesses while learning details about the mail messages.  This will speed up the learning process, but may
           result in a slightly lower accuracy.

           Note that this is currently ignored, as current versions of SpamAssassin will not perform network access while learning; but future
           versions may.

       --import
           If you previously used SpamAssassin's Bayesian learner without the "DB_File" module installed, it will have created files in other
           formats, such as "GDBM_File", "NDBM_File", or "SDBM_File".  This switch allows you to migrate that old data into the "DB_File" format.
           It will overwrite any data currently in the "DB_File".

           Can also be used with the --dbpath path option to specify the location of the Bayes files to use.

MIGRATION
       There are now multiple backend storage modules available for storing user's bayesian data. As such you might want to migrate from one
       backend to another. Here is a simple procedure for migrating from one backend to another.

       Note that if you have individual user databases you will have to perform a similar procedure for each one of them.

       sa-learn --sync
           This will sync any outstanding journal entries

       sa-learn --backup > backup.txt
           This will save all your Bayes data to a plain text file.

       sa-learn --clear
           This is optional, but good to do to clear out the old database.

       Repeat!
           At this point, if you have multiple databases, you should perform the procedure above for each of them. (i.e. each user's database
           needs to be backed up before continuing.)

       Switch backends
           Once you have backed up all databases you can update your configuration for the new database backend. This will involve at least the
           bayes_store_module config option and may involve some additional config options depending on what is required by the module. (For
           example, you may need to configure an SQL database.)

       sa-learn --restore backup.txt
           Again, you need to do this for every database.

       If you are migrating to SQL you can make use of the -u <username> option in sa-learn to populate each user's database. Otherwise, you must
       run sa-learn as the user who database you are restoring.

INTRODUCTION TO BAYESIAN FILTERING
       (Thanks to Michael Bell for this section!)

       For a more lengthy description of how this works, go to http://www.paulgraham.com/ and see "A Plan for Spam". It's reasonably readable,
       even if statistics make me break out in hives.

       The short semi-inaccurate version: Given training, a spam heuristics engine can take the most "spammy" and "hammy" words and apply
       probabilistic analysis. Furthermore, once given a basis for the analysis, the engine can continue to learn iteratively by applying both the
       non-Bayesian and Bayesian rulesets together to create evolving "intelligence".

       SpamAssassin 2.50 and later supports Bayesian spam analysis, in the form of the BAYES rules. This is a new feature, quite powerful, and is
       disabled until enough messages have been learnt.

       The pros of Bayesian spam analysis:

       Can greatly reduce false positives and false negatives.
           It learns from your mail, so it is tailored to your unique e-mail flow.

       Once it starts learning, it can continue to learn from SpamAssassin and improve over time.

       And the cons:

       A decent number of messages are required before results are useful for ham/spam determination.
       It's hard to explain why a message is or isn't marked as spam.
           i.e.: a straightforward rule, that matches, say, "VIAGRA" is easy to understand. If it generates a false positive or false negative, it
           is fairly easy to understand why.

           With Bayesian analysis, it's all probabilities - "because the past says it is likely as this falls into a probabilistic distribution
           common to past spam in your systems". Tell that to your users!  Tell that to the client when he asks "what can I do to change this".
           (By the way, the answer in this case is "use whitelisting".)

       It will take disk space and memory.
           The databases it maintains take quite a lot of resources to store and use.

GETTING STARTED
       Still interested? Ok, here's the guidelines for getting this working.

       First a high-level overview:

       Build a significant sample of both ham and spam.
           I suggest several thousand of each, placed in SPAM and HAM directories or mailboxes.  Yes, you MUST hand-sort this - otherwise the
           results won't be much better than SpamAssassin on its own. Verify the spamminess/haminess of EVERY message.  You're urged to avoid
           using a publicly available corpus (sample) - this must be taken from YOUR mail server, if it is to be statistically useful.  Otherwise,
           the results may be pretty skewed.

       Use this tool to teach SpamAssassin about these samples, like so:
                   sa-learn --spam /path/to/spam/folder
                   sa-learn --ham /path/to/ham/folder
                   ...

           Let SpamAssassin proceed, learning stuff. When it finds ham and spam it will add the "interesting tokens" to the database.

       If you need SpamAssassin to forget about specific messages, use the --forget option.
           This can be applied to either ham or spam that has run through the sa-learn processes. It's a bit of a hammer, really, lowering the
           weighting of the specific tokens in that message (only if that message has been processed before).

       Learning from single messages uses a command like this:
                   sa-learn --ham --no-sync mailmessage

           This is handy for binding to a key in your mail user agent.  It's very fast, as all the time-consuming stuff is deferred until you run
           with the "--sync" option.

       Autolearning is enabled by default
           If you don't have a corpus of mail saved to learn, you can let SpamAssassin automatically learn the mail that you receive.  If you are
           autolearning from scratch, the amount of mail you receive will determine how long until the BAYES_* rules are activated.

EFFECTIVE TRAINING
       Learning filters require training to be effective.  If you don't train them, they won't work.  In addition, you need to train them with new
       messages regularly to keep them up-to-date, or their data will become stale and impact accuracy.

       You need to train with both spam and ham mails.  One type of mail alone will not have any effect.

       Note that if your mail folders contain things like forwarded spam, discussions of spam-catching rules, etc., this will cause trouble.  You
       should avoid scanning those messages if possible.  (An easy way to do this is to move them aside, into a folder which is not scanned.)

       If the messages you are learning from have already been filtered through SpamAssassin, the learner will compensate for this.  In effect, it
       learns what each message would look like if you had run "spamassassin -d" over it in advance.

       Another thing to be aware of, is that typically you should aim to train with at least 1000 messages of spam, and 1000 ham messages, if
       possible.  More is better, but anything over about 5000 messages does not improve accuracy significantly in our tests.

       Be careful that you train from the same source -- for example, if you train on old spam, but new ham mail, then the classifier will think
       that a mail with an old date stamp is likely to be spam.

       It's also worth noting that training with a very small quantity of ham, will produce atrocious results.  You should aim to train with at
       least the same amount (or more if possible!) of ham data than spam.

       On an on-going basis, it is best to keep training the filter to make sure it has fresh data to work from.  There are various ways to do
       this:

       1. Supervised learning
           This means keeping a copy of all or most of your mail, separated into spam and ham piles, and periodically re-training using those.  It
           produces the best results, but requires more work from you, the user.

           (An easy way to do this, by the way, is to create a new folder for 'deleted' messages, and instead of deleting them from other folders,
           simply move them in there instead.  Then keep all spam in a separate folder and never delete it.  As long as you remember to move
           misclassified mails into the correct folder set, it is easy enough to keep up to date.)

       2. Unsupervised learning from Bayesian classification
           Another way to train is to chain the results of the Bayesian classifier back into the training, so it reinforces its own decisions.
           This is only safe if you then retrain it based on any errors you discover.

           SpamAssassin does not support this method, due to experimental results which strongly indicate that it does not work well, and since
           Bayes is only one part of the resulting score presented to the user (while Bayes may have made the wrong decision about a mail, it may
           have been overridden by another system).

       3. Unsupervised learning from SpamAssassin rules
           Also called 'auto-learning' in SpamAssassin.  Based on statistical analysis of the SpamAssassin success rates, we can automatically
           train the Bayesian database with a certain degree of confidence that our training data is accurate.

           It should be supplemented with some supervised training in addition, if possible.

           This is the default, but can be turned off by setting the SpamAssassin configuration parameter "bayes_auto_learn" to 0.

       4. Mistake-based training
           This means training on a small number of mails, then only training on messages that SpamAssassin classifies incorrectly.  This works,
           but it takes longer to get it right than a full training session would.

FILES
       sa-learn and the other parts of SpamAssassin's Bayesian learner, use a set of persistent database files to store the learnt tokens, as
       follows.

       bayes_toks
           The database of tokens, containing the tokens learnt, their count of occurrences in ham and spam, and the timestamp when the token was
           last seen in a message.

           This database also contains some 'magic' tokens, as follows: the version number of the database, the number of ham and spam messages
           learnt, the number of tokens in the database, and timestamps of: the last journal sync, the last expiry run, the last expiry token
           reduction count, the last expiry timestamp delta, the oldest token timestamp in the database, and the newest token timestamp in the
           database.

           This is a database file, using "DB_File".  The database 'version number' is 0 for databases from 2.5x, 1 for databases from certain
           2.6x development releases, 2 for 2.6x, and 3 for 3.0 and later releases.

       bayes_seen
           A map of Message-Id and some data from headers and body to what that message was learnt as. This is used so that SpamAssassin can avoid
           re-learning a message it has already seen, and so it can reverse the training if you later decide that message was learnt incorrectly.

           This is a database file, using "DB_File".

       bayes_journal
           While SpamAssassin is scanning mails, it needs to track which tokens it uses in its calculations.  To avoid the contention of having
           each SpamAssassin process attempting to gain write access to the Bayes DB, the token timestamps are written to a 'journal' file which
           will later (either automatically or via "sa-learn --sync") be used to synchronize the Bayes DB.

           Also, through the use of "bayes_learn_to_journal", or when using the "--no-sync" option with sa-learn, the actual learning data will
           take be placed into the journal for later synchronization.  This is typically useful for high-traffic sites to avoid the same
           contention as stated above.

EXPIRATION
       Since SpamAssassin can auto-learn messages, the Bayes database files could increase perpetually until they fill your disk.  To control
       this, SpamAssassin performs journal synchronization and bayes expiration periodically when certain criteria (listed below) are met.

       SpamAssassin can sync the journal and expire the DB tokens either manually or opportunistically.  A journal sync is due if --sync is passed
       to sa-learn (manual), or if the following is true (opportunistic):

       - bayes_journal_max_size does not equal 0 (means don't sync)
       - the journal file exists

       and either:

       - the journal file has a size greater than bayes_journal_max_size

       or

       - a journal sync has previously occurred, and at least 1 day has passed since that sync

       Expiry is due if --force-expire is passed to sa-learn (manual), or if all of the following are true (opportunistic):

       - the last expire was attempted at least 12hrs ago
       - bayes_auto_expire does not equal 0
       - the number of tokens in the DB is > 100,000
       - the number of tokens in the DB is > bayes_expiry_max_db_size
       - there is at least a 12 hr difference between the oldest and newest token atimes

   EXPIRE LOGIC
       If either the manual or opportunistic method causes an expire run to start, here is the logic that is used:

       - figure out how many tokens to keep.  take the larger of either bayes_expiry_max_db_size * 75% or 100,000 tokens.  therefore, the goal
       reduction is number of tokens - number of tokens to keep.
       - if the reduction number is < 1000 tokens, abort (not worth the effort).
       - if an expire has been done before, guesstimate the new atime delta based on the old atime delta.  (new_atime_delta = old_atime_delta *
       old_reduction_count / goal)
       - if no expire has been done before, or the last expire looks "weird", do an estimation pass.  The definition of "weird" is:
           - last expire over 30 days ago
           - last atime delta was < 12 hrs
           - last reduction count was < 1000 tokens
           - estimated new atime delta is < 12 hrs
           - the difference between the last reduction count and the goal reduction count is > 50%

   ESTIMATION PASS LOGIC
       Go through each of the DB's tokens.  Starting at 12hrs, calculate whether or not the token would be expired (based on the difference
       between the token's atime and the db's newest token atime) and keep the count.  Work out from 12hrs exponentially by powers of 2.  ie:
       12hrs * 1, 12hrs * 2, 12hrs * 4, 12hrs * 8, and so on, up to 12hrs * 512 (6144hrs, or 256 days).

       The larger the delta, the smaller the number of tokens that will be expired.  Conversely, the number of tokens goes up as the delta gets
       smaller.  So starting at the largest atime delta, figure out which delta will expire the most tokens without going above the goal
       expiration count.  Use this to choose the atime delta to use, unless one of the following occurs:

       - the largest atime (smallest reduction count) would expire too many tokens.  this means the learned tokens are mostly old and there needs
       to be new tokens learned before an expire can occur.
       - all of the atime choices result in 0 tokens being removed. this means the tokens are all newer than 12 hours and there needs to be new
       tokens learned before an expire can occur.
       - the number of tokens that would be removed is < 1000.  the benefit isn't worth the effort.  more tokens need to be learned.

       If the expire run gets past this point, it will continue to the end.  A new DB is created since the majority of DB libraries don't shrink
       the DB file when tokens are removed.  So we do the "create new, migrate old to new, remove old, rename new" shuffle.

   EXPIRY RELATED CONFIGURATION SETTINGS
       "bayes_auto_expire" is used to specify whether or not SpamAssassin ought to opportunistically attempt to expire the Bayes database. The
       default is 1 (yes).
       "bayes_expiry_max_db_size" specifies both the auto-expire token count point, as well as the resulting number of tokens after expiry as
       described above.  The default value is 150,000, which is roughly equivalent to a 6Mb database file if you're using DB_File.
       "bayes_journal_max_size" specifies how large the Bayes journal will grow before it is opportunistically synced.  The default value is
       102400.

INSTALLATION
       The sa-learn command is part of the Mail::SpamAssassin Perl module.  Install this as a normal Perl module, using "perl -MCPAN -e shell", or
       by hand.

SEE ALSO
       spamassassin(1) spamc(1) Mail::SpamAssassin(3) Mail::SpamAssassin::ArchiveIterator(3)

       <http://www.paulgraham.com/> Paul Graham's "A Plan For Spam" paper

       <http://www.linuxjournal.com/article/6467> Gary Robinson's f(x) and combining algorithms, as used in SpamAssassin

       <http://www.bgl.nu/~glouis/bogofilter/> 'Training on error' page.  A discussion of various Bayes training regimes, including 'train on
       error' and unsupervised training.

PREREQUISITES
       "Mail::SpamAssassin"

AUTHORS
       The SpamAssassin(tm) Project <http://spamassassin.apache.org/>

perl v5.22.1                                                        2018-11-06                                                        SA-LEARN(1p)
