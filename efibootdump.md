EFIBOOTDUMP(8)                                                                                                                                                                          EFIBOOTDUMP(8)

NAME
       efibootdump - dump a boot entries from a variable or a file

SYNOPSIS
       efibootdump [-?|--help] [--usage]
            [-f <file1> [... -f <fileN>]]
            [[-g {guid}] <name0> [... [<nameN>]]]

DESCRIPTION
       efibootdump  is  a  userspace application used to display individual UEFI boot options, from a file or a UEFI variable.  This allows e.g. saved files from efivarfs to be displayed, as well as
       variables on the running machine.

OPTIONS
       The following is a list of options accepted by efibootmgr:

       -g | --guid {guid}
              Any variables specified by name have the specified GUID.

       -f | --file <file>
              Read a single boot variable from the specified file.

       <nameN>
              Display the specified variable on the local machine.  If no GUID is specified, EFI Global Variable is the default.

BUGS
       Please direct any bugs, features, patches, etc. to the Red Hat installer team at https://github.com/rhinstaller/efibootmgr .

SEE ALSO
       efibootmgr(8)

                                                                                           24 February 2016                                                                             EFIBOOTDUMP(8)
