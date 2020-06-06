DBUS-TEST-TOOL(1)                                                                               User Commands                                                                               DBUS-TEST-TOOL(1)



NAME
       dbus-test-tool - D-Bus traffic generator and test tool

SYNOPSIS
       dbus-test-tool black-hole [--session | --system] [--name=NAME] [--no-read]

       dbus-test-tool echo [--session | --system] [--name=NAME] [--sleep-ms=MS]

       dbus-test-tool spam [--session | --system] [--dest=NAME] [--count=N] [--flood] [--ignore-errors] [--messages-per-conn=N] [--no-reply] [--queue=N] [--seed=SEED] [--string | --bytes | --empty]
                      [--payload=S | --stdin | --message-stdin | --random-size]

DESCRIPTION
       dbus-test-tool is a multi-purpose tool for debugging and profiling D-Bus.

       dbus-test-tool black-hole connects to D-Bus, optionally requests a name, then does not reply to messages. It normally reads and discards messages from its D-Bus socket, but can be configured to
       sleep forever without reading.

       dbus-test-tool echo connects to D-Bus, optionally requests a name, then sends back an empty reply to every method call, after an optional delay.

       dbus-test-tool spam connects to D-Bus and makes repeated method calls, normally named com.example.Spam.

OPTIONS
   Common options
       --session
           Connect to the session bus. This is the default.

       --system
           Connect to the system bus.

   black-hole mode
       --name=NAME
           Before proceeding, request ownership of the well-known bus name NAME, for example com.example.NoReply. By default, no name is requested, and the tool can only be addressed by a unique bus name
           such as :1.23.

       --no-read
           Do not read from the D-Bus socket.

   echo mode
       --name=NAME
           Before proceeding, request ownership of the well-known bus name NAME, for example com.example.Echo. By default, no name is requested, and the tool can only be addressed by a unique bus name such
           as :1.23.

       --sleep-ms=MS
           Block for MS milliseconds before replying to a method call.

   spam mode
       --dest=NAME
           Send method calls to the well-known or unique bus name NAME. The default is the dbus-daemon, org.freedesktop.DBus.

       --count=N
           Send N method calls in total. The default is 1.

       --queue=N
           Send N method calls before waiting for any replies, then send one new call per reply received, keeping N method calls "in flight" at all times until the number of messages specified with the
           --count option have been sent. The default is 1, unless --flood is used.

       --flood
           Send all messages without waiting for a reply, equivalent to --queue with an arbitrarily large N.

       --no-reply
           Set the "no reply desired" flag on the messages. This implies --flood, since it disables the replies that would be used for a finite --queue length.

       --messages-per-conn=N
           If given, send N method calls on the same connection, then disconnect and reconnect. The default is to use the same connection for all method calls.

       --string
           The payload of each message is a UTF-8 string. This is the default. The actual string used is given by the --payload or --stdin option, defaulting to "hello, world!".

       --bytes
           The payload of each message is a byte-array. The actual bytes used are given by the --payload or --stdin option, defaulting to the ASCII encoding of "hello, world!".

       --empty
           The messages have no payload.

       --payload=S
           Use S as the --string or --bytes in the messages. The default is "hello, world!".

       --stdin
           Read from standard input until end-of-file is reached, and use that as the --string or --bytes in the messages.

       --message-stdin
           Read a complete binary D-Bus method call message from standard input, and use that for each method call.

       --random-size
           Read whitespace-separated ASCII decimal numbers from standard input, choose one at random for each message, and send a message whose payload is a string of that length.

       --seed=SEED
           Use SEED as the seed for the pseudorandom number generator, to have somewhat repeatable sequences of random messages.

BUGS
       Please send bug reports to the D-Bus bug tracker or mailing list. See http://www.freedesktop.org/software/dbus/.

SEE ALSO
       dbus-send(1)

COPYRIGHT
       Copyright © 2015 Collabora Ltd.

       This man page is distributed under the same terms as dbus-test-tool (GPL-2+). There is NO WARRANTY, to the extent permitted by law.




D-Bus 1.10.24                                                                                     03/14/2019                                                                                DBUS-TEST-TOOL(1)
