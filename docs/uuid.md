UUID(1)                             Universally Unique Identifier                             UUID(1)

NAME
       uuid - Universally Unique Identifier Command-Line Tool

VERSION
       OSSP uuid 1.6.2 (04-Jul-2008)

SYNOPSIS
       uuid [-v version] [-m] [-n count] [-1] [-F format] [-o filename] [namespace name]

       uuid -d [-r] [-o filename] uuid

DESCRIPTION
       OSSP uuid is a ISO-C:1999 application programming interface (API) and corresponding command
       line interface (CLI) for the generation of DCE 1.1, ISO/IEC 11578:1996 and IETF RFC-4122
       compliant Universally Unique Identifier (UUID). It supports DCE 1.1 variant UUIDs of version 1
       (time and node based), version 3 (name based, MD5), version 4 (random number based) and
       version 5 (name based, SHA-1). Additional API bindings are provided for the languages
       ISO-C++:1998, Perl:5 and PHP:4/5. Optional backward compatibility exists for the ISO-C DCE-1.1
       and Perl Data::UUID APIs.

       UUIDs are 128 bit numbers which are intended to have a high likelihood of uniqueness over
       space and time and are computationally difficult to guess. They are globally unique
       identifiers which can be locally generated without contacting a global registration authority.
       UUIDs are intended as unique identifiers for both mass tagging objects with an extremely short
       lifetime and to reliably identifying very persistent objects across a network.

       This is the command line interface (CLI) of OSSP uuid. For a detailed description of UUIDs see
       the documentation of the application programming interface (API) in uuid(3).

OPTIONS
       -v version
          Sets the version of the generated DCE 1.1 variant UUID. Supported are version "1", "3", "4"
          and "5". The default is "1".

          For version 3 and version 5 UUIDs the additional command line arguments namespace and name
          have to be given. The namespace is either a UUID in string representation or an identifier
          for internally pre-defined namespace UUIDs (currently known are "ns:DNS", "ns:URL",
          "ns:OID", and "ns:X500"). The name is a string of arbitrary length.

       -m Forces the use of a random multi-cast MAC address when generating version 1 UUIDs. By
          default the real physical MAC address of the system is used.

       -n count
          Generate count UUIDs instead of just a single one (the default).

       -1 If option -n is used with a count greater than 1, then this option can enforce the reset
          the UUID context for each generated UUID.  This makes no difference for version 3, 4 and 5
          UUIDs. But version 1 UUIDs are based on the previously generated UUID which is remembered
          in the UUID context of the API. Option -1 deletes the remembered UUID on each iteration.

       -F format
          Representation format for importing or exporting an UUID. The following (case insensitive)
          format identifiers are currently recognized:

          BIN (binary representation)
              This is the raw 128 bit network byte order binary representation of a UUID. Example is
              the octet stream 0xF8 0x1D 0x4F 0xAE 0x7D 0xEC 0x11 0xD0 0xA7 0x65 0x00 0xA0 0xC9 0x1E
              0x6B 0xF6.

          STR (string representation)
              This is the 36 character hexadecimal ASCII string representation of a UUID. Example is
              the string "f81d4fae-7dec-11d0-a765-00a0c91e6bf6".

          SIV (single integer value representation)
              This is the maximum 39 character long single integer value representation of a UUID.
              Example is the string "329800735698586629295641978511506172918".

       -o filename
          Write output to filename instead of to stdout.

       -d Decode a given UUID (given as a command line argument or if the command line argument is
          "-" the UUID is read from stdin) and dump textual information about the UUID.

EXAMPLES
        # generate DCE 1.1 v1 UUID (time and node based)
        $ uuid -v1
        01c47915-4777-11d8-bc70-0090272ff725

        # decode and dump DCE 1.1 v1 UUID (time and node based)
        $ uuid -d 01c47915-4777-11d8-bc70-0090272ff725
        encode: STR:     01c47915-4777-11d8-bc70-0090272ff725
                SIV:     2349374037528578887923094374772111141
        decode: variant: DCE 1.1, ISO/IEC 11578:1996
                version: 1 (time and node based)
                content: time:  2004-01-15 16:22:26.376322.1 UTC
                         clock: 15472 (usually random)
                         node:  00:90:27:2f:f7:25 (global unicast)

        # generate DCE 1.1 v3 UUID (name based)
        $ uuid -v3 ns:URL http://www.ossp.org/
        02d9e6d5-9467-382e-8f9b-9300a64ac3cd

        # decode and dump DCE 1.1 v3 UUID (name based)
        $ uuid -d 02d9e6d5-9467-382e-8f9b-9300a64ac3cd
        encode: STR:     02d9e6d5-9467-382e-8f9b-9300a64ac3cd
                SIV:     3789866285607910888100818383505376205
        decode: variant: DCE 1.1, ISO/IEC 11578:1996
                version: 3 (name based, MD5)
                content: 02:D9:E6:D5:94:67:08:2E:0F:9B:93:00:A6:4A:C3:CD
                         (not decipherable: MD5 message digest only)

        # generate DCE 1.1 v4 UUID 4 (random data based)
        $ uuid -v4
        eb424026-6f54-4ef8-a4d0-bb658a1fc6cf

        # decode and dump DCE 1.1 v4 UUID 4 (random data based)
        $ uuid -d eb424026-6f54-4ef8-a4d0-bb658a1fc6cf
        encode: STR:     eb424026-6f54-4ef8-a4d0-bb658a1fc6cf
                SIV:     312712571721458096795100956955942831823
        decode: variant: DCE 1.1, ISO/IEC 11578:1996
                version: 4 (random data based)
                content: EB:42:40:26:6F:54:0E:F8:24:D0:BB:65:8A:1F:C6:CF
                         (no semantics: random data only)

SEE ALSO
       uuid(3), OSSP::uuid(3).

04-Jul-2008                                OSSP uuid 1.6.2                                    UUID(1)
