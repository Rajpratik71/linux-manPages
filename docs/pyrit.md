PYRIT(1)                                                               PYRIT                                                              PYRIT(1)

NAME
       pyrit - A GPGPU-driven WPA/WPA2-PSK key cracker

SYNOPSIS
       pyrit [options] command

DESCRIPTION
       Pyrit  exploits  the  computational  power  of  many-core-  and  GPGPU-platforms  to  create  massive  databases, pre-computing part of the
       WPA/WPA2-PSK authentication phase in a space-time tradeoff. It is a powerful attack against one of the world's  most  used  security-proto‐
       cols.

       This  document  tries to describe and explain all functions the commandline-client pyrit provides.  One or more options may be given on the
       commandline to customize a command. The exact behaviour of options depends on the command.

       At the time of this writing, cowpatty is not available in Debian.  References to cowpatty and its commands are nevertheless  preserved  for
       the sake of completeness.

OPTIONS
       Pyrit recognizes the following options:

       -b BSSID
              Specifies a BSSID. Can be used to restrict commands to certain Access-Points.

       -e ESSID
              Specifies the ESSID. Commands usually refer to all ESSIDs in the database when this option is omitted.

       -i infile
              Specifies a filename to read from; the special filename "-" can be used for stdin. The file may be gzip-compressed in which case its
              name must end in .gz for transparent decompression.

       -o outfile
              Specifies a filename to write to; the special filename "-" can be used for stdout. Filenames that end in .gz cause  pyrit  to  gzip-
              compress the file on the fly.

       -r capture-file
              Specifies a packet-capture file in pcap format (possibly gzip-compressed) or a device (e.g.: "wlan0") to capture from.

       -u URL Specifies the URL of the storage-device in the form of

                   driver://username:password@host:port/database

              Pyrit can use the filesystem, a remote Pyrit-Relay-Server and, if the package python-sqlalchemy is installed, SQL-Databases as stor‐
              age. The driver file:// refers to Pyrit's own filesystem-based storage, http:// connects to a Pyrit-Relay-Server and all other  URLs
              are  passed  directly to python-sqlalchemy, if available. The default storage-URL can also be specified by the key defaultstorage in
              pyrit's configuration file (see FILES below).

       --all-handshakes
              The commands attack_batch, attack_db, attack_cowpatty and attack_passthrough automatically use the single handshake of highest qual‐
              ity  only.  In  some  cases  even this handshake may have been wrongfully reconstructed from the captured data, rendering the attack
              futile. In case more than one EAPOL-handshake is reconstructed from the capture-file, the option --all-handshakes  may  be  used  to
              attack  all  handshakes reconstructable from the captured data. Exact behaviour of the commands affected by this option is described
              below.

COMMANDS
       analyze
              Parse one or more packet-capture files (in pcap-format, possibly gzip-compressed) given by the option -r and try to  detect  Access-
              Points, Stations and EAPOL-handshakes.  For example:

                   pyrit -r "test*.pcap" analyze

              Pyrit shows a list of Access-Points, associated Stations and EAPOL-handshakes that could be identified from the captured data. Hand‐
              shakes are shown ordered by their "quality":

                          Good: The handshake includes the challenge from the Access-Point, the response from the  Station  and  the  confirmation
                          from the Access-Point.

                          Workable: The handshake includes the response from the Station and the confirmation from the Access-Point. The challenge
                          was not captured.

                          Bad: The handshake includes the challenge from the Access-Point and the response from the Station. The confirmation  was
                          not captured.

                          Handshakes of the same quality are ordered by how close the packets that make up the handshake are to each other.

              attack_batch
                     Attack an EAPOL-handshake found in the packet-capture file(s) given by the option -r using the Pairwise Master Keys and pass‐
                     words stored in the database. The options -b and -e can be used to specify the Access-Point to attack; it is picked automati‐
                     cally if both options are omitted.  The password is written to the filename given by the option -o if specified. For example:

                          pyrit -r test.pcap -e MyNetwork -b 00:de:ad:c0:de:00 \
                              -o MyNetworkPassword.txt attack_batch

                     Pairwise  Master Keys that previously have been computed and stored in the database are taken from there; all other passwords
                     are translated into their respective Pairwise Master Keys and added to the database for later  re-use.   ESSIDs  are  created
                     automatically in the database if necessary.

                     Pyrit works down the list of reconstructed EAPOL-handshakes in case the option --all-handshakes is supplied.

              attack_cowpatty
                     Attack  an  EAPOL-handshake found in the packet-capture file(s) given by the option -r using Pairwise Master Keys from a cow‐
                     patty-like file (e.g.  generated by ``genpmk'' from cowpatty, or export_cowpatty below) given by the option -f.  The  options
                     -b  and  -e  can  be  used to specify the Access-Point to attack; it is picked automatically if both options are omitted. The
                     password is written to the filename given by the option -o if specified.  The cowpatty-file may be gzip-compressed  and  must
                     match the chosen ESSID.  For example:

                          pyrit -r test.pcap -e MyOwnNetwork \
                              -i MyOwnNetwork.cow.gz -o - attack_cowpatty

                     Pyrit's own database is not touched by attack_cowpatty.

                     Pyrit  attacks  all EAPOL-handshakes at the same time if the option --all-handshakes is supplied. This will reduce throughput
                     (e.g.: 33% throughout in case of three handshakes).

              attack_db
                     Attack an EAPOL-handshake found in the packet-capture file(s) given by the option -r using the Pairwise Master Keys stored in
                     the  database.  The  options  -b and -e can be used to specify the Access-Point to attack; it is picked automatically if both
                     options are omitted.  The password is written to the filename given by the option -o if specified. For example:

                          pyrit -r test.pcap -e MyOtherNetwork attack_db

                     Only Pairwise Master Keys that have been computed previously and are stored in the database are used by attack_db.

                     Pyrit works down the list of reconstructed EAPOL-handshakes in case the option --all-handshakes is supplied.

              attack_passthrough
                     Attack an EAPOL-handshake found in the packet-capture file(s) given by the option -r using the passwords read from  the  file
                     given  by the option -i.  The options -b and -e can be used to specify the Access-Point to attack; it is picked automatically
                     if both options are omitted. The password is written to the filename given by the option -o if specified. For example:

                          pyrit -r test.pcap -b 00:de:ad:be:ef:00 \
                              -i words.txt attack_passthrough

                     This command circumvents Pyrit's database and should only be used if storage-space is a problem (e.g. on LiveCDs). You should
                     consider using attack_batch otherwise.

                     Pyrit attacks all EAPOL-handshakes at the same time if the option --all-handshakes is supplied.

              batch
                     Start  to  translate  all  passwords  in the database into their respective Pairwise Master Keys and store the results in the
                     database. The option -e may be used to restrict this command to a single ESSID; if it is omitted, all  ESSIDs  are  processed
                     one after the other in undefined order. For example:

                          pyrit -e NETGEAR batch

                     The  option  -o  can be used to specify a filename the results should additionally be written to in cowpatty's binary format.
                     The option -e becomes mandatory and the ESSID is automatically created in the database if  necessary.  Pairwise  Master  Keys
                     that  previously  have  been  computed  and stored in the database are exported from there without further processing.  Pyrit
                     stops and exits if an IOError is raised while writing to the specified file. This makes it very convenient  to  pipe  results
                     directly to other programs but also keep them for later use. For example:

                          pyrit -e NETGEAR -o - batch | \
                              cowpatty -d - -r wpatestcapture.cap -s NETGEAR

              benchmark
                     Determine the peak-performance of the available hardware by computing dummy-results. For example:

                          pyrit benchmark

              check_db
                     Unpack  the  entire  database and check for errors like data corruption or reference errors. This function does not check the
                     value of computed results (see verify). For example:

                          pyrit check_db

              create_essid
                     Add new ESSIDs to the database. A single ESSID may be given by the option -e.  Multiple ESSIDs can be created by supplying  a
                     file (one per line) via the option -i. Re-creating an existing ESSID does not result in an error. For example:

                          pyrit -e NETGEAR create_essid

              delete_essid
                     Delete  the  ESSID  given  by  -e  from the database. This includes all results that may have been stored for that particular
                     ESSID. For example:

                          pyrit -e NETGEAR delete_essid

              eval
                     Count all available passwords, all ESSIDs and their respective results in the database. For example:

                          pyrit eval

              export_passwords
                     Write all passwords that are currently stored in the database to a new file given by -o. Passwords are terminated by a single
                     newline-character ("\n"). Existing files are overwritten without confirmation. For example:

                          pyrit -o myword.txt.gz export_passwords

              export_cowpatty
                     Write all results for the ESSID given by -e to the file given by -o in cowpatty's binary format. Existing files are overwrit‐
                     ten without confirmation. For example:

                          pyrit -o NETGEAR.cow -e NETGEAR export_cowpatty

              export_hashdb
                     Write all results currently stored in the database to the airolib-ng-database given by -o. The database  is  created  with  a
                     default  table  layout  if  the file does not yet exist. The option -e can be used to limit the export to a single ESSID. For
                     example:

                          pyrit -o NETGEAR.db -e NETGEAR export_hashdb

              import_passwords
                     Read the file given by -i and import one password per line to the database. The passwords may contain all characters (includ‐
                     ing  NULL-bytes)  apart  from  the terminating newline-character ("\n").  Passwords that are not suitable for being used with
                     WPA-/WPA2-PSK are ignored.  Pyrit's storage-implementation guarantees that all passwords remain unique throughout the  entire
                     database. For example:

                          pyrit -i dirty_words.txt import_passwords

              import_unique_passwords
                     Read the file given by -i and import one password per line to the database. The passwords may contain all characters (includ‐
                     ing NULL-bytes) apart from the terminating newline-character ("\n"). Passwords that are not  suitable  for  being  used  with
                     WPA-/WPA2-PSK  are  ignored. This command does not check if there are duplicate passwords within the file or between the file
                     and the database; it should be used with caution to prevent the database from getting  poisoned  with  duplicated  passwords.
                     This command however can be much faster than import_passwords. For example:

                          pyrit -i dirty_words.txt import_unique_passwords

              list_cores
                     Show a list of all available hardware modules Pyrit currently uses. For example:

                          pyrit list_cores

              list_essids
                     Show  a list of all ESSIDs currently stored in the database. This function is faster than eval in case you don't need to know
                     the number of computed results. For example:

                          pyrit list_essids

              passthrough
                     Read passwords from the file given by -i and compute their Pairwise Master Keys for the ESSID given by -e.  The  results  are
                     written  to  the file specified by -o in cowpatty's binary format and are not stored in the database for later use. This com‐
                     mand therefor circumvents the entire database and should only be used if storage-space is a problem (e.g. when using Pyrit on
                     a  LiveCD).  The batch-command provides exactly the same functionality as passthrough but can give much better performance as
                     results may be read from the database instead of recomputing them. For example:

                          pyrit -i dirty_words.txt.gz -e NETGEAR \
                              -o - passthrough | cowpatty -d - \
                              -r wpatestcapture.cap -s NETGEAR

              relay
                     Start a server to relay another storage device via XML-RPC; other Pyrit-clients can use the server  as  storage-device.  This
                     allows  one  to  have network-based access to storage source that don't provide network-access on their own (like file:// and
                     sqlite://) or hide a SQL-database behind a firewall and let multiple clients access that database only via Pyrit's RPC-inter‐
                     face.  The TCP-port 17934 must be open for this function to work. For example, on the server (where the database is):

                          pyrit -u sqlite://var/local/pyrit.db relay

                     and the client (where the big GPU is):

                          pyrit -u http://192.168.0.100:17934 batch

              selftest
                     Run  an  extensive  selftest  for about 60 seconds. This test includes the entire scheduling-mechanism and all cores that are
                     listed by list_cores. You can use this function to detect broken hardware-modules or malicious network-clients. For example:

                          pyrit selftest

              serve
                     Start a server that provides access to the local computing hardware to help other  Pyrit  clients.  The  server's  IP-address
                     should  be  added  to the client's configuration file (see FILES) as a space-separated list under known_clients. The client's
                     rpc_server-setting must also be set to 'true'. The TCP- and UDP-Port 17935 must be accessible. For  example,  on  the  server
                     (where the GPU is):

                          pyrit serve

                     and on the client (the server's IP-address has been added to known_clients and rpc_server is set to 'true'):

                          pyrit -r test.pcap -b 00:de:ad:be:ef:00 \
                              -i words.txt attack_passthrough

              strip
                     Parse  one  or  more packet-capture files given by the option -r, extract only packets that are necessary for EAPOL-handshake
                     detection and write a new dump to the filename given by the option -o. The options -e and -b can be used  to  filter  certain
                     Access-Points. For example:

                          pyrit -r "large_dumps_*.pcap" -e MyNetwork \
                              -o tiny_compressed_dump_MyNetwork.dump.gz strip

              stripLive
                     Parse a packet-capture file given by the option -r, extract only packets that are necessary for EAPOL-handshake detection and
                     write a new dump to the file given by the option -o. This command differs from strip as the capture-file can be any character
                     device including sockets and other pseudo-files that look like files in pcap-format. stripLive writes relevant packets to the
                     new file given by -o as they arrive instead of trying to read the entire capture-file first.

                          pyrit -r /temp/kismet_dump -o small_dump.pcap stripLive

              verify
                     Randomly pick 10% of the results stored in the database and verify their value by recomputation. You need  this  function  if
                     you suspect broken hardware or malicious network-clients. For example:

                          pyrit -e NETGEAR verify

EXIT STATUS
       If command succeeds, pyrit's process exit status is set to 0; otherwise it is set to 1 and (usually) an error message or a python-traceback
       is written to stderr. The following commands also indicate an error condition in certain cases:
                       analyze: Not at least one valid EAPOL-handshake could be detected.

                       attack_passthrough, attack_batch, attack_db and attack_cowpatty: The password could not be found.

                       verify At least one workunit contained invalid results.

                       check_db Errors in the database were found (and possibly fixed).

FILES
       ~/.pyrit/config
              The pyrit configuration file. You can find a documented example in /usr/share/doc/pyrit/examples/config.example.

NOTES
       The author does not encourage or support using pyrit for the infringement of people's communication-privacy. The exploration  and  realiza‐
       tion  of the technology discussed here motivate as a purpose of their own; this is documented by the open development, strictly sourcecode-
       based distribution and 'copyleft'-licensing.

AUTHOR
       pyrit was written by Lukas Lueg <lukas.lueg@gmail.com>.

       This manual page was written by Christian Kastner <ckk@debian.org> for the Debian project (but may be used by others).

pyrit                                                               2011-03-28                                                            PYRIT(1)
