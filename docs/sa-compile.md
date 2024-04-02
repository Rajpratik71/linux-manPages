SA-COMPILE(1)                                                                        User Contributed Perl Documentation                                                                        SA-COMPILE(1)



NAME
       sa-compile - compile SpamAssassin ruleset into native code

SYNOPSIS
       sa-compile [options]

       Options:

         --list                        Output base string list to STDOUT
         --sudo                        Use 'sudo' for privilege escalation
         --keep-tmps                   Keep temporary files instead of deleting
         -C path, --configpath=path, --config-file=path
                                       Path to standard configuration dir
         -p prefs, --prefspath=file, --prefs-file=file
                                       Set user preferences file
         --siteconfigpath=path         Path for site configs
                                       (default: /etc/mail/spamassassin)
         --updatedir=path              Directory to place updates
                 (default: /var/lib/spamassassin/compiled/<perlversion>/3.004000)
         --cf='config line'            Additional line of configuration
         -D, --debug [area=n,...]      Print debugging messages
         -V, --version                 Print version
         -h, --help                    Print usage message

DESCRIPTION
       sa-compile uses "re2c" to compile the site-wide parts of the SpamAssassin ruleset. No part of user_prefs or any files included from user_prefs can be built into the compiled set.

       This compiled set is then used by the "Mail::SpamAssassin::Plugin::Rule2XSBody" plugin to speed up SpamAssassin's operation, where possible, and when that plugin is loaded.

       "re2c" can match strings much faster than perl code, by constructing a DFA to match many simple strings in parallel, and compiling that to native object code.  Not all SpamAssassin rules are
       amenable to this conversion, however.

       This requires "re2c" (see "http://re2c.org/"), and the C compiler used to build Perl XS modules, be installed.

       Note that running this, and creating a compiled ruleset, will have no effect on SpamAssassin scanning speeds unless you also edit your "v320.pre" file and ensure this line is uncommented:

         loadplugin Mail::SpamAssassin::Plugin::Rule2XSBody

       Additionally, "sa-compile" will not restart "spamd" or otherwise cause a scanner to reload the now-compiled ruleset automatically.

OPTIONS
       --list
           Output the extracted base strings to STDOUT, instead of generating the C extension code.

       --sudo
           Use sudo(8) to run code as 'root' when writing files to the compiled-rules storage area (which is "/var/lib/spamassassin/compiled/5.016/3.004000" by default).

       --quiet
           Produce less diagnostic output.  Errors will still be displayed.

       --keep-tmps
           Keep temporary files after the script completes, instead of deleting them.

       -C path, --configpath=path, --config-file=path
           Use the specified path for locating the distributed configuration files.  Ignore the default directories (usually "/usr/share/spamassassin" or similar).

       --siteconfigpath=path
           Use the specified path for locating site-specific configuration files.  Ignore the default directories (usually "/etc/mail/spamassassin" or similar).

       --updatedir
           By default, "sa-compile" will use the system-wide rules update directory:

                   /var/lib/spamassassin/compiled/5.016/3.004000

           If the updates should be stored in another location, specify it here.

           Note that use of this option is not recommended; if sa-compile is placing the compiled rules the wrong directory, you probably need to rebuild SpamAssassin with different "Makefile.PL"
           arguments, instead of overriding sa-compile's runtime behaviour.

       --cf='config line'
           Add additional lines of configuration directly from the command-line, parsed after the configuration files are read.   Multiple --cf arguments can be used, and each will be considered a separate
           line of configuration.

       -p prefs, --prefspath=prefs, --prefs-file=prefs
           Read user score preferences from prefs (usually "$HOME/.spamassassin/user_prefs") .

       -D [area,...], --debug [area,...]
           Produce debugging output.  If no areas are listed, all debugging information is printed.  Diagnostic output can also be enabled for each area individually; area is the area of the code to
           instrument.

           For more information about which areas (also known as channels) are available, please see the documentation at <http://wiki.apache.org/spamassassin/DebugChannels>.

       -h, --help
           Print help message and exit.

       -V, --version
           Print sa-compile version and exit.

SEE ALSO
       Mail::SpamAssassin(3) spamassassin(1) spamd(1)

PREREQUESITES
       "Mail::SpamAssassin" "re2c" "Mail::SpamAssassin::Plugin::Rule2XSBody"

BUGS
       See <http://issues.apache.org/SpamAssassin/>

AUTHORS
       The Apache SpamAssassin(tm) Project <http://spamassassin.apache.org/>

COPYRIGHT
       SpamAssassin is distributed under the Apache License, Version 2.0, as described in the file "LICENSE" included with the distribution.



perl v5.16.3                                                                                      2018-10-15                                                                                    SA-COMPILE(1)
