dcut(1)                                                       General Commands Manual                                                      dcut(1)

NAME
       dcut - Debian archive .commands file upload tool

SYNTAX
       dcut [options] [host] [command [, command]]

       dcut -U filename [host]

DESCRIPTION
       dcut creates and / or uploads .commands files for the Debian FTP archive upload queue.  It is a companion for dput and uses dput configura‐
       tion files.  As with dput, you can specify a host defined in the dput configuration file. In case your host is funnily named, i.e. it could
       mistaken  for  a  command,  you  may  also use a command line option to specify the host.  In default operation mode (unless you request to
       upload an existing file), the host description is followed by a comma-separated list of commands. (Semicolons also work but  require  shell
       escaping.)

COMMANDS
       Presently supported commands are rm, reschedule and cancel. rm can be used to remove files from the UploadQueue directories. dcut generates
       commands that search the subdirectories automatically, but you can also specify  --nosearchdirs  and  then  target  individual  UploadQueue
       directories, i.e. either filenames without path for regular incoming or DELAYED/#-day/filename. Wildcards are accepted. reschedule changes-
       file #-day can be used to move an upload from any DEFERRED queue to #-day (use 0-day for immediate processing).  cancel  changes-file  can‐
       cels  an  upload from DEFERRED.  Both reschedule and cancel take a complete basename of a changes file as argument and operate on the whole
       upload, they process the changes and all files mentioned by it.  The authorative documentation for the commands interface can be  found  at
       "ftp://ftp.upload.debian.org/pub/UploadQueue/README".

       The options try to resemble dput's to the extent possible.

       Note  that  dcut  calls debsign to sign any commands file generated.  In particular, debsign does basic syntax checking on the commands you
       specify.

OPTIONS
       -c filename, --config=filename
              Use config file filename.

       -d, --debug
              Print debug messages.

       -h, --help
              Print help information and exit.

       --host=host
              Upload to host (as found in the dput configuration).  Use this if your host is named like one of the commands.

       -m maintainer, --maintainer=maintainer
              Use maintainer (full email) for the uploader field and gpg key selection.  This has no effect when --upload is used.

       -k keyid, --keyid=keyid
              Use keyid for signing. Default is to let debsign choose a keyid.  This has no effect when --upload is used.

       -O filename, --output=filename
              Write commands file to filename instead of uploading.  You sould not specify a host when  using  this  option.   Also,  this  option
              should not be used with --upload.  Both filename and filename.asc will be overwritten.

       -P, --passive
              Use passive ftp instead of active.

       -s, --simulate
              Simulate an upload only.

       -U filename, --upload=filename
              Upload commands file. Note: No checks (syntax or presence/validity of signature) are currently performed.

       -i filename, --input=filename
              Read an input changes file to create a commands file that can remove the files listed in the .changes file from the upload queue.

       -v, --version
              Print version information and exit.

ENVIRONMENT
       The  program  uses  the environment variables DEBEMAIL or EMAIL and DEBFULLNAME to populate the uploader field. Also, environment variables
       may be used in search of a suitable place for temporary files.

EXAMPLES
       To upload a GPG signed commands file that removes dput_0.9.2.33_all.deb file from the queue, one would have to do

           $ dcut rm dput_0.9.2.33_all.deb

       This creates and uploads a commands file that looks like the following:

       -----BEGIN PGP SIGNED MESSAGE-----
       Hash: SHA1

       Uploader: Foo Bar <foo@bar.org>
       Commands:
        rm dput_0.9.2.33_all.deb

       -----BEGIN PGP SIGNATURE-----
       Version: GnuPG v1.4.9 (GNU/Linux)

       iEYEARECAAYKAkisYx0ACgkQ4eu+pS04mIfwLQCg85XVpae/LHLrbvzywcQNt9PS
       ztsAoMgw6HjcI9flfmwjgMiapcu379Pu
       =fjp0
       -----END PGP SIGNATURE-----

       To upload a GPG signed commands file that removes files named in dput_0.9.4_i386.changes from the queue, one would have to do

           $ dcut --input dput_0.9.4_i386.changes

       This creates and uploads a commands file that looks like the following:

       -----BEGIN PGP SIGNED MESSAGE-----
       Hash: SHA1

       Uploader: Foo Bar <foo@bar.org>
       Commands:
        rm --searchdirs dput_0.9.4.dsc
        rm --searchdirs dput_0.9.4.tar.gz
        rm --searchdirs dput_0.9.4_all.deb

       -----BEGIN PGP SIGNATURE-----
       Version: GnuPG v1.4.9 (GNU/Linux)

       iEYEARECAAYKAkisYx0ACgkQ4eu+pS04mIfwLQCg85XVpae/LHLrbvzywcQNt9PS
       ztsAoMgw6HjcI9flfmwjgMiapcu379Pu
       =fjp0
       -----END PGP SIGNATURE-----

       If you've uploaded packages with the --delayed option (uploaded to DEFERRED queue), then use the cancel command with a .changes file.

           $ dcut cancel dput_0.9.4_i386.changes

       This creates and uploads a commands file just like the other commands.

LICENSE
       This program is distributed under the terms of the Gnu General Public License, Version 2 or later.

BUGS
       Please direct bug reports and comments to the author.  Your feedback is appreciated.  If you're using Debian packages,  file  bugs  against
       the dput package.

FILES
       dcut makes use of the dput configuration files:

       /etc/dput.cf
              System dput configuration file.

       ~/.dput.cf
              User dput configuration file.

              Much helpful input and some stolen code from dput author Christian Kurz.

SEE ALSO
       dput(1), dput.cf(5)
       ftp://ftp.upload.debian.org/pub/UploadQueue/README

AUTHOR
       Thomas Viehmann <tv@beamnet.de>

                                                                   January 2004                                                            dcut(1)
