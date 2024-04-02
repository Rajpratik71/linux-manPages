RCSFREEZE(1)                                                                               General Commands Manual                                                                               RCSFREEZE(1)



NAME
       rcsfreeze - freeze a configuration of sources checked in under RCS

SYNOPSIS
       rcsfreeze [name]

DESCRIPTION
       rcsfreeze assigns a symbolic revision number to a set of RCS files that form a valid configuration.

       The idea is to run rcsfreeze each time a new version is checked in.  A unique symbolic name (C_number, where number is increased each time rcsfreeze is run) is then assigned to the most recent revi‐
       sion of each RCS file of the main trunk.

       An optional name argument to rcsfreeze gives a symbolic name to the configuration.  The unique identifier is still generated and is listed in the log file but it will not appear as part of the  sym‐
       bolic revision name in the actual RCS files.

       A log message is requested from the user for future reference.

       The shell script works only on all RCS files at one time.  All changed files must be checked in already.  Run rcsclean(1) first and see whether any sources remain in the current directory.

FILES
       RCS/.rcsfreeze.ver
              version number

       RCS/.rcsfreeze.log
              log messages, most recent first

ENVIRONMENT
       RCSINIT
              Options prepended to the argument list, separated by spaces.  A backslash escapes spaces within an option.  The RCSINIT options are prepended to the argument lists of most RCS commands.  Use‐
              ful RCSINIT options include -q, -V, -x, and -z.

       RCS_MEM_LIMIT
              An integer lim, measured in kilobytes, specifying the threshold under which commands will try to use memory-based operations for processing the RCS file.  (For RCS files of size lim kilobytes
              or greater, RCS will use the slower standard input/output routines.)  Default value is 256.

       TMPDIR Name  of  the  temporary  directory.   If  not  set, the environment variables TMP and TEMP are inspected instead and the first value found is taken; if none of them are set, a host-dependent
              default is used, typically /tmp.

AUTHOR
       Stephan v. Bechtolsheim

SEE ALSO
       co(1), rcs(1), rcsclean(1), rlog(1).

       Walter F. Tichy, RCSA System for Version Control, SoftwarePractice & Experience 15, 7 (July 1985), 637-654.

       The full documentation for RCS is maintained as a Texinfo manual.  If the info(1) and RCS programs are properly installed at your site, the command

              info rcs

       should give you access to the complete manual.  Additionally, the RCS homepage:

              http://www.gnu.org/software/rcs/

       has news and links to the latest release, development site, etc.

BUGS
       rcsfreeze does not check whether any sources are checked out and modified.

       Although both working and RCS file names are accepted, they are not paired as usual with RCS commands.

       Error checking is rudimentary.

       rcsfreeze is just an optional example shell script, and should not be taken too seriously.  See CVS for a more complete solution.



GNU RCS 5.9.0                                                                                     2014-06-10                                                                                     RCSFREEZE(1)
