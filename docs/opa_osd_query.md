
opa_osd_query(1)                                                                            IFSFFCLIRG (Man Page)                                                                            opa_osd_query(1)



NAME
       opa_osd_query



       Queries the opasadb for path records. This tool allows you to create an arbitrary path query and view the result.

Syntax
       opa_osd_query [-v | -verbose] | [-s | --slid] | [-d | --dlid] | [-S |
       --sgid] | [-D | --dgid]| [-k | --pkey] | [-i | --sid] | [-h | --hfi] |
       [-p | --port]

Options
       NOTE:


       ·      All arguments are optional, but ill-formed queries can be expected to fail. You must provide at least a pair of LIDs or a pair of GIDs.

       ·      The mixing of lids and gids in a query is not permitted.

       ·      SID or PKey can be provided, but not both.

       ·      If you have multiple HFIs, the same LID can appear on more than one HFI, therefore you must specify which HFI to use when searching by LIDs.

       ·      Numbers can be in decimal, hex, or octal.


       --help    Produces full help text.

       -v/--verbose arg
                 Sets debugging level. Range is 1 - 7.


       -s/--slid arg
                 Specifies source LID.

       -d/--dlid arg
                 Specifies destination LID.

       -S/--sgid arg
                 Specifies source GID in GID format (0x00000000:0x00000000) or in Inet6 format (x:x:x:x:x:x:x:x).

       -D/--dgid arg
                 Specifies destination GID in GID format (0x00000000:0x00000000) or in Inet6 format (x:x:x:x:x:x:x:x).

       -k/--pkey arg
                 Specifies partition key.

       -i/--sid arg
                 Specifies service ID.

       -h/--hfi arg
                 Specifies the HFI to use. Default is first HFI. The HFI can be identified by name, for example, hfi1_0 or by number, for example, 1, 2, 3, ... .

       -p/--port arg
                 Specifies the port to use. Default is first port.

Example
       opa_osd_query -s2 -d4



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                              opa_osd_query(1)
