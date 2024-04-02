selabel_partial_match(3)                                                                  SELinux API documentation                                                                  selabel_partial_match(3)



NAME
       selabel_partial_match - determine whether a direct or partial match is possible on a file path - Only supported on file backend.

SYNOPSIS
       #include <stdbool.h>
       #include <selinux/selinux.h>
       #include <selinux/label.h>

       bool selabel_partial_match(struct selabel_handle *hnd,
                                 const char *key);

DESCRIPTION
       selabel_partial_match() performs a partial match operation on the handle hnd, returning TRUE or FALSE.  The key parameter is a file path to check for a direct or partial match.


RETURN VALUE
       TRUE is returned if a direct or partial match is found, FALSE if not.


SEE ALSO
       selabel_open(3), selabel_stats(3), selinux_set_callback(3), selinux(8), selabel_file(5)



Security Enhanced Linux                                                                          05 May 2015                                                                         selabel_partial_match(3)
