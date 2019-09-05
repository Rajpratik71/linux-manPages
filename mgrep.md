MGREP(1)                                                                                   General Commands Manual                                                                                   MGREP(1)



NAME
       mgrep - search mimencoded files for a regular expression

SYNOPSIS
       mgrep [ grep_options ] [ -e ] pattern filename...

DESCRIPTION
       Mgrep  is  used to invoke the grep on mimencoded files. All options specified are passed directly to grep.  If no file is specified, then the standard input is mimdecoded and fed to grep.  Otherwise
       the given files are mimdecoded and fed to grep.

       If mgrep is invoked as megrep or mfgrep then egrep or fgrep is used instead of grep.  If the GREP environment variable is set, mgrep uses it as the grep program to be invoked. For example:

           for sh:  GREP=fgrep  mgrep string files
           for csh: (setenv GREP fgrep; mgrep string files)

SEE ALSO
       grep(1), egrep(1), fgrep(1)



                                                                                                                                                                                                     MGREP(1)
