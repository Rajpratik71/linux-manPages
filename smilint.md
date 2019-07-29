smilint(1)                                                           SMI Tools                                                          smilint(1)

NAME
       smilint - syntax and semantic checks of SMIv1/v2 and SPPI modules

SYNOPSIS
       smilint [ -Vhersm ] [ -c file ] [ -p module ] [ -l level ] [ -i error-pattern ] module(s)

DESCRIPTION
       The smilint program is used to check MIB or PIB modules for syntax errors and semantics at some degree.  SMIv1/v2 style MIB modules as well
       as SPPI PIB modules are supported.

       The rules that smilint is based on are taken from RFC 1155, RFC 1212 and RFC 1215 for SMIv1, RFCs 2578-2580 for SMIv2, RFC 3159 for SPPI.

OPTIONS
       -V, --version
              Show the smilint version and exit.

       -h, --help
              Show a help text and exit.

       -e, --error-list
              Show a list of all known error messages and exit. Error messages can have associated tags, shown in braces at the end of each  line.
              The tags can be used with the -i option to ignore certain error messages.

       -r, --recursive
              Report errors and warnings also for recursively imported modules.

       -s, --severity
              Show the error severity in brackets before error messages.

       -m, --error-names
              Show the error names in braces before error messages.

       -c file, --config=file
              Read file instead of any other (global and user) configuration file.

       -p module, --preload=module
              Preload  the module module before reading the main module(s). This may be helpful if an incomplete main module misses to import some
              definitions.

       -l level, --level=level
              Report errors and warnings up to the given severity level.  See below for a description of the error levels. The default error level
              is 3.

       -i prefix, --ignore=prefix
              Ignore  all  errors  that  have  a  tag  which matches prefix.  A list of error tags can be retrieved by calling smilint with the -e
              option.

       module(s)
              These are the modules to be checked. If a module argument represents a path name (identified by containing at least one dot or slash
              character),  this  is  assumed  to  be  the exact file to read. Otherwise, if a module is identified by its plain module name, it is
              searched according to libsmi internal rules. See smi_config(3) for more details.

ERROR AND WARNING LEVELS
       All generated error and warning messages have an associated severity level.  The actual severity levels are:

       0  Internal error, no recovery possible. Examples are memory allocation failures. Errors of this level usually  cause  the  application  to
          abort.

       1  Major SMI/SPPI error, recovery somehow possible but may lead to severe problems. Examples are lexically unexpected characters or unknown
          keywords. Errors of this kind usually lead to follow-on errors.

       2  SMI/SPPI error which is probably tolerated by some implementations. Examples are MIB/PIB modules which  mix  constructs  from  different
          SMI/SPPI versions.

       3  SMI/SPPI error which is likely tolerated by many implementations. Examples are misplaced SMIv2 MODULE-IDENTITY invocations or SMIv2 tex‐
          tual conventions derived from other textual conventions.

       4  Something which is not strictly an error but which is recommended to be changed. Warnings of this level are  usually  considered  during
          MIB reviews.

       5  Something  that  is  basically  correct  but might be problematic in certain environments or usage scenarios. Examples are warnings that
          identifiers only differ in case or that type definitions are not used within the defining module.

       6  Messages of this level are auxiliary notices. Examples are messages that point to a previous definition in case of a redefinition.

       Higher levels are currently not used and lead to the same effects as level 6 does. Note that errors up to level 3 are errors violating  the
       specifications  and must be fixed by the responsible author. The warnings generated with level 4 should be considered during normal MIB/PIB
       reviews.

EXAMPLE
       This example checks the file RMON2-MIB in the current directory (note that the `./' prefix ensures this). The error level is  raised  to  6
       and warnings that claim about identifier names that exceed a length of 32 characters are suppressed.

         $ smilint -l 6 -i namelength-32 ./RMON2-MIB
         ./RMON2-MIB:3935: unexpected type restriction
         ./RMON2-MIB:3936: unexpected type restriction
         ./RMON2-MIB:3937: unexpected type restriction
         ./RMON2-MIB:3938: unexpected type restriction
         ./RMON2-MIB:3939: unexpected type restriction
         ./RMON2-MIB:3940: unexpected type restriction
         ./RMON2-MIB:4164: scalar object must not have a `read-create' access value

SEE ALSO
       The  libsmi(3)  project  is  documented  at  http://www.ibr.cs.tu-bs.de/projects/libsmi/.  Other commonly used MIB checkers are mosy(1) and
       smicng(1).

AUTHORS
       (C) 1999-2004 F. Strauss, TU Braunschweig, Germany <strauss@ibr.cs.tu-bs.de>
       (C) 1999-2002 J. Schoenwaelder, TU Braunschweig, Germany <schoenw@ibr.cs.tu-bs.de>
       (C) 2002-2003 J. Schoenwaelder, University of Osnabrueck, Germany
       (C) 2003-2004 J. Schoenwaelder, International University Bremen, Germany
       (C) 2001-2002 T. Klie, TU Braunschweig, Germany <tklie@ibr.cs.tu-bs.de>
       (C) 2002 M. Bunkus, TU Braunschweig, Germany <bunkus@ibr.cs.tu-bs.de>
       and contributions by many other people.

IBR                                                               August 10, 2004                                                       smilint(1)
