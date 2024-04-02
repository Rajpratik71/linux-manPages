debsig-verify(1)                                                    dpkg suite                                                    debsig-verify(1)

NAME
       debsig-verify - Verify signatures for a Debian format package

SYNOPSIS
       debsig-verify [option...] deb

DESCRIPTION
       This program is part of a security model that verifies the source and validity of a Debian format package (commonly refered to as a deb).

       This  program  implements the verification specs defined in the document, "Package Verification with dpkg: Implementation", which is a more
       complete reference for the verification procedure.

       The program generally takes one argument, the deb file to be verified. It will then check the origin signature of the deb, find its  Public
       Key  ID (long format), and use that as the name for a policy subdirectory. If this subdirectory does not exist, then the verification fails
       immediately.

       In this subdirectory, the program finds one or more files named with the .pol file extension, which signifies an XML format policy  defini‐
       tion. This file contains three main parts.

       Origin Information about the origin of this policy.

       Selection
              Rules used to decide if this policy is pertinent to this deb's verification.

       Verification
              Rules that are used to actually verify the deb.

       The  policy  files will reference keyrings by a filename. These keyrings will be looked for in a subdirectory of the keyring directory. The
       subdirectory has the same name as the policy subdirectory (previously determined by the Origin's Public Key ID).

       The program will, after first parsing the entire file, check the Origin ID against the Public Key ID of the origin signature  in  the  deb.
       If these match (which they should, else something is really wrong), then it will proceed to the Selection rules.

       The  Selection  rules  decide whether this policy is suitable for verifying this deb. If these rules fail, then the program will proceed to
       the next policy. If it passes, then the program commits to using this policy for verification, and no other policies will be referenced.

       The last verification step relies on the Verification rules. These are similar in format to the Selection rules, but are usually more  con‐
       strained. If these rules fail, the program exits with a non-zero status. If they pass, then it exits with a zero status.

OPTIONS
       -q, --quiet
              Causes the program to send no output, other than fatal errors. This is useful when being called from another program, where you rely
              on the exit value only.

       -v, --verbose
              Causes the program to send more output on execution, so as to follow the steps it is taking while trying to verify the deb.

       -d, --debug
              Outputs even more info than the -v option. This is mainly for debugging.

       --help Outputs the usage information for the program.

       --version
              Outputs the version information for the program. This includes the policy format version. This option does  not  require  any  other
              arguments.

       --list-policies
              Outputs  a list of the policies that passed the Selection phase of the verification process. In other words, those that could poten‐
              tially verify the deb. The output is one line showing the directory selected by the origin signature, and then a single line for any
              policy files in that directory that pass the Selection rules. This option will NOT verify the deb.

       --use-policy policy
              This  option takes one argument, which is the name of the policy file (as shown by the --list-policies option). Note, this is just a
              file, and not a full path. You cannot specify arbitrary policies.  This option is useful if more than one policy applies  to  poten‐
              tially verifying the deb. The program will then use this policy, and only this policy, to try and verify the deb.

       --policies-dir directory
              Use a different directory when looking up for policies.

       --keyrings-dir directory
              Use a different directory when looking up for keyrings.

       --root directory
              Use a different root directory when looking up for policies and keyrings.

EXIT STATUS
       0      The requested operation completed successfully.

       1      General non-success exit value. This occurs for non-verification operations.

       10     Either no signatures are contained in the deb or no origin signature was found.

       11     An origin signature was found, but it does not have a corresponding subdirectory in the policies directory.

       12     The origin was found, and is present. However, no policies were found that passed the selection phase of the process. Thus, no veri‐
              fication was performed.

       13     The package failed the verification phase of the process. More than likely, this occurs due to a bad signature, or because  not  all
              criteria of the verification block of the policy were passed.

       14     An  internal  error occurred. This is an unrecoverable error. Either the deb is corrupt, gpg failed abnormally, or some other uncon‐
              trollable failure.

ENVIRONMENT
       DEBSIG_GNUPG_PROGRAM
              The name (or pathname) of the GnuPG program to use.

FILES
       /etc/debsig/policies/
              Directory containing the policy (.pol) definitions.

       /etc/debsig/policies/*/*.pol
              XML format policy files.

       /usr/share/debsig/keyrings/
              Directory containing the keyrings that coincide with the policies.

       /usr/share/debsig/keyrings/*/*.gpg
              GnuPG format keyrings for use by the policies.

SEE ALSO
       debsigs(1), gpg(1), deb(5).

AUTHOR
       Ben Collins <bcollins@debian.org>

0.14                                                                                                                              debsig-verify(1)
