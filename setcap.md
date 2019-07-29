SETCAP(8)                  System Manager's Manual                  SETCAP(8)

NAME
       setcap - set file capabilities

SYNOPSIS
       setcap  [-q]  [-v]  (capabilities|-|-r)  filename  [ ... capabilitiesN
       fileN ]

DESCRIPTION
       In the absence of the -v (verify) option setcap sets the  capabilities
       of  each  specified  filename  to  the capabilities specified.  The -v
       option is used to verify that the specified capabilities are currently
       associated with the file.

       The   capabilities   are   specified   in   the   form   described  in
       cap_from_text(3).

       The special capability string, '-', can be used to indicate that capa‐
       bilities are read from the standard input. In such cases, the capabil‐
       ity set is terminated with a blank line.

       The special capability string, '-r', is used to  remove  a  capability
       set from a file.

       The -q flag is used to make the program less verbose in its output.

EXIT CODE
       The  setcap  program  will  exit  with a 0 exit code if successful. On
       failure, the exit code is 1.

SEE ALSO
       cap_from_text(3), cap_set_file(3), getcap(8)

                              24th October 2008                     SETCAP(8)
