tpm2_policyor(1)                                              General Commands Manual                                             tpm2_policyor(1)

NAME
       tpm2_policyor(1) - logically OR’s two policies together.

SYNOPSIS
       tpm2_policyor [OPTIONS]

DESCRIPTION
       tpm2_policyor(1)  - Generates a policy_or event with the TPM.  It expects a session to be already established via tpm2_startauthsession(1).
       If the input session is a trial session this tool generates a policy digest that compounds two or more input policy digests such  that  the
       resulting  policy  digest  requires at least one of the policy events being true.  If the input session is real policy session tpm2_policy‐
       or(1) authenticates the object successfully if at least one of the policy events are true.

OPTIONS
       • -L, --policy=FILE:

         File to save the compounded policy digest.

       • -l, --policy-list=POLICY_FILE_LIST:

         The list of files for the policy digests that has to be compounded resulting in individual policies being added to  final  policy  digest
         that can authenticate the object.  The list begins with the policy digest hash alg.

       • -S, --session=FILE:

         The policy session file generated via the -S option to tpm2_startauthsession(1).

   References
COMMON OPTIONS
       This collection of options are common to many programs and provide information that many users may expect.

       • -h,  --help=[man|no-man]:  Display  the  tools manpage.  By default, it attempts to invoke the manpager for the tool, however, on failure
         will output a short tool summary.  This is the same behavior if the “man” option argument is specified, however if explicit “man” is  re‐
         quested,  the tool will provide errors from man on stderr.  If the “no-man” option if specified, or the manpager fails, the short options
         will be output to stdout.

         To successfully use the manpages feature requires the manpages to be installed or on MANPATH, See man(1) for more details.

       • -v, --version: Display version information for this tool, supported tctis and exit.

       • -V, --verbose: Increase the information that the tool prints to the console during its execution.  When using this option  the  file  and
         line number are printed.

       • -Q, --quiet: Silence normal tool output to stdout.

       • -Z, --enable-errata: Enable the application of errata fixups.  Useful if an errata fixup needs to be applied to commands sent to the TPM.
         Defining the environment TPM2TOOLS_ENABLE_ERRATA is equivalent.  information many users may expect.

TCTI Configuration
       The TCTI or “Transmission Interface” is the communication mechanism with the TPM.  TCTIs can be changed for communication with TPMs  across
       different mediums.

       To control the TCTI, the tools respect:

       1. The command line option -T or --tcti

       2. The environment variable: TPM2TOOLS_TCTI.

       Note: The command line option always overrides the environment variable.

       The current known TCTIs are:

       • tabrmd  -  The  resource manager, called tabrmd (https://github.com/tpm2-software/tpm2-abrmd).  Note that tabrmd and abrmd as a tcti name
         are synonymous.

       • mssim - Typically used for communicating to the TPM software simulator.

       • device - Used when talking directly to a TPM device file.

       • none - Do not initalize a connection with the TPM.  Some tools allow for off-tpm options and thus support not using a TCTI.   Tools  that
         do  not support it will error when attempted to be used without a TCTI connection.  Does not support ANY options and MUST BE presented as
         the exact text of “none”.

       The arguments to either the command line option or the environment variable are in the form:

       <tcti-name>:<tcti-option-config>

       Specifying an empty string for either the <tcti-name> or <tcti-option-config> results in the default being used for  that  portion  respec‐
       tively.

   TCTI Defaults
       When  a  TCTI  is  not specified, the default TCTI is searched for using dlopen(3) semantics.  The tools will search for tabrmd, device and
       mssim TCTIs IN THAT ORDER and USE THE FIRST ONE FOUND.  You can query what TCTI will be chosen as the default by using  the  -v  option  to
       print the version information.  The “default-tcti” key-value pair will indicate which of the aforementioned TCTIs is the default.

   Custom TCTIs
       Any TCTI that implements the dynamic TCTI interface can be loaded.  The tools internally use dlopen(3), and the raw tcti-name value is used
       for the lookup.  Thus, this could be a path to the shared library, or a library name as understood by dlopen(3) semantics.

TCTI OPTIONS
       This collection of options are used to configure the various known TCTI modules available:

       • device: For the device TCTI, the TPM character device file for use by the device TCTI can be specified.  The default is /dev/tpm0.

         Example: -T device:/dev/tpm0 or export TPM2TOOLS_TCTI=“device:/dev/tpm0”

       • mssim: For the mssim TCTI, the domain name or IP address and port number used by  the  simulator  can  be  specified.   The  default  are
         127.0.0.1 and 2321.

         Example: -T mssim:host=localhost,port=2321 or export TPM2TOOLS_TCTI=“mssim:host=localhost,port=2321”

       • abrmd:  For the abrmd TCTI, the configuration string format is a series of simple key value pairs separated by a `,' character.  Each key
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
       Creates two sets of PCR data files, one of them being the existing PCR values and other being a set of PCR values that would result if  the
       PCR  were extended with a known value.  Now create two separate policy digests, each with one set of the PCR values using tpm2_policypcr(1)
       tool in trial sessions.  Now build a policy_or with the two PCR policy digests as inputs.  Create a sealing object with  an  authentication
       policy compounding the 2 policies with tpm2_policyor and seal a secret.  Unsealing with either of the PCR sets should be successful.

   Create two unique pcr policies with corresponding unique sets of pcrs.
   Start with pcr value 0
              tpm2_pcrreset 23

   PCR1 policy
              tpm2_startauthsession -S session.ctx

              tpm2_policypcr -S session.ctx -l sha1:23 -L set1.pcr0.policy

              tpm2_flushcontext session.ctx

              rm session.ctx

   PCR2 policy
              tpm2_pcrextend 23:sha1=f1d2d2f924e986ac86fdf7b36c94bcdf32beec15

              tpm2_startauthsession -S session.ctx

              tpm2_policypcr -S session.ctx -l sha1:23 -L set2.pcr0.policy

              tpm2_flushcontext session.ctx

              rm session.ctx

   Create a policyOR resulting from compounding the two unique pcr policies in an OR fashion
              tpm2_startauthsession -S session.ctx

              tpm2_policyor -S session.ctx -L policyOR \
              -l sha256:set1.pcr0.policy,set2.pcr0.policy

              tpm2_flushcontext session.ctx

              rm session.ctx

   Create a sealing object with auth policyOR created above.
              tpm2_createprimary -C o -c prim.ctx

              tpm2_create -g sha256 -u sealkey.pub -r sealkey.priv -L policyOR -C prim.ctx \
              -i- <<< "secretpass"

              tpm2_load -C prim.ctx -c sealkey.ctx -u sealkey.pub -r sealkey.priv

   Attempt unsealing by satisfying the policyOR by satisfying SECOND of the two policies.
              tpm2_startauthsession -S session.ctx --policy-session

              tpm2_policypcr -S session.ctx -l sha1:23

              tpm2_policyor -S session.ctx -L policyOR \
              -l sha256:set1.pcr0.policy,set2.pcr0.policy

              unsealed=`tpm2_unseal -p session:session.ctx -c sealkey.ctx`

              echo $unsealed

              tpm2_flushcontext session.ctx

              rm session.ctx

   Extend the pcr to emulate tampering of the system software and hence the pcr value.
              tpm2_pcrextend 23:sha1=f1d2d2f924e986ac86fdf7b36c94bcdf32beec15

   Attempt unsealing by trying to satisy the policOR by attempting to satisy one of the two policies.
              tpm2_startauthsession -S session.ctx --policy-session

              tpm2_policypcr -S session.ctx -l sha1:23

   This should fail
              tpm2_policyor -S session.ctx -L policyOR \
              -l sha256:set1.pcr0.policy,set2.pcr0.policy

              tpm2_flushcontext session.ctx

              rm session.ctx

   Reset pcr to get back to the first set of pcr value
              tpm2_pcrreset 23

   Attempt unsealing by satisfying the policyOR by satisfying FIRST of the two policies.
              tpm2_startauthsession -S session.ctx --policy-session

              tpm2_policypcr -S session.ctx -l sha1:23

              tpm2_policyor -S session.ctx -L policyOR \
              -l sha256:set1.pcr0.policy,set2.pcr0.policy

              unsealed=`tpm2_unseal -p session:session.ctx -c sealkey.ctx`

              echo $unsealed

              tpm2_flushcontext session.ctx

              rm session.ctx

Returns
       Tools can return any of the following codes:

       • 0 - Success.

       • 1 - General non-specific error.

       • 2 - Options handling error.

       • 3 - Authentication error.

       • 4 - TCTI related error.

       • 5 - Non supported scheme.  Applicable to tpm2_testparams.

Limitations
       It expects a session to be already established via tpm2_startauthsession(1) and requires one of the following:

       • direct device access

       • extended session support with tpm2-abrmd.

       Without it, most resource managers will not save session state between command invocations.

BUGS
       Github Issues (https://github.com/tpm2-software/tpm2-tools/issues)

HELP
       See the Mailing List (https://lists.01.org/mailman/listinfo/tpm2)

tpm2-tools                                                                                                                        tpm2_policyor(1)
