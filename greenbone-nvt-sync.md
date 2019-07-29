GREENBONE-NVT-SYNC(8)                                              User Manuals                                              GREENBONE-NVT-SYNC(8)

NAME
       greenbone-nvt-sync - updates the OpenVAS NVTs from Greenbone Security Feed or Community Feed

SYNOPSIS
       greenbone-nvt-sync

DESCRIPTION
       The OpenVAS Scanner performs several security checks. These are called Network Vulnerability Tests (NVTs) and are mostly implemented in the
       programming language NASL. Some NVTs are wrappers for external tools.  As new vulnerabilities are published every day, new NVTs  appear  in
       the  Greenbone  Security Feed. This feed is commercial and requires a respective subscription key.  In case no subscription key is present,
       the update synchronisation will use the Community Feed instead.

       The script greenbone-nvt-sync will fetch all new and updated security checks and install them at the proper location. Once this is done  it
       will  send  a  signal  to  the OpenVAS Scanner, openvassd(8) so that the new NVTs are loaded and considered for new security scans. If your
       installation does not allow automatic restart, you need to restart the scanner manually.  Subsequent to the scanner, the script also  tries
       to send a signal to the OpenVAS Manager openvasmd(8) so that the information about the NVTs are also updated into the Manager database.

SEE ALSO
       For more information see: openvassd(8), openvasmd(8)

AUTHOR
       This manual page was written by Jan-Oliver Wagner <jan-oliver.wagner@greenbone.net>.

       The greenbone-nvt-sync script was written by Greenbone Networks GmbH.

The OpenVAS Project                                                January 2011                                              GREENBONE-NVT-SYNC(8)
