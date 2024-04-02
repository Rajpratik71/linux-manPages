cimprovider(1)                                                                                                                                                                                 cimprovider(1)



NAME
       cimprovider - disable, enable, remove , group, list or display status of registered CIM providers or CIM provider modules

SYNOPSIS
       cimprovider -d -m module

       cimprovider -e -m module

       cimprovider -r -m module [ -p provider ]

       cimprovider -g group -m module

       cimprovider -l  [ -s | -f | -m module ]

       cimprovider -h

       cimprovider --help

       cimprovider --version


   Remarks
       The -l option for this command can be executed by any user(s). All other options require superuser permissions.

       This command disables, enables, or removes one CIM provider module or CIM provider at a time.

DESCRIPTION
       The cimprovider command provides a command line interface to disable, enable, unregister, group and list registered CIM providers.  If a CIM provider is disabled, the CIM Server rejects any requests
       to the provider.  If a CIM provider is enabled, the CIM Server forwards requests to the provider.  And if a CIM provider is unregistered, the CIM Server will no longer have any information about the
       provider.

       In order to use the cimprovider command, cimserver has to be running and the specified provider module (a grouping of providers in the same shared library) or provider has to be registered with WBEM
       Services.

       The first form of cimprovider disables the specified provider module.  When a specified provider module is in the disabled state, any new requests to the providers that are contained in  the  speci‐
       fied provider module will be rejected.

       The  second  form of cimprovider enables the providers that are contained in the specified provider module.  The providers that are contained in the specified provider module are now ready to accept
       new requests.

       The third form of cimprovider removes (un-registers) the specified provider module and all of its contained providers or the specified provider in the specified provider  module.   Once  removed,  a
       provider or provider module must be re-registered (typically by loading its registration schema via the cimmof command).

       The  fourth  form  of  cimprovider  sets  the provider module group. If the provider module is  active, provider module is disabled first, group is set and enabled again. If group name is CIMServer,
       provider module is loaded into CIMServer process depending on UserContext value. Specify empty string to remove from grouping.

       The last form of cimprovider lists all the registered provider modules and module status or all the providers in the specified provider module. To list all providers in all  modules,  issue  a  cim‐
       provider -l command, followed by cimprovider -l -m for each listed module.

       The following provider module status values are defined:

       OK             The provider module is enabled.

       Stopping       The provider module is in the process of being disabled.

       Stopped        The provider module is disabled.

       Degraded       A failure was detected in an out-of-process provider module.  Disable and re-enable the provider module to ensure any active indication subscriptions are being served.

       Error          An invalid registration instance was encountered upon CIM Server initialization.

       Specifying no options with the cimprovider command displays the command usage.

   Options
       The cimprovider command recognizes the following options:

              -d             Disables the specified CIM provider R module .  If user(s) try to disable a module that is already disabled, an error message is returned and no action is taken.

              -e             Enables  the  specified  CIM  provider  R  module  .  If user(s) try to enable a module that is already enabled or try to enable a module that is disabling, an error message is
                             returned and no action is taken.

              -h, --help     Display command usage information.

              -l             Displays all the registered provider modules.

              -m module      Specifies the provider module for the operation.

              -p provider    Specifies the provider for the operation.

              -r             Removes the specified provider module and all of its contained providers.  If provider is specified, removes the specified  provider  in  the  specified  provider  module  (not
                             affecting any other providers in that module).

              -g             Sets  the  CIM  provider  module  group.   Specify empty string to remove from grouping.  If the provider module is  active, provider module is disabled first, group is set and
                             enabled again. All provider modules with the same group name are loaded into a single agent process except when overridden by specific UserContext values. If group name is CIM‐
                             Server , provider module is loaded into CIMServer process depending on UserContext value.

              -s             Displays the status of provider modules.

              -f             Displays the full status of provider modules with group name.

              --version      Display CIM Server version number.

EXIT STATUS
       When an error occurs, an error message is written to stderr and an error value 1 is returned.  The following return values are returned:

              0      Successful completion
              1      Error

USAGE NOTES
       The cimprovider command requires that the CIM Server is running. If an operation requires more than two minutes to be processed, the cimprovider command prints a timeout message and returns an error
       value.

EXAMPLES
       Disable provider module "OperatingSystemProvider" and all of its contained providers (placing them in a stopped state).

              cimprovider -d -m OperatingSystemProvider

       Enable provider module "OperatingSystemProvider" and all of its contained providers (placing them in an OK state).

              cimprovider -e -m OperatingSystemProvider

       Remove (un-register) the "OperatingSystemProvider" provider module and all of its contained providers.

              cimprovider -r -m OperatingSystemProvider

       Remove (un-register) the "PG_OperatingSystemProvider" provider that is contained in the "OperatingSystemProvider" provider module.

              cimprovider -r -m OperatingSystemProvider -p PG_OperatingSystemProvider

       List the registered provider modules.

              cimprovider -l

       List the registered provider modules and their status (such as OK, Stopping, Stopped).

              cimprovider -l -s

       List the registered providers which are contained in the "OperatingSystemProvider" provider module.

              cimprovider -l -m OperatingSystemProvider

       Set the group name of the "OperatingSystemProvider" provider module to "CIMServer".

              cimprovider -g CIMServer -m OperatingSystemProvider

       Remove "OperatingSystemProvider" provider module from grouping.

              cimprovider -g "" -m OperatingSystemProvider

SEE ALSO
       cimmof(1), cimserver(1).



                                                                                                                                                                                               cimprovider(1)
