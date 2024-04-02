CHECKPOLICY(8)                                                                             System Manager's Manual                                                                             CHECKPOLICY(8)



NAME
       checkpolicy - SELinux policy compiler

SYNOPSIS
       checkpolicy [-b] [-C] [-d] [-M] [-c policyvers] [-o output_file] [input_file]

DESCRIPTION
       This manual page describes the checkpolicy command.

       checkpolicy is a program that checks and compiles a SELinux security policy configuration into a binary representation that can be loaded into the kernel.  If no input file name is specified, check‐
       policy will attempt to read from policy.conf or policy, depending on whether the -b flag is specified.


OPTIONS
       -b,--binary
              Read an existing binary policy file rather than a source policy.conf file.

       -C,--cil
              Write CIL policy file rather than binary policy file.

       -d,--debug
              Enter debug mode after loading the policy.

       -M,--mls
              Enable the MLS policy when checking and compiling the policy.

       -o,--output filename
              Write a binary policy file to the specified filename.

       -c policyvers
              Specify the policy version, defaults to the latest.

       -t,--target
              Specify the target platform (selinux or xen).

       -U,--handle-unknown <action>
              Specify how the kernel should handle unknown classes or permissions (deny, allow or reject).

       -V,--version
              Show version information.

       -h,--help
              Show usage information.


SEE ALSO
       SELinux documentation at http://www.nsa.gov/research/selinux, especially "Configuring the SELinux Policy".



AUTHOR
       This manual page was written by Arpad Magosanyi <mag@bunuel.tii.matav.hu>, and edited by Stephen Smalley <sds@epoch.ncsc.mil>.  The program was written by Stephen Smalley <sds@epoch.ncsc.mil>.



                                                                                                                                                                                               CHECKPOLICY(8)
