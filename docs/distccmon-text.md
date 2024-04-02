distccmon-text(1)                      General Commands Manual                      distccmon-text(1)

NAME
       distccmon-text - Displays current compilation jobs in text form.

SYNTAX
       distccmon-text [DELAY]

DESCRIPTION
       Displays  current  compilation  jobs  in  text form.  distccmon-text must be run on the client
       machine, with the same setting for DISTCC_DIR (or home directory)  as  the  user  running  the
       distcc client.

OPTIONS
       DELAY  repeatedly updates after delay (fractional) seconds.

OUTPUT FORMAT
       The  output  of distccmon-text contains one line for each job currently being compiled.   Each
       line contains the following columns:

       PID    ID of the distcc client process.

       STATE  Identifies the phase of operation.  In order these may be "Startup",  "Blocked",  "Con‐
              nected", "Preprocess", "Conect", "Send", "Receive" and "Done".

       FILE   The input filename, if known.

       HOST[SLOT]
              The  compile  hostname.   May be followed in square brackets by the slot index for that
              host.

       When a delay is specified, each block of output is terminated by a blank line.

EXAMPLES
       To display currently active jobs (updated every second):

              distccmon-text 1

       To display the status once:

              distccmon-text

AUTHORS
       distcc  was  written  by Martin Pool  <mbp@sourcefrog.net>,  with  the  co-operation  of  many
       scholars  including Wayne Davison, Frerich Raabe, Dimitri Papadopoulos  and  others  noted  in
       the  NEWS  file. Please  report  bugs  to <distcc@lists.samba.org>.

SEE ALSO
       distccd(1),      ccache(1),       gcc(1),       make(1)       http://code.google.com/p/distcc/
       http://ccache.samba.org/

                                            2 October 2004                          distccmon-text(1)
