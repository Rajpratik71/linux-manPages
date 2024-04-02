TIGEXP(8)                                                     Administrator Commands                                                     TIGEXP(8)

NAME
       tigexp - UNIX Security Checker Explanation Generator

SYNOPSIS
       tigexp msgid [msgid[msgid...]]

       tigexp [-f|-F] [security_report]

DESCRIPTION
       Tigexp is used to generate explanations of the output from the Tiger security checking package.  In the first form, tigexp will generate an
       explanation of each of the message ids listed.  In the second form, the security report specified will be scanned and  explanations  gener‐
       ated.  The -f option will generate one explanation for each unique message id in the security report, whereas the -F option will output the
       security report with explanations inserted after each entry in the report.

       There are five different message levels produced by Tiger. Each of the message levels is the last letter of the message id. The levels are:

       ALERT  A message of this level indicates that Tiger has detected a possible intrusion attempt or  troublesome  misconfiguration  which  can
              expose the whole system to attacks.

       FAIL   Messages of this level indicate a violation of a generic security policy or a possible intrusion. Appropriate action should be taken
              to fix this security issue.

       WARN   Messages of this level indicate a security issue which should be checked further and might  indicate  a  probable  vulnerability  or
              exposure. Most Tiger messages appear in this category.

       INFO   These  includes  information messages which are not necessarily a security violation but might be useful for the administrator. Note
              that the tigerrc configuration file through the Tiger_Show_INFO_Msgs option determines whether or not Tiger shows these  items.  The
              default behaviour is to not show them.

       ERROR  These  messages are errors in the execution of Tiger (or any of its scripts), this is probably due to a misconfiguration in the pro‐
              gram, because of a problem in the installation or because a file needed for the test is missing. The script who outputs  this  error
              should be investigated further.

       CONFIG Messages with this level inform of stages in the configuration process of Tiger. They are not errors (otherwise ERROR would be used)
              but notices for the user running the program explaining, for example, which configuration might be used.

   OPTIONS
       -f     Scan the indicated security report and generate explanations of it.  One explanation will be generated for each unique message id in
              the security report.  If the name of a security report is not given, then the report is read from stdin.

       -F     Output the indicated security report with explanations inserted after each entry in the report.  If the name of a security report is
              not given, then the report is read from stdin.

FILES
       $TIGERHOMEDIR/doc/explain.idx

SEE ALSO
       tiger(8)

BUGS
       If the explanation index is out of date, it doesn't recognize it and generates junk.

Security                                                          12 August 2003                                                         TIGEXP(8)
