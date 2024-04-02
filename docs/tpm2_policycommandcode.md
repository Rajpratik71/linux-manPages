tpm2_policycommandcode(1)                                     General Commands Manual                                    tpm2_policycommandcode(1)

NAME
       tpm2_policycommandcode(1) - Restrict TPM object authorization to specific TPM commands.

SYNOPSIS
       tpm2_policycommandcode [OPTIONS] [ARGUMENT]

DESCRIPTION
       tpm2_policycommandcode(1)  - Restricts TPM object authorization to specific TPM commands.  Useful when you want to allow only specific com‐
       mands to interact with the TPM object.

       As an argument it takes the command as an integer or friendly string value.  Friendly string to COMMAND CODE mapping can be found  in  sec‐
       tion COMMAND CODE MAPPINGS.

OPTIONS
       • -S, --session=FILE:

         A session file from tpm2_startauthsession(1)’s -S option.

       • -L, --policy=FILE:

         File to save the policy digest.

       • ARGUMENT the command line argument specifies TPM2 command code.

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

COMMAND CODE MAPPINGS
       The friendly strings below can be used en lieu of the raw integer values.

       -TPM2_CC_AC_GetCapability: 0x194 -TPM2_CC_AC_Send: 0x195 -TPM2_CC_ActivateCredential: 0x147  -TPM2_CC_Certify:  0x148  -TPM2_CC_CertifyCre‐
       ation:  0x14a  -TPM2_CC_ChangeEPS: 0x124 -TPM2_CC_ChangePPS: 0x125 -TPM2_CC_Clear: 0x126 -TPM2_CC_ClearControl: 0x127 -TPM2_CC_ClockRateAd‐
       just: 0x130 -TPM2_CC_ClockSet: 0x128 -TPM2_CC_Commit: 0x18b -TPM2_CC_ContextLoad: 0x161 -TPM2_CC_ContextSave: 0x162 -TPM2_CC_Create:  0x153
       -TPM2_CC_CreateLoaded:  0x191  -TPM2_CC_CreatePrimary: 0x131 -TPM2_CC_DictionaryAttackLockReset: 0x139 -TPM2_CC_DictionaryAttackParameters:
       0x13a -TPM2_CC_Duplicate: 0x14b -TPM2_CC_ECC_Parameters: 0x178 -TPM2_CC_ECDH_KeyGen: 0x163 -TPM2_CC_ECDH_ZGen: 0x154 -TPM2_CC_EC_Ephemeral:
       0x18e  -TPM2_CC_EncryptDecrypt:  0x164  -TPM2_CC_EncryptDecrypt2:  0x193 -TPM2_CC_EventSequenceComplete: 0x185 -TPM2_CC_EvictControl: 0x120
       -TPM2_CC_FieldUpgradeData: 0x141 -TPM2_CC_FieldUpgradeStart: 0x12f -TPM2_CC_FirmwareRead: 0x179 -TPM2_CC_FlushContext: 0x165  -TPM2_CC_Get‐
       Capability: 0x17a -TPM2_CC_GetCommandAuditDigest: 0x133 -TPM2_CC_GetRandom: 0x17b -TPM2_CC_GetSessionAuditDigest: 0x14d -TPM2_CC_GetTestRe‐
       sult: 0x17c -TPM2_CC_GetTime: 0x14c -TPM2_CC_Hash: 0x17d -TPM2_CC_HashSequenceStart: 0x186 -TPM2_CC_HierarchyChangeAuth: 0x129 -TPM2_CC_Hi‐
       erarchyControl:   0x121   -TPM2_CC_HMAC:  0x155  -TPM2_CC_HMAC_Start:  0x15b  -TPM2_CC_Import:  0x156  -TPM2_CC_IncrementalSelfTest:  0x142
       -TPM2_CC_Load: 0x157 -TPM2_CC_LoadExternal: 0x167 -TPM2_CC_MakeCredential: 0x168 -TPM2_CC_NV_Certify: 0x184  -TPM2_CC_NV_ChangeAuth:  0x13b
       -TPM2_CC_NV_DefineSpace:  0x12a -TPM2_CC_NV_Extend: 0x136 -TPM2_CC_NV_GlobalWriteLock: 0x132 -TPM2_CC_NV_Increment: 0x134 -TPM2_CC_NV_Read:
       0x14e -TPM2_CC_NV_ReadLock: 0x14f -TPM2_CC_NV_ReadPublic: 0x169 -TPM2_CC_NV_SetBits: 0x135 -TPM2_CC_NV_UndefineSpace: 0x122 -TPM2_CC_NV_Un‐
       defineSpaceSpecial:  0x11f  -TPM2_CC_NV_Write:  0x137  -TPM2_CC_NV_WriteLock: 0x138 -TPM2_CC_ObjectChangeAuth: 0x150 -TPM2_CC_PCR_Allocate:
       0x12b -TPM2_CC_PCR_Event: 0x13c -TPM2_CC_PCR_Extend: 0x182 -TPM2_CC_PCR_Read: 0x17e -TPM2_CC_PCR_Reset:  0x13d  -TPM2_CC_PCR_SetAuthPolicy:
       0x12c  -TPM2_CC_PCR_SetAuthValue:  0x183  -TPM2_CC_Policy_AC_SendSelect:  0x196 -TPM2_CC_PolicyAuthorize: 0x16a -TPM2_CC_PolicyAuthorizeNV:
       0x192 -TPM2_CC_PolicyAuthValue: 0x16b -TPM2_CC_PolicyCommandCode: 0x16c  -TPM2_CC_PolicyCounterTimer:  0x16d  -TPM2_CC_PolicyCpHash:  0x16e
       -TPM2_CC_PolicyDuplicationSelect:  0x188  -TPM2_CC_PolicyGetDigest:  0x189  -TPM2_CC_PolicyLocality:  0x16f  -TPM2_CC_PolicyNameHash: 0x170
       -TPM2_CC_PolicyNV: 0x149 -TPM2_CC_PolicyNvWritten: 0x18f -TPM2_CC_PolicyOR: 0x171 -TPM2_CC_PolicyPassword: 0x18c -TPM2_CC_PolicyPCR:  0x17f
       -TPM2_CC_PolicyPhysicalPresence:   0x187   -TPM2_CC_PolicyRestart:   0x180   -TPM2_CC_PolicySecret:   0x151   -TPM2_CC_PolicySigned:  0x160
       -TPM2_CC_PolicyTemplate: 0x190 -TPM2_CC_PolicyTicket: 0x172 -TPM2_CC_PP_Commands: 0x12d  -TPM2_CC_Quote:  0x158  -TPM2_CC_ReadClock:  0x181
       -TPM2_CC_ReadPublic:  0x173  -TPM2_CC_Rewrap:  0x152  -TPM2_CC_RSA_Decrypt:  0x159  -TPM2_CC_RSA_Encrypt:  0x174  -TPM2_CC_SelfTest:  0x143
       -TPM2_CC_SequenceComplete: 0x13e -TPM2_CC_SequenceUpdate: 0x15c -TPM2_CC_SetAlgorithmSet: 0x13f  -TPM2_CC_SetCommandCodeAuditStatus:  0x140
       -TPM2_CC_SetPrimaryPolicy:  0x12e  -TPM2_CC_Shutdown:  0x145  -TPM2_CC_Sign: 0x15d -TPM2_CC_StartAuthSession: 0x176 -TPM2_CC_Startup: 0x144
       -TPM2_CC_StirRandom: 0x146 -TPM2_CC_TestParms: 0x18a -TPM2_CC_Unseal: 0x15e -TPM2_CC_Vendor_TCG_Test: 0x20000000  -TPM2_CC_VerifySignature:
       0x177 -TPM2_CC_ZGen_2Phase: 0x18d

EXAMPLES
       Start a policy session and extend it with a specific command like unseal.  Attempts to perform other operations would fail.

   Create an unseal-only policy
              tpm2_startauthsession -S session.dat

              tpm2_policycommandcode -S session.dat -L policy.dat TPM2_CC_Unseal

              tpm2_flushcontext session.dat

   Create the object with unseal-only auth policy
              tpm2_createprimary -C o -c prim.ctx

              tpm2_create -C prim.ctx -u sealkey.pub -r sealkey.priv -L policy.dat \
                -i- <<< "SEALED-SECRET"

   Try unseal operation
              tpm2_load -C prim.ctx -u sealkey.pub -r sealkey.priv -n sealkey.name \
                -c sealkey.ctx

              tpm2_startauthsession --policy-session -S session.dat

              tpm2_policycommandcode -S session.dat -L policy.dat TPM2_CC_Unseal

              tpm2_unseal -p session:session.dat -c sealkey.ctx
              SEALED-SECRET

              tpm2_flushcontext session.dat

   Try any other operation
              echo "Encrypt Me" > plain.txt

              tpm2_encryptdecrypt plain.txt -o enc.txt -c sealkey.ctx plain.txt
              ERROR: Esys_EncryptDecrypt2(0x12F) - tpm:error(2.0): authValue or authPolicy is
              not available for selected entity

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

tpm2-tools                                                                                                               tpm2_policycommandcode(1)
