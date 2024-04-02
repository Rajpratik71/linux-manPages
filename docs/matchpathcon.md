matchpathcon(8)                                                                       SELinux Command Line documentation                                                                      matchpathcon(8)



NAME
       matchpathcon - get the default SELinux security context for the specified path from the file contexts configuration

SYNOPSIS
       matchpathcon [-V] [-N] [-n] [-m type] [-f file_contexts_file] [-p prefix] [-P policy_root_path] filepath...

DESCRIPTION
       matchpathcon queries the system policy and outputs the default security context associated with the filepath.

       Note: Identical paths can have different security contexts, depending on the file type (regular file, directory, link file, char file ...).

       matchpathcon will also take the file type into consideration in determining the default security context if the file exists.  If the file does not exist, no file type matching will occur.

OPTIONS
       -m type
              Force file type for the lookup.  Valid types are file, dir, pipe, chr_file, blk_file, lnk_file, sock_file.

       -n     Do not display path.

       -N     Do not use translations.

       -f file_context_file
              Use alternate file_context file

       -p prefix
              Use prefix to speed translations

       -P policy_root_path
              Use alternate policy root path

       -V     Verify file context on disk matches defaults

AUTHOR
       This manual page was written by Dan Walsh <dwalsh@redhat.com>.

SEE ALSO
       selinux(8), matchpathcon(3)



dwalsh@redhat.com                                                                               21 April 2005                                                                                 matchpathcon(8)
