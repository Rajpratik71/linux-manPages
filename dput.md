dput(1)                                                                                  General Commands Manual                                                                                  dput(1)

NAME
       dput - package upload tool for Debian

SYNTAX
       dput [options] [host[:argument]] package.changes ...

DESCRIPTION
       This is a tool for uploading Debian packages into the archive. You may specify to which host it should upload the file by passing it an host argument. If omitted, dput uses the host specified by
       default_host (or, historically default_host_non-us) configuration option. You also can pass an argument to the host by appending the hostname with a colon followed by the argument. For  example,
       you can upload easily to different launchpad PPAs by passing the PPAs' id to the ppa host without having to modify dput.cf.

       You have to pass the program one or more name of package.changes files and then they will be sequentially uploaded.

       This program will then upload the package for you into the archive, using a selected upload method. Currently dput supports ftp, scp, rsync, http, sftp, https, and local. The method scripts have
       been split from the main script so it is easy to add new methods.  Look in /usr/share/dput/ for examples.

       Should something go wrong with your upload to destinations using the Debian upload queue daemon (e.g. ftp-master), you can remove files from the upload queue with dcut(1).

OPTIONS
       -c, --config - define a config file to use.

       -d, --debug - activate debugging mode, helpful if bugs occur.

       -D, --dinstall - do a dry run of dinstall after the upload.

       -f, --force - force an upload of an already uploaded package.

       -h, --help - print help information and exit.

       -H, --host-list - print the lists of hosts that dput knows about.

       -l, --lintian - run lintian before the upload.

       -U, --no-upload-log - do not write a .upload log file after uploading.

       -o, --check-only - check only the package and do not upload.

       -p, --print - print the configuration that dput is using.

       -P, --passive - use passive ftp instead of active. Note that passive ftp is the default unless specified otherwise in the configuration file.

       -s, --simulate - simulate an upload only.

       -u, --unchecked - don't check GnuPG signature on the changes file.

       -e, --delayed - Upload to a DELAYED queue, rather than the usual Incoming. This takes an argument from 0 to 15. Note that a delay of 0 is different from no delay at all.

       -v, --version - print version information and exit.

       -V, --check-version - check if the user has already installed and tested the package before putting it into the archive.

ENVIRONMENT
       This program doesn't depend on any environment variables. But if the variable USER is set, it will be used.

LICENSE
       This program is distributed under the terms of the GPL.

BUGS
       Please send bug reports to the author.

FILES
       /etc/dput.cf
              global dput configuration file

       ~/.dput.cf
              peruser dput configuration file

SEE ALSO
       dput.cf(5)
       dcut(1)
       /usr/share/doc/dput
       /usr/share/dput

AUTHOR
       dput was written Christian Kurz. The current maintainer is Thomas Viehmann <tv@beamnet.de>.

       Many other people have contributed to this code. See the Thanks file.

COMMENTS
       The author does appreciate comments and suggestions from you.

                                                                                             October 5, 2001                                                                                      dput(1)
