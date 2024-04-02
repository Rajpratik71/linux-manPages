SA-UPDATE(1p)                                           User Contributed Perl Documentation                                          SA-UPDATE(1p)

NAME
       sa-update - automate SpamAssassin rule updates

SYNOPSIS
       sa-update [options]

       Options:

         --channel channel       Retrieve updates from this channel
                                 Use multiple times for multiple channels
         --channelfile file      Retrieve updates from the channels in the file
         --checkonly             Check for update availability, do not install
         --install filename      Install updates directly from this file. Signature
                                 verification will use "file.asc", "file.sha256",
                                 and "file.sha512".
         --allowplugins          Allow updates to load plugin code
         --gpgkey key            Trust the key id to sign releases
                                 Use multiple times for multiple keys
         --gpgkeyfile file       Trust the key ids in the file to sign releases
         --gpghomedir path       Store the GPG keyring in this directory
         --gpg and --nogpg       Use (or do not use) GPG to verify updates
                                 (--gpg is assumed by use of the above
                                 --gpgkey and --gpgkeyfile options)
         --import file           Import GPG key(s) from file into sa-update's
                                 keyring. Use multiple times for multiple files
         --updatedir path        Directory to place updates, defaults to the
                                 SpamAssassin site rules directory
                                 (default: /var/lib/spamassassin/3.004002)
         --refreshmirrors        Force the MIRRORED.BY file to be updated
         -D, --debug [area=n,...]  Print debugging messages
         -v, --verbose           Be verbose, like print updated channel names;
                                 For more verbosity specify multiple times
         -V, --version           Print version
         -h, --help              Print usage message
         -4                      Force using the inet protocol (IPv4), not inet6
         -6                      Force using the inet6 protocol (IPv6), not inet

DESCRIPTION
       sa-update automates the process of downloading and installing new rules and configuration, based on channels.  The default channel is
       updates.spamassassin.org, which has updated rules since the previous release.

       Update archives are verified using SHA256 and SHA512 hashes and GPG signatures, by default.

       Note that "sa-update" will not restart "spamd" or otherwise cause a scanner to reload the now-updated ruleset automatically.  Instead,
       "sa-update" is typically used in something like the following manner:

               sa-update && /etc/init.d/spamassassin reload

       This works because "sa-update" only returns an exit status of 0 if it has successfully downloaded and installed an updated ruleset.

       The program sa-update uses the underlying operating system umask for the updated rule files it installs.  You may wish to run sa-update
       from a script that sets the umask prior to calling sa-update.  For example:

               #!/bin/sh
               umask 022
               sa-update

OPTIONS
       --channel
           sa-update can update multiple channels at the same time.  By default, it will only access "updates.spamassassin.org", but more channels
           can be specified via this option.  If there are multiple additional channels, use the option multiple times, once per channel.  i.e.:

                   sa-update --channel foo.example.com --channel bar.example.com

       --channelfile
           Similar to the --channel option, except specify the additional channels in a file instead of on the commandline.  This is useful when
           there are a lot of additional channels.

       --checkonly
           Only check if an update is available, don't actually download and install it.  The exit code will be 0 or 1 as described below.

       --install
           Install updates "offline", from the named tar.gz file, instead of performing DNS lookups and HTTP invocations.

           Files named file.sha256, file.sha512, and file.asc will be used for the SHA256 and SHA512 hashes and the GPG signature, respectively.
           The filename provided must contain a version number of at least 3 digits, which will be used as the channel's update version number.

           Multiple --channel switches cannot be used with --install.  To install multiple channels from tarballs, run "sa-update" multiple times
           with different --channel and --install switches, e.g.:

                   sa-update --channel foo.example.com --install foo-34958.tgz
                   sa-update --channel bar.example.com --install bar-938455.tgz

       --allowplugins
           Allow downloaded updates to activate plugins.  The default is not to activate plugins; any "loadplugin" or "tryplugin" lines will be
           commented in the downloaded update rules files.

       --gpg, --nogpg
           sa-update by default will verify update archives by use of SHA256 and SHA512 checksums and GPG signature.  SHA* hashes can verify
           whether or not the downloaded archive has been corrupted, but it does not offer any form of security regarding whether or not the
           downloaded archive is legitimate (aka: non-modifed by evildoers).  GPG verification of the archive is used to solve that problem.

           If you wish to skip GPG verification, you can use the --nogpg option to disable its use.  Use of the following gpgkey-related options
           will override --nogpg and keep GPG verification enabled.

           Note: Currently, only GPG itself is supported (ie: not PGP).  v1.2 has been tested, although later versions ought to work as well.

       --gpgkey
           sa-update has the concept of "release trusted" GPG keys.  When an archive is downloaded and the signature verified, sa-update requires
           that the signature be from one of these "release trusted" keys or else verification fails.  This prevents third parties from
           manipulating the files on a mirror, for instance, and signing with their own key.

           By default, sa-update trusts key ids "24F434CE" and "5244EC45", which are the standard SpamAssassin release key and its sub-key.  Use
           this option to trust additional keys.  See the --import option for how to add keys to sa-update's keyring.  For sa-update to use a key
           it must be in sa-update's keyring and trusted.

           For multiple keys, use the option multiple times.  i.e.:

                   sa-update --gpgkey E580B363 --gpgkey 298BC7D0

           Note: use of this option automatically enables GPG verification.

       --gpgkeyfile
           Similar to the --gpgkey option, except specify the additional keys in a file instead of on the commandline.  This is extremely useful
           when there are a lot of additional keys that you wish to trust.

       --gpghomedir
           Specify a directory path to use as a storage area for the "sa-update" GPG keyring.  By default, this is

                   /etc/spamassassin/sa-update-keys

       --import
           Use to import GPG key(s) from a file into the sa-update keyring which is located in the directory specified by --gpghomedir.  Before
           using channels from third party sources, you should use this option to import the GPG key(s) used by those channels.  You must still
           use the --gpgkey or --gpgkeyfile options above to get sa-update to trust imported keys.

           To import multiple keys, use the option multiple times.  i.e.:

                   sa-update --import channel1-GPG.KEY --import channel2-GPG.KEY

           Note: use of this option automatically enables GPG verification.

       --refreshmirrors
           Force the list of sa-update mirrors for each channel, stored in the MIRRORED.BY file, to be updated.  By default, the MIRRORED.BY file
           will be cached for up to 7 days after each time it is downloaded.

       --updatedir
           By default, "sa-update" will use the system-wide rules update directory:

                   /var/lib/spamassassin/3.004002

           If the updates should be stored in another location, specify it here.

           Note that use of this option is not recommended; if you're just using sa-update to download updated rulesets for a scanner, and sa-
           update is placing updates in the wrong directory, you probably need to rebuild SpamAssassin with different "Makefile.PL" arguments,
           instead of overriding sa-update's runtime behaviour.

       -D [area,...], --debug [area,...]
           Produce debugging output.  If no areas are listed, all debugging information is printed.  Diagnostic output can also be enabled for
           each area individually; area is the area of the code to instrument. For example, to produce diagnostic output on channel, gpg, and
           http, use:

                   sa-update -D channel,gpg,http

           For more information about which areas (also known as channels) are available, please see the documentation at
           <http://wiki.apache.org/spamassassin/DebugChannels>.

       -h, --help
           Print help message and exit.

       -V, --version
           Print sa-update version and exit.

EXIT CODES
       In absence of a --checkonly option, an exit code of 0 means: an update was available, and was downloaded and installed successfully.  If
       --checkonly was specified, an exit code of 0 means: an update was available.

       An exit code of 1 means no fresh updates were available.

       An exit code of 2 means that at least one update is available but that a lint check of the site pre files failed.  The site pre files must
       pass a lint check before any updates are attempted.

       An exit code of 3 means that at least one update succeeded while other channels failed.  If using sa-compile, you should proceed with it.

       An exit code of 4 or higher, indicates that errors occurred while attempting to download and extract updates, and no channels were updated.

SEE ALSO
       Mail::SpamAssassin(3) Mail::SpamAssassin::Conf(3) spamassassin(1) spamd(1) <http://wiki.apache.org/spamassassin/RuleUpdates>

PREREQUESITES
       "Mail::SpamAssassin"

BUGS
       See <http://issues.apache.org/SpamAssassin/>

AUTHORS
       The Apache SpamAssassin(tm) Project <http://spamassassin.apache.org/>

LICENSE AND COPYRIGHT
       SpamAssassin is distributed under the Apache License, Version 2.0, as described in the file "LICENSE" included with the distribution.

       Copyright (C) 2015 The Apache Software Foundation

perl v5.22.1                                                        2018-11-06                                                       SA-UPDATE(1p)
