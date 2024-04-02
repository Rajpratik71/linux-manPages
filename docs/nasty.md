NASTY(1)                                                           User Commands                                                          NASTY(1)

NAME
       nasty - A tool which helps you to recover your GPG passphrase

SYNOPSIS
       nasty [OPTIONS]

DESCRIPTION
       nasty is a program that helps you to recover the passphrase of your PGP or GPG-key in case you forget or lost it.

OPTIONS
       -a x   set minimum length of passphrase

       -b x   set maximum length

       -m x   set guessing mode:
                 incremental: try them all
                 random: try at random
                 file: read phrases from file (use -i)

       -i x   file to read the passphrases from

       -f x   file to write the found passphrase to

       -c x...
              charset, one or more from the following:
                 a: a-z
                 A: A-Z
                 0: 0-9
                 .: all ascii values (32...126)
                 +: 32...255 (default(!))

       -h     show command options

ISSUES
       Nasty  will  not  work  if you try it with a gpg-agent running in your system. For obvious reasons the agent will ask you the passphrase to
       access your private key - which you probably don't record, right? :)

AUTHOR
       This manual page was written by Tiago Bortoletto Vaz <tiago@debian.org> for the Debian GNU/Linux system (but may be used by others).

nasty                                                             September 2009                                                          NASTY(1)
