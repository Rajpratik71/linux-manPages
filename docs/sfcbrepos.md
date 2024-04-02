
sfcbrepos(1)                                                                               General Commands Manual                                                                               sfcbrepos(1)



NAME
       sfcbrepos - Script to rebuild the Small-Footprint CIM Broker (sfcb) class repository

SYNOPSIS
       sfcbrepos [options]

DESCRIPTION
       sfcbrepos rebuilds the sfcb class repository from the staging files. Rebuilding is done offline and the sfcb CIMOM must be restarted for changes to take effect.

OPTIONS
       Supported command line options are:

       -c schemadir
              Path to obtain the CIM Schema classes.  Default is /usr/share/sfcb

       -s stagingdir
              Path to sfcb staging area containing class MOFs and registration files Default is /var/lib/sfcb/stage

       -r registrationdir
              Path to the sfcb registration directory, containing the root of the class repository directory tree.  Default is /var/lib/sfcb/registration

       -f     Force  option.  Without  this option you will be prompted to confirm creating a new class repository (and delete the old one). Setting this option will rebuild the new sfcb repository without
              prompting.

       -i     Do not migrate instances from previous repository

       -b backendopts
              Set special backend options for sfcbmof.  Valid options are: P32 - compile for PowerPC target; Q - skip all string qualifiers in output file; q - skip selected qualifiers  (ArrayType,  Depre-
              cated,  Description,  MappingString, PUnit, UmlPackagePath, Units, Version, ValueMap, and Values) in output file.  Note: eliminating qualifiers will often significantly reduce the size of the
              class repository.

       -X platform
              Alias of -b

       -t format
              The format for the class repository. sf for reduced-size repositories read by ClassProviderSf. std for standard repositories read by either ClassProviderSf  or  ClassProviderGz.   Default  is
              auto, which will auto-detect based on the contents of the providerRegister file.

       -h     Display usage information and exit.

FILES
       /usr/share/sfcb/CIM/CIM_Schema.mof
              CIM Schema

       /var/lib/sfcb/registration/providerRegister
              Contains registration data for all installed providers.

       /var/lib/sfcb/registration/providerRegister.previous
              Contains registration data for all installed providers from previous time sfcbrepos was run. This can be used to restore an earlier class repository in case sfcbrepos generates a corrupt one.

       /var/lib/sfcb/registration/repository
              Contain class repository directory for all supported CIM namespaces.

       /var/lib/sfcb/registration/repository.previous
              Contain  class repository directory for all supported CIM namespaces from the previous time sfcbrepos was run. This can be used to restore an earlier class repository in case sfcbrepos gener-
              ates a corrupt one.

       /var/lib/sfcb/registration/repository/.../classSchemas
              Class data for a namespace.

       /var/lib/sfcb/stage/default.reg
              Registration data for the default built-in sfcb internal providers.

       /var/lib/sfcb/stage/mofs/root/interop/interop.mof
              Dummy classes used to added CIM indication support to the default interop namespace.

       /var/lib/sfcb/registration/stage/mofs/.../*.mof
              Class definitions for all installed providers.

       /var/lib/sfcb/registration/stage/regs/*.reg
              Registration info for all installed providers.

ENVIRONMENT
       DESTDIR
              If set, the value of this variable is prepended to the registration directory names. This can be useful to store the repository in a different location, i.e.  when cross-compiling providers.

LIBRARIES
       Requires libsfcBrokerCore.a

AUTHOR
       Adrian Schuur <schuur@de.ibm.com>

BUGS
       The SBLIM project maintains a mailing list to which you should direct all questions regarding sfcb, sfcc, wbemcli, or any of the SBLIM providers.  To subscribe to this mailing list visit

              http://lists.sourceforge.net/lists/listinfo/sblim-issues

       The SBLIM Project Bug tracking page can be found at

              http://sourceforge.net/tracker/?group_id=128809&atid=712784

COPYRIGHT
       (C) Copyright IBM Corp. 2004, 2005, 2009

AVAILABILITY
       The Small-Footprint CIM Broker (sfcb) is a part of the SBLIM project.  The most recent version is available on the web at

              http://sblim.sourceforge.net/

SEE ALSO
       sfcbd(1), sfcbstage(1), sfcbunstage(1), getSchema(1)



sfcbrepos Version 1.4.8                                                                          October 2009                                                                                    sfcbrepos(1)
