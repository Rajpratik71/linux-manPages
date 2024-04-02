CHECKMODULE(8)                                                                             System Manager's Manual                                                                             CHECKMODULE(8)



NAME
       checkmodule - SELinux policy module compiler

SYNOPSIS
       checkmodule [-h] [-b] [-C] [-m] [-M] [-U handle_unknown ] [-V] [-o output_file] [input_file]

DESCRIPTION
       This manual page describes the checkmodule command.

       checkmodule  is  a  program that checks and compiles a SELinux security policy module into a binary representation.  It can generate either a base policy module (default) or a non-base policy module
       (-m option); typically, you would build a non-base policy module to add to an existing module store that already has a base module provided by the base policy.  Use semodule_package to combine  this
       module with its optional file contexts to create a policy package, and then use semodule to install the module package into the module store and load the resulting policy.


OPTIONS
       -b,--binary
              Read an existing binary policy module file rather than a source policy module file.  This option is a development/debugging aid.

       -C,--cil
              Write CIL policy file rather than binary policy file.

       -h,--help
              Print usage.

       -m     Generate a non-base policy module.

       -M,--mls
              Enable the MLS/MCS support when checking and compiling the policy module.

       -V,--version
               Show policy versions created by this program.  Note that you cannot currently build older versions.

       -o,--output filename
              Write a binary policy module file to the specified filename.  Otherwise, checkmodule will only check the syntax of the module source file and will not generate a binary module at all.

       -U,--handle-unknown <action>
              Specify how the kernel should handle unknown classes or permissions (deny, allow or reject).


EXAMPLE
       # Build a MLS/MCS-enabled non-base policy module.
       $ checkmodule -M -m httpd.te -o httpd.mod


SEE ALSO
       semodule(8), semodule_package(8) SELinux documentation at http://www.nsa.gov/research/selinux, especially "Configuring the SELinux Policy".



AUTHOR
       This manual page was copied from the checkpolicy man page written by Arpad Magosanyi <mag@bunuel.tii.matav.hu>, and edited by Dan Walsh <dwalsh@redhat.com>.  The program was written by Stephen Smal‐
       ley <sds@epoch.ncsc.mil>.



                                                                                                                                                                                               CHECKMODULE(8)
