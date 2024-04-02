DEBSECAN(8)                                                                                                                            DEBSECAN(8)

NAME
       debsecan-create-cron - Create cron entry for the Debian Security Analyzer

SYNOPSIS
       debsecan-create-cron
       debsecan-create-cron --upgrade

DESCRIPTION
       debsecan-create-cron creates a cron entry for debsecan, the Debian security analyzer.

       The cron entry runs hourly, but debsecan itself restricts actually processing to once a day.  The minute the cron job runs is selected ran‐
       domly, to reduce peak server load.

       debsecan-create-cron --upgrade is used internally to upgrade an older cron entry.

AUTHOR
       debsecan was written by Florian Weimer.

SEE ALSO
       debsecan(1), cron(8)

                                                                    2005-12-19                                                         DEBSECAN(8)
