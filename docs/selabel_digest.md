selabel_digest(3)                                                                         SELinux API documentation                                                                         selabel_digest(3)



NAME
       selabel_digest - Return digest of specfiles and list of files used

SYNOPSIS
       #include <selinux/selinux.h>
       #include <selinux/label.h>

       int selabel_digest(struct selabel_handle *hnd,
                          unsigned char **digest, size_t *digest_len,
                          char ***specfiles, size_t *num_specfiles);

DESCRIPTION
       selabel_digest()  performs  an  operation  on  the handle hnd, returning the results of the SHA1 digest pointed to by digest, whose length will be digest_len.  The list of specfiles used in the SHA1
       digest calculation is returned in specfiles with the number of entries in num_specfiles.

       To enable selabel_digest() to return this information the SELABEL_OPT_DIGEST option must be enable in selabel_open(3).

       The result of selabel_digest() must not be used after selabel_close(3).

RETURN VALUE
       On success, zero is returned.  On error, -1 is returned and errno is set appropriately.

ERRORS
       EINVAL No digest available (returned if SELABEL_OPT_DIGEST option not enabled).

       ENOMEM An attempt to allocate memory failed.

SEE ALSO
       selabel_open(3), selinux(8)



                                                                                                 16 Sept 2015                                                                               selabel_digest(3)
