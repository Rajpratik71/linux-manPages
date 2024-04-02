sefcontext_compile(8)                                                                 SELinux Command Line documentation                                                                sefcontext_compile(8)



NAME
       sefcontext_compile - compile file context regular expression files

SYNOPSIS
       sefcontext_compile [-o outputfile] [-p policyfile] inputfile

DESCRIPTION
       sefcontext_compile is used to compile file context regular expressions into pcre(3) format.

       The compiled file is used by libselinux file labeling functions.

       By default sefcontext_compile writes the compiled pcre file with the .bin suffix appended (e.g. inputfile.bin).

OPTIONS
       -o     Specify an outputfile that must be a fully qualified file name as the .bin suffix is not automatically added.

       -p     Specify a binary policyfile that will be used to validate the context entries in the inputfile
              If an invalid context is found the pcre formatted file will not be written and an error will be returned.


RETURN VALUE
       On error -1 is returned.  On success 0 is returned.


EXAMPLES
       Example 1:
       sefcontext_compile /etc/selinux/targeted/contexts/files/file_contexts

       Results in the following file being generated:
              /etc/selinux/targeted/contexts/files/file_contexts.bin

       Example 2:
       sefcontext_compile -o new_fc.bin /etc/selinux/targeted/contexts/files/file_contexts

       Results in the following file being generated in the cwd:
              new_fc.bin

AUTHOR
       Dan Walsh, <dwalsh@redhat.com>

SEE ALSO
       selinux(8), semanage(8),



dwalsh@redhat.com                                                                                12 Aug 2015                                                                            sefcontext_compile(8)
