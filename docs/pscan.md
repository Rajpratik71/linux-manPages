PSCAN(1)                                                      General Commands Manual                                                     PSCAN(1)

NAME
       pscan - Format string security checker for C source code

SYNOPSIS
       pscan [options]

DESCRIPTION
       pscan  is  a  source  code  analysis tool which is designed to highlight potentially dangerous uses of variadic functions such as "printf",
       "syslog", etc.  The scan works by looking for a one of a list of problem functions, and applying the following rule:

       IF the last parameter of the function is the format string, AND the format string is NOT a static string, THEN complain.

LIMITATIONS
       The code will not report on some potention buffer overflows, because that is not its goal. For example the following code is potential dan‐
       gerous:

         sprintf(static_buffer,  %s/.foorc", getenv("HOME"));"

       This  code  could  cause  an issue as there is no immediately obvious bounds checking. However this is a safe usages with regards to format
       strings.

RETURN VALUES
       If there are any errors found, pscan exits with status 1.

AUTHOR
       Alan DeKok <aland@ox.org>

                                                                                                                                          PSCAN(1)
