selabel_lookup(3)                                                                         SELinux API documentation                                                                         selabel_lookup(3)



NAME
       selabel_lookup - obtain SELinux security context from a string label

SYNOPSIS
       #include <selinux/selinux.h>
       #include <selinux/label.h>

       int selabel_lookup(struct selabel_handle *hnd,
                          char **context,
                          const char *key, int type);

       int selabel_lookup_raw(struct selabel_handle *hnd,
                              char **context,
                              const char *key, int type);

DESCRIPTION
       selabel_lookup() performs a lookup operation on the handle hnd, returning the result in the memory pointed to by context, which must be freed by the caller using freecon(3).  The key and type param‐
       eters are the inputs to the lookup operation and are interpreted according to the specific backend that handle is open on.

       selabel_lookup_raw() behaves identically to selabel_lookup() but does not perform context translation.

RETURN VALUE
       On success, zero is returned.  On error, -1 is returned and errno is set appropriately.

ERRORS
       ENOENT No context corresponding to the input key and type was found.

       EINVAL The key and/or type inputs are invalid, or the context being returned failed validation.

       ENOMEM An attempt to allocate memory failed.

AUTHOR
       Eamon Walsh <ewalsh@tycho.nsa.gov>

SEE ALSO
       selabel_open(3), selabel_stats(3), selinux_set_callback(3), selinux(8)



                                                                                                 18 Jun 2007                                                                                selabel_lookup(3)
