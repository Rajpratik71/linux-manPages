MOSQUITTO_SUB(1)                                                     Commands                                                     MOSQUITTO_SUB(1)

NAME
       mosquitto_sub - an MQTT version 5/3.1.1/3.1 client for subscribing to topics

SYNOPSIS
       mosquitto_sub {[-h hostname] [-p port-number] [-u username] [-P password] -t message-topic...  | -L URL [-t message-topic...] }
                     [-A bind-address] [-c] [-C msg-count] [-d] [-D command identifier value] [-E] [-i client-id] [-I client-id-prefix]
                     [-k keepalive-time] [-N] [-q message-QoS] [--remove-retained] [-R | --retained-only] [--retain-as-published] [-S]
                     [-T filter-out...] [-U unsub-topic...] [-v] [-V protocol-version] [-W message-processing-timeout] [--proxy socks-url]
                     [--quiet] [--will-topic topic [--will-payload payload] [--will-qos qos] [--will-retain]]
                     [[{--cafile file | --capath dir} [--cert file] [--key file] [--tls-version version] [--tls-alpn protocol] [--tls-engine engine] [--keyform {pem | engine}] [--tls-engine-kpass-sha1 kpass-sha1] [--insecure]]
                     | [--psk hex-key --psk-identity identity [--tls-version version]]]

       mosquitto_sub [--help]

DESCRIPTION
       mosquitto_sub is a simple MQTT version 5/3.1.1 client that will subscribe to topics and print the messages that it receives.

       In addition to subscribing to topics, mosquitto_sub can filter out received messages so they are not printed (see the -T option) or
       unsubscribe from topics (see the -U option). Unsubscribing from topics is useful for clients connecting with clean session set to false.

ENCRYPTED CONNECTIONS
       mosquitto_sub supports TLS encrypted connections. It is strongly recommended that you use an encrypted connection for anything more than
       the most basic setup.

       To enable TLS connections when using x509 certificates, one of either --cafile or --capath must be provided as an option.

       To enable TLS connections when using TLS-PSK, you must use the --psk and the --psk-identity options.

OPTIONS
       The options below may be given on the command line, but may also be placed in a config file located at $XDG_CONFIG_HOME/mosquitto_sub or
       $HOME/.config/mosquitto_sub with one pair of -option value per line. The values in the config file will be used as defaults and can be
       overridden by using the command line. The exceptions to this are -t and -T, which if given in the config file will not be overridden. Note
       also that currently some options cannot be negated, e.g.  -S. Config file lines that have a # as the first character are treated as
       comments and not processed any further.

       -A
           Bind the outgoing connection to a local ip address/hostname. Use this argument if you need to restrict network communication to a
           particular interface.

       -c, --disable-clean-session
           Disable the 'clean session' flag. This means that all of the subscriptions for the client will be maintained after it disconnects,
           along with subsequent QoS 1 and QoS 2 messages that arrive. When the client reconnects, it will receive all of the queued messages.

           If using this option, the client id must be set manually with --id

       --cafile
           Define the path to a file containing PEM encoded CA certificates that are trusted. Used to enable SSL communication.

           See also --capath

       --capath
           Define the path to a directory containing PEM encoded CA certificates that are trusted. Used to enable SSL communication.

           For --capath to work correctly, the certificate files must have ".crt" as the file ending and you must run "openssl rehash <path to
           capath>" each time you add/remove a certificate.

           See also --cafile

       --cert
           Define the path to a file containing a PEM encoded certificate for this client, if required by the server.

           See also --key.

       --ciphers
           An openssl compatible list of TLS ciphers to support in the client. See ciphers(1) for more information.

       -C
           Disconnect and exit the program immediately after the given count of messages have been received. This may be useful in shell scripts
           where on a single status value is required, for example.

           Combine with -R to print only the first set of fresh messages (i.e. that does not have the retained flag set), or with -T to filter
           which topics are processed.

       -d, --debug
           Enable debug messages.

       -D, --property
           Use an MQTT v5 property with this publish. If you use this option, the client will be set to be an MQTT v5 client. This option has two
           forms:

           -D command identifier value

           -D command identifier name value

           command is the MQTT command/packet identifier and can be one of CONNECT, PUBACK, PUBREC, PUBCOMP, SUBSCRIBE, UNSUBSCRIBE, DISCONNECT,
           AUTH, or WILL. The properties available for each command are listed in the Properties section.

           identifier is the name of the property to add. This is as described in the specification, but with '-' as a word separator. For
           example: payload-format-indicator. More details are in the Properties section.

           value is the value of the property to add, with a data type that is property specific.

           name is only used for the user-property property as the first of the two strings in the string pair. In that case, value is the second
           of the strings in the pair.

       -E
           If this option is given, mosquitto_sub will exit immediately that all of its subscriptions have been acknowledged by the broker. In
           conjunction with -c this allows a durable client session to be initialised on the broker for future use without requiring any messages
           to be received.

       -F
           Specify output printing format. This option allows you to choose what information from each message is printed to the screen. See the
           Output Format section below for full details.

           This option overrides the -v option, but does not override the -N option.

       --help
           Display usage information.

       -h, --host
           Specify the host to connect to. Defaults to localhost.

       -i, --id
           The id to use for this client. If not given, a client id will be generated depending on the MQTT version being used. For v3.1.1/v3.1,
           the client generates a client id in the format mosq-XXXXXXXXXXXXXXXXXX, where the X are replaced with random alphanumeric characters.
           For v5.0, the client sends a zero length client id, and the server will generate a client id for the client.

           This option cannot be used at the same time as the --id-prefix argument.

       -I, --id-prefix
           Provide a prefix that the client id will be built from by appending the process id of the client. This is useful where the broker is
           using the clientid_prefixes option. Cannot be used at the same time as the --id argument.

       --insecure
           When using certificate based encryption, this option disables verification of the server hostname in the server certificate. This can
           be useful when testing initial server configurations but makes it possible for a malicious third party to impersonate your server
           through DNS spoofing, for example. Use this option in testing only. If you need to resort to using this option in a production
           environment, your setup is at fault and there is no point using encryption.

       -k, --keepalive
           The number of seconds between sending PING commands to the broker for the purposes of informing it we are still connected and
           functioning. Defaults to 60 seconds.

       --key
           Define the path to a file containing a PEM encoded private key for this client, if required by the server.

           See also --cert.

       --keyform
           Specifies the type of private key in use when making TLS connections.. This can be "pem" or "engine". This parameter is useful when a
           TPM module is being used and the private key has been created with it. Defaults to "pem", which means normal private key files are
           used.

           See also --tls-engine.

       -L, --url
           Specify specify user, password, hostname, port and topic at once as a URL. The URL must be in the form:
           mqtt(s)://[username[:password]@]host[:port]/topic

           If the scheme is mqtt:// then the port defaults to 1883. If the scheme is mqtts:// then the port defaults to 8883.

       -N
           Do not append an end of line character to the payload when printing. This allows streaming of payload data from multiple messages
           directly to another application unmodified. Only really makes sense when not using -v.

       -p, --port
           Connect to the port specified. If not given, the default of 1883 for plain MQTT or 8883 for MQTT over TLS will be used.

       -P, --pw
           Provide a password to be used for authenticating with the broker. Using this argument without also specifying a username is invalid
           when using MQTT v3.1 or v3.1.1. See also the --username option.

       --proxy
           Specify a SOCKS5 proxy to connect through. "None" and "username" authentication types are supported. The socks-url must be of the form
           socks5h://[username[:password]@]host[:port]. The protocol prefix socks5h means that hostnames are resolved by the proxy. The symbols
           %25, %3A and %40 are URL decoded into %, : and @ respectively, if present in the username or password.

           If username is not given, then no authentication is attempted. If the port is not given, then the default of 1080 is used.

           More SOCKS versions may be available in the future, depending on demand, and will use different protocol prefixes as described in
           curl(1).

       --psk
           Provide the hexadecimal (no leading 0x) pre-shared-key matching the one used on the broker to use TLS-PSK encryption support.
           --psk-identity must also be provided to enable TLS-PSK.

       --psk-identity
           The client identity to use with TLS-PSK support. This may be used instead of a username if the broker is configured to do so.

       -q, --qos
           Specify the quality of service desired for the incoming messages, from 0, 1 and 2. Defaults to 0. See mqtt(7) for more information on
           QoS.

           The QoS is identical for all topics subscribed to in a single instance of mosquitto_sub.

       --quiet
           If this argument is given, no runtime errors will be printed. This excludes any error messages given in case of invalid user input
           (e.g. using --port without a port).

       -R
           If this argument is given, messages that are received that have the retain bit set will not be printed. Messages with retain set are
           "stale", in that it is not known when they were originally published. When subscribing to a wildcard topic there may be a large number
           of retained messages. This argument suppresses their display.

       --remove-retained
           If this argument is given, the when mosquitto_sub receives a message with the retained bit set, it will send a message to the broker to
           clear that retained message. This applies to all received messages except those that are filtered out by the -T option. This option
           still takes effect even if -R is used. See also the --retain-as-published and --retained-only options.

           Example 1.  Remove all retained messages on the server, assuming we have access to do so, and then exit:

               mosquitto_sub -t '#' --remove-retained --retained-only

           Example 2.  Remove a whole tree, with the exception of a single topic:

               mosquitto_sub -t 'bbc/#' -T bbc/bbc1 --remove-retained

       --retained-only
           If this argument is given, only messages that are received that have the retain bit set will be printed. Messages with retain set are
           "stale", in that it is not known when they were originally published. With this argument in use, the receipt of the first non-stale
           message will cause the client to exit. See also the --retain-as-published option.

       --retain-as-published
           If this argument is given, the subscriptions will have the "retain as published" option set. This means that the retain flag on an
           incoming message will be exactly as set by the publishing client, rather than indicating whether the message is fresh/stale.

           This option is not valid for MQTT v3.1/v3.1.1 clients.

       -S
           Use SRV lookups to determine which host to connect to. Performs lookups to _mqtt._tcp.<host> when used in conjunction with -h,
           otherwise uses _mqtt._tcp.<local dns domain>.

       -t, --topic
           The MQTT topic to subscribe to. See mqtt(7) for more information on MQTT topics.

           This option may be repeated to subscribe to multiple topics.

       -T, --filter-out
           Suppress printing of topics that match the filter. This allows subscribing to a wildcard topic and only printing a partial set of the
           wildcard hierarchy.

           For example, subscribe to the BBC tree, but suppress output from Radio 3:

           •   mosquitto_sub -t bbc/# -T bbc/radio3

           This option may be repeated to filter out multiple topics or topic trees.

       --tls-alpn
           Provide a protocol to use when connecting to a broker that has multiple protocols available on a single port, e.g. MQTT and WebSockets.

       --tls-engine
           A valid openssl engine id. These can be listed with openssl engine command.

           See also --keyform.

       --tls-engine-kpass-sha1
           SHA1 of the private key password when using an TLS engine. Some TLS engines such as the TPM engine may require the use of a password in
           order to be accessed. This option allows a hex encoded SHA1 hash of the password to the engine directly, instead of the user being
           prompted for the password.

           See also --tls-engine.

       --tls-version
           Choose which TLS protocol version to use when communicating with the broker. Valid options are tlsv1.3, tlsv1.2 and tlsv1.1. The
           default value is tlsv1.2. Must match the protocol version used by the broker.

       -u, --username
           Provide a username to be used for authenticating with the broker. See also the --pw argument.

       -U, --unsubscribe
           A topic that will be unsubscribed from. This may be used on its own or in conjunction with the --topic option and only makes sense when
           used in conjunction with --clean-session.

           If used with --topic then subscriptions will be processed before unsubscriptions.

           Note that it is only possible to unsubscribe from subscriptions that have previously been made. It is not possible to punch holes in
           wildcard subscriptions. For example, subscribing to sensors/# and then unsubscribing from sensors/+/temperature as shown below will
           still result in messages matching the sensors/+/temperature being delivered to the client.

           •   mosquitto_sub -t sensors/# -U sensors/+/temperature -v

           Note also that because retained messages are published by the broker on receipt of a SUBSCRIBE command, subscribing and unsubscribing
           to the same topic may result in messages being received at the client.

           This option may be repeated to unsubscribe from multiple topics.

       -v, --verbose
           Print received messages verbosely. With this argument, messages will be printed as "topic payload". When this argument is not given,
           the messages are printed as "payload".

       -V, --protocol-version
           Specify which version of the MQTT protocol should be used when connecting to the remote broker. Can be 5, 311, 31, or the more verbose
           mqttv5, mqttv311, or mqttv31. Defaults to 311.

       -W
           Provide a timeout as an integer number of seconds. mosquitto_sub will stop processing messages and disconnect after this number of
           seconds has passed. The timeout starts just after the client has connected to the broker.

       --will-payload
           Specify a message that will be stored by the broker and sent out if this client disconnects unexpectedly. This must be used in
           conjunction with --will-topic.

       --will-qos
           The QoS to use for the Will. Defaults to 0. This must be used in conjunction with --will-topic.

       --will-retain
           If given, if the client disconnects unexpectedly the message sent out will be treated as a retained message. This must be used in
           conjunction with --will-topic.

       --will-topic
           The topic on which to send a Will, in the event that the client disconnects unexpectedly.

OUTPUT FORMAT
       There are three ways of formatting the output from mosquitto_sub. In all cases a new-line character is appended for each message received
       unless the -N argument is passed to mosquitto_sub.

       Payload-only is the default output format and will print the payload exactly as it is received.

       Verbose mode is activated with -v and prints the message topic and the payload, separated by a space.

       The final option is formatted output, which allows the user to define a custom output format. The behaviour is controlled with the -F
       format-string option. The format string is a free text string where interpreted sequences are replaced by different parameters. The
       available interpreted sequences are described below.

       Three characters are used to start an interpreted sequence: %, @ and \. Sequences starting with % are either parameters related to the MQTT
       message being printed, or are helper sequences to avoid the need to type long date format strings for example. Sequences starting with @
       are passed to the strftime(3) function (with the @ replaced with a % - note that only the character immediately after the @ is passed to
       strftime). This allows the construction of a wide variety of time based outputs. The output options for strftime vary from platform to
       platform, so please check what is available for your platform. mosquitto_sub does provide one extension to strftime which is @N, which can
       be used to obtain the number of nanoseconds passed in the current second. The resolution of this option varies depending on the platform.
       The final sequence character is \, which is used to input some characters that would otherwise be difficult to enter.

   MQTT related parameters
       •   %% a literal %.

       •   %l the length of the payload in bytes.

       •   %m the message id (only relevant for messages with QoS>0).

       •   %p the payload raw bytes (may produce non-printable characters depending on the payload).

       •   %q the message QoS.

       •   %r the retained flag for the message.

       •   %t the message topic.

       •   %x the payload with each byte as a hexadecimal number (lower case).

       •   %X the payload with each byte as a hexadecimal number (upper case).

   Helpers
       •   %I ISO-8601 format date and time, e.g. 2016-08-10T09:47:38+0100

       •   %j JSON output of message parameters and timestamp, with a quoted and escaped payload. For example
           {"tst":1470825369,"topic":"greeting","qos":0,"retain":0,"payload":"hello world"}

       •   %J JSON output of message parameters and timestamp, with a non-quoted and non-escaped payload - this means the payload must itself be
           valid JSON. For example: {"tst":1470825369,"topic":"foo","qos":0,"retain":0,"payload":{"temperature":27.0,"humidity":57}}.

       •   %I ISO-8601 format date and time, e.g. 2016-08-10T09:47:38+0100

       •   %U Unix timestamp with nanoseconds, e.g. 1470818943.786368637

   Time related parameters
       •   @@ a literal @.

       •   @X pass the character represented by X to the strftime function as %X. The options supported are platform dependent.

       •   @N the number of nanoseconds that have passed in the current second, with varying timing resolution depending on platform.

   Escape characters
       •   \\ a literal \.

       •   \0 a null character. Can be used to separate different parameters that may contain spaces (e.g. topic, payload) so that processing with
           tools such as xargs(1) is easier.

       •   \a alert/bell.

       •   \e the escape sequence, which can be used with ANSI colour codes to provide coloured output for example.

       •   \n end of line.

       •   \r carriage return.

       •   \t horizontal tab.

       •   \v vertical tab.

WILLS
       mosquitto_sub can register a message with the broker that will be sent out if it disconnects unexpectedly. See mqtt(7) for more
       information.

       The minimum requirement for this is to use --will-topic to specify which topic the will should be sent out on. This will result in a
       non-retained, zero length message with QoS 0.

       Use the --will-retain, --will-payload and --will-qos arguments to modify the other will parameters.

PROPERTIES
       The -D / --property option allows adding properties to different stages of the mosquitto_sub run. The properties supported for each command
       are as follows:

   Connect
       •   authentication-data (binary data - note treated as a string in mosquitto_sub)

       •   authentication-method (UTF-8 string pair)

       •   maximum-packet-size (32-bit unsigned integer)

       •   receive-maximum (16-bit unsigned integer)

       •   request-problem-information (8-bit unsigned integer)

       •   request-response-information (8-bit unsigned integer)

       •   session-expiry-interval (32-bit unsigned integer)

       •   topic-alias-maximum (16-bit unsigned integer)

       •   user-property (UTF-8 string pair)

   Subscribe
       •   user-property (UTF-8 string pair)

   Unsubscribe
       •   user-property (UTF-8 string pair)

   Disconnect
       •   session-expiry-interval (32-bit unsigned integer)

       •   user-property (UTF-8 string pair)

   Will properties
       •   content-type (UTF-8 string)

       •   correlation-data (binary data - note treated as a string in mosquitto_sub)

       •   message-expiry-interval (32-bit unsigned integer)

       •   payload-format-indicator (8-bit unsigned integer)

       •   response-topic (UTF-8 string)

       •   user-property (UTF-8 string pair)

       •   will-delay-interval (32-bit unsigned integer)

EXAMPLES
       Note that these really are examples - the subscriptions will work if you run them as shown, but there must be something publishing messages
       on those topics for you to receive anything.

       Subscribe to temperature information on localhost with QoS 1:

       •   mosquitto_sub -t sensors/temperature -q 1

       Subscribe to hard drive temperature updates on multiple machines/hard drives. This expects each machine to be publishing its hard drive
       temperature to sensors/machines/HOSTNAME/temperature/HD_NAME.

       •   mosquitto_sub -t sensors/machines/+/temperature/+

       Subscribe to all broker status messages:

       •   mosquitto_sub -v -t \$SYS/#

       Specify the output format as "ISO-8601 date : topic : payload in hex"

       •   mosquitto_sub -F '@Y-@m-@dT@H:@M:@S@z : %t : %x' -t '#'

       Specify the output format as "seconds since epoch.nanoseconds : retained flag : qos : mid : payload length"

       •   mosquitto_sub -F '%@s.@N : %r : %q : %m : %l' -q 2 -t '#'

       Topic and payload output, but with colour where supported.

       •   mosquitto_sub -F '\e[92m%t \e[96m%p\e[0m' -q 2 -t '#'

FILES
       $XDG_CONFIG_HOME/mosquitto_sub, $HOME/.config/mosquitto_sub
           Configuration file for default options.

BUGS
       mosquitto bug information can be found at https://github.com/eclipse/mosquitto/issues

SEE ALSO
       mqtt(7), mosquitto_pub(1), mosquitto_rr(1), mosquitto(8), libmosquitto(3), mosquitto-tls(7)

AUTHOR
       Roger Light <roger@atchoo.org>

Mosquitto Project                                                   02/27/2020                                                    MOSQUITTO_SUB(1)
