UPDATE-SMART-DRIVEDB(8)                                                                     SMART Monitoring Tools                                                                    UPDATE-SMART-DRIVEDB(8)



NAME
       update-smart-drivedb - update smartmontools drive database

SYNOPSIS
       update-smart-drivedb [OPTIONS] [DESTFILE]

DESCRIPTION
       [This man page is generated for the Linux version of smartmontools.  It does not contain info specific to other platforms.]

       update-smart-drivedb updates /usr/share/smartmontools/drivedb.h or DESTFILE from branches/RELEASE_7_0_DRIVEDB of smartmontools SVN repository.

       The tools used for downloading are either curl(1), wget(1), lynx(1), or svn(1).

       [NEW EXPERIMENTAL UPDATE-SMART-DRIVEDB FEATURE] The downloaded file is verified with OpenPGP/GPG key ID 721042C5.  The public key block is included in the script.

       The old file is kept if the downloaded file is identical (ignoring the differences in Id string) otherwise it is moved to drivedb.h.old.

OPTIONS
       -s SMARTCTL
              Use the smartctl(8) executable at path SMARTCTL for drive database syntax check.  The form '-s -' disables the syntax check.  The default is /usr/sbin/smartctl.

       -t TOOL
              Use TOOL for download.  TOOL is one of: curl wget lynx svn.  The default is the first one found in PATH.

       -u LOCATION
              Use URL of LOCATION for download.  LOCATION is one of:
              github (GitHub mirror of SVN repository),
              sf (Sourceforge code browser),
              svn (SVN repository),
              svni (SVN repository via HTTP instead of HTTPS),
              trac (Trac code browser).
              The default is svn.

       --trunk
              Download from SVN trunk.  This requires '--no-verify' unless the trunk version is still identical to branches/RELEASE_7_0_DRIVEDB.

       --cacert FILE
              Use CA certificates from FILE to verify the peer.

       --capath DIR
              Use CA certificate files from DIR to verify the peer.

       --insecure
              Don't abort download if certificate verification fails.  This option is also required if a HTTP URL is selected with '-u' option.

       --no-verify
              Don't verify signature with GnuPG.

       --export-key
              Print the OpenPGP/GPG public key block.

       --dryrun
              Print download commands only.

       -v     Verbose output.

EXAMPLES
       # update-smart-drivedb
       /usr/share/smartmontools/drivedb.h updated from \
       branches/RELEASE_7_0_DRIVEDB

EXIT STATUS
       The exit status is 0 if the database has been successfully updated.  If an error occurs the exit status is 1.

FILES
       /usr/sbin/update-smart-drivedb
              full path of this script.

       /usr/sbin/smartctl
              used to check syntax of new drive database.

       /usr/share/smartmontools/drivedb.h
              current drive database.

       /usr/share/smartmontools/drivedb.h.raw
              current drive database with unexpanded SVN Id string.

       /usr/share/smartmontools/drivedb.h.raw.asc
              signature file.

       /usr/share/smartmontools/drivedb.h.*old*
              previous files.

       /usr/share/smartmontools/drivedb.h.*error*
              new files if rejected due to errors.

       /usr/share/smartmontools/drivedb.h.lastcheck
              empty file created if downloaded file was identical.

AUTHORS
       Christian Franke.
       This manual page was originally written by Hannes von Haugwitz <hannes@vonhaugwitz.com>.

REPORTING BUGS
       To submit a bug report, create a ticket in smartmontools wiki:
       <https://www.smartmontools.org/>.
       Alternatively send the info to the smartmontools support mailing list:
       <https://listi.jpberlin.de/mailman/listinfo/smartmontools-support>.

SEE ALSO
       smartctl(8), smartd(8).

PACKAGE VERSION
       smartmontools-7.0 2018-12-30 r4883
       $Id: update-smart-drivedb.8.in 4879 2018-12-28 22:05:12Z chrfranke $



smartmontools-7.0                                                                                 2018-12-30                                                                          UPDATE-SMART-DRIVEDB(8)
