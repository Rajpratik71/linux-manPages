tpm2_evictcontrol(1)                                          General Commands Manual                                         tpm2_evictcontrol(1)

NAME
       tpm2_evictcontrol(1) - Make a transient object persistent or evict a persistent object.

SYNOPSIS
       tpm2_evictcontrol [OPTIONS] [ARGUMENT]

DESCRIPTION
       tpm2_evictcontrol(1)  - Allows a transient object to be made persistent or a persistent object to be evicted.  The HANDLE argument controls
       the index the handle will be assigned to.  If the object specified via -c is transient, and a permanent HANDLE  is  specified,  the  object
       will be persisted at HANDLE.  If HANDLE is a -, then the object will be persisted at the first available permanent handle location.  If the
       object specified via -c is a permanent handle, then the object will be evicted from it’s permenent handle location.

OPTIONS
       • -C, --hierarchy=OBJECT:
         The authorization hierarchy used to authorize the commands.  Defaults to the “owner” hierarchy.  Supported options are:

         • o for TPM_RH_OWNER

         • p for TPM_RH_PLATFORM

         • <num> where a raw number can be used.

       • -c, --object-context=OBJECT:

         A context object specifier of a transient or persistent object.  If OBJECT is a transient object it will be persisted, either to the han‐
         dle  specified by the argument or to first available vacant persistent handle.  If the OBJECT is for a persistent object, then the object
         will be evicted from non-volatile memory.

       • -P, --auth=AUTH:

         The authorization value for the hierarchy specified with -C.

       • -o, --output=FILE:

         Optionally output a serialized object representing the persistent handle.  If untampered, these files are safer to use then  raw  persis‐
         tent handles.  A raw persistent handle should be verified that the object it points to is as expected.

       • ARGUMENT the command line argument specifies the persistent handle to save the transient object to.

Output
       The tool outputs a YAML compliant dictionary with the fields: persistent-handle: action: evicted|persisted

       Where  persistent-handle  is  the  handle the action occurred to.  Where action can either be one of evicted or persisted.  If an object is
       evicted then the object is no longer resident at the persistent-handle address within the TPM.  If an object is persisted then  the  object
       is resident at the persistent-handle address within the TPM.

   References
Context Object Format
       The type of a context object, whether it is a handle or file name, is determined according to the following logic in-order:

       • If the argument is a file path, then the file is loaded as a restored TPM transient object.

       • If the argument is a prefix match on one of:

         • owner: the owner hierarchy

         • platform: the platform hierarchy

         • endorsement: the endorsement hierarchy

         • lockout: the lockout control persistent object

       • If the argument argument can be loaded as a number it will be treat as a handle, e.g. 0x81010013 and used directly._OBJECT_.

Authorization Formatting
       Authorization for use of an object in TPM2.0 can come in 3 different forms: 1.  Password 2.  HMAC 3.  Sessions

       NOTE: “Authorizations default to the EMPTY PASSWORD when not specified”.

   Passwords
       Passwords are interpreted in the following forms below using prefix identifiers.

       Note: By default passwords are assumed to be in the string form when they do not have a prefix.

   String
       A  string password, specified by prefix “str:” or it’s absence (raw string without prefix) is not interpreted, and is directly used for au‐
       thorization.

   Examples
              foobar
              str:foobar

   Hex-string
       A hex-string password, specified by prefix “hex:” is converted from a hexidecimal form into a byte array form, thus allowing passwords with
       non-printable and/or terminal un-friendly characters.

   Example
              hex:0x1122334455667788

   File
       A  file based password, specified be prefix “file:” should be the path of a file containing the password to be read by the tool or a “-” to
       use stdin.  Storing passwords in files prevents information leakage, passwords passed as options can be read from the process list or  com‐
       mon shell history features.

   Examples
              # to use stdin and be prompted
              file:-

              # to use a file from a path
              file:path/to/password/file

              # to echo a password via stdin:
              echo foobar | tpm2_tool -p file:-

              # to use a bash here-string via stdin:

              tpm2_tool -p file:- <<< foobar

   Sessions
       When  using  a policy session to authorize the use of an object, prefix the option argument with the session keyword.  Then indicate a path
       to a session file that was created with tpm2_startauthsession(1).  Optionally, if the session requires an auth value to be  sent  with  the
       session handle (eg policy password), then append a + and a string as described in the Passwords section.

   Examples
       To use a session context file called session.ctx.

              session:session.ctx

       To use a session context file called session.ctx AND send the authvalue mypassword.

              session:session.ctx+mypassword

       To use a session context file called session.ctx AND send the HEX authvalue 0x11223344.

              session:session.ctx+hex:11223344

   PCR Authorizations
       You   can   satisfy   a   PCR   policy  using  the  “pcr:”  prefix  and  the  PCR  minilanguage.   The  PCR  minilanguage  is  as  follows:
       <pcr-spec>=<raw-pcr-file>

       The PCR spec is documented in in the section “PCR bank specifiers”.

       The raw-pcr-file is an optional the output of the raw PCR contents as returned by tpm2_pcrread(1).

       PCR bank specifiers (common/pcr.md)

   Examples
       To satisfy a PCR policy of sha256 on banks 0, 1, 2 and 3 use a specifier of:

              pcr:sha256:0,1,2,3

       specifying AUTH.

COMMON OPTIONS
       This collection of options are common to many programs and provide information that many users may expect.

       • -h, --help=[man|no-man]: Display the tools manpage.  By default, it attempts to invoke the manpager for the  tool,  however,  on  failure
         will  output a short tool summary.  This is the same behavior if the “man” option argument is specified, however if explicit “man” is re‐
         quested, the tool will provide errors from man on stderr.  If the “no-man” option if specified, or the manpager fails, the short  options
         will be output to stdout.

         To successfully use the manpages feature requires the manpages to be installed or on MANPATH, See man(1) for more details.

       • -v, --version: Display version information for this tool, supported tctis and exit.

       • -V,  --verbose:  Increase  the information that the tool prints to the console during its execution.  When using this option the file and
         line number are printed.

       • -Q, --quiet: Silence normal tool output to stdout.

       • -Z, --enable-errata: Enable the application of errata fixups.  Useful if an errata fixup needs to be applied to commands sent to the TPM.
         Defining the environment TPM2TOOLS_ENABLE_ERRATA is equivalent.  information many users may expect.

TCTI Configuration
       The  TCTI or “Transmission Interface” is the communication mechanism with the TPM.  TCTIs can be changed for communication with TPMs across
       different mediums.

       To control the TCTI, the tools respect:

       1. The command line option -T or --tcti

       2. The environment variable: TPM2TOOLS_TCTI.

       Note: The command line option always overrides the environment variable.

       The current known TCTIs are:

       • tabrmd - The resource manager, called tabrmd (https://github.com/tpm2-software/tpm2-abrmd).  Note that tabrmd and abrmd as  a  tcti  name
         are synonymous.

       • mssim - Typically used for communicating to the TPM software simulator.

       • device - Used when talking directly to a TPM device file.

       • none  -  Do not initalize a connection with the TPM.  Some tools allow for off-tpm options and thus support not using a TCTI.  Tools that
         do not support it will error when attempted to be used without a TCTI connection.  Does not support ANY options and MUST BE presented  as
         the exact text of “none”.

       The arguments to either the command line option or the environment variable are in the form:

       <tcti-name>:<tcti-option-config>

       Specifying  an  empty  string for either the <tcti-name> or <tcti-option-config> results in the default being used for that portion respec‐
       tively.

   TCTI Defaults
       When a TCTI is not specified, the default TCTI is searched for using dlopen(3) semantics.  The tools will search  for  tabrmd,  device  and
       mssim  TCTIs  IN  THAT  ORDER and USE THE FIRST ONE FOUND.  You can query what TCTI will be chosen as the default by using the -v option to
       print the version information.  The “default-tcti” key-value pair will indicate which of the aforementioned TCTIs is the default.

   Custom TCTIs
       Any TCTI that implements the dynamic TCTI interface can be loaded.  The tools internally use dlopen(3), and the raw tcti-name value is used
       for the lookup.  Thus, this could be a path to the shared library, or a library name as understood by dlopen(3) semantics.

TCTI OPTIONS
       This collection of options are used to configure the various known TCTI modules available:

       • device: For the device TCTI, the TPM character device file for use by the device TCTI can be specified.  The default is /dev/tpm0.

         Example: -T device:/dev/tpm0 or export TPM2TOOLS_TCTI=“device:/dev/tpm0”

       • mssim:  For  the  mssim  TCTI,  the  domain  name  or IP address and port number used by the simulator can be specified.  The default are
         127.0.0.1 and 2321.

         Example: -T mssim:host=localhost,port=2321 or export TPM2TOOLS_TCTI=“mssim:host=localhost,port=2321”

       • abrmd: For the abrmd TCTI, the configuration string format is a series of simple key value pairs separated by a `,' character.  Each  key
         and value string are separated by a `=' character.

         • TCTI abrmd supports two keys:

           1. `bus_name' : The name of the tabrmd service on the bus (a string).

           2. `bus_type' : The type of the dbus instance (a string) limited to `session' and `system'.

         Specify the tabrmd tcti name and a config string of bus_name=com.example.FooBar:

                \--tcti=tabrmd:bus_name=com.example.FooBar

         Specify the default (abrmd) tcti and a config string of bus_type=session:

                \--tcti:bus_type=session

         NOTE: abrmd and tabrmd are synonymous.  the various known TCTI modules.

EXAMPLES
   To make a transient handle persistent at address 0x81010002
              tpm2_changeauth -c o ownerauth
              tpm2_createprimary -c primary.ctx -P ownerauth
              tpm2_evictcontrol -C o -c primary.ctx 0x81010002 -P ownerauth

   To evict a persistent handle
              tpm2_evictcontrol -C o -c 0x81010002 -P ownerauth

   To make a transient handle persistent and output a serialized persistent handle.
              tpm2_evictcontrol -C o -c primary.ctx -o primary.handle -P ownerauth

Returns
       Tools can return any of the following codes:

       • 0 - Success.

       • 1 - General non-specific error.

       • 2 - Options handling error.

       • 3 - Authentication error.

       • 4 - TCTI related error.

       • 5 - Non supported scheme.  Applicable to tpm2_testparams.

BUGS
       Github Issues (https://github.com/tpm2-software/tpm2-tools/issues)

HELP
       See the Mailing List (https://lists.01.org/mailman/listinfo/tpm2)

tpm2-tools                                                                                                                    tpm2_evictcontrol(1)
