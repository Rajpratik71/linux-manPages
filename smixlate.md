smixlate(1)                                                          SMI Tools                                                         smixlate(1)

NAME
       smixlate - translate SMI/SPPI identifiers

SYNOPSIS
       smixlate [ -Vhm ] [ -c file ] [ -p module ] [ -l level ] module(s)

DESCRIPTION
       The smixlate program is used to translate identifiers and especially OIDs into a more human readable format.

OPTIONS
       -V, --version
              Show the smixlate version and exit.

       -h, --help
              Show a help text and exit.

       -r, --recursive
              Report errors and warnings also for recursively imported modules.

       -c file, --config=file
              Read file instead of any other (global and user) configuration file.

       -p module, --preload=module
              Preload  the module module before reading the main module(s). This may be helpful if an incomplete main module misses to import some
              definitions.

       -l level, --level=level
              Report errors and warnings up to the given severity level. See the smilint(1) manual page for a description of the error levels. The
              default error level is 3.

       -a, --all
              Replace  all  OIDs including OID prefixes. Without this option, smixlate will only translate OIDs with a corresponding notification,
              scalar, column, row, or table definition.

       -f, --format
              Preserve the input format as much as possible by inserting/removing white space characters.

       module(s)
              These are the modules to be loaded for the subsequent translation. If a module argument represents a path name (identified  by  con‐
              taining  at least one dot or slash character), this is assumed to be the exact file to read. Otherwise, if a module is identified by
              its plain module name, it is searched according to libsmi internal rules. See smi_config(3) for more details.

EXAMPLE
       This example translates numeric OIDs in the input text into a more human readable format.

         $ echo "what is this oid? 1.3.6.1.2.1.2.2.1.3" |
           ./smixlate -l 0 /usr/local/share/mibs/ietf/*
         what is this oid? ifType
         $

SEE ALSO
       The libsmi(3) project is documented at http://www.ibr.cs.tu-bs.de/projects/libsmi/.

AUTHORS
       (C) 2006-2006 J. Schoenwaelder, International University Bremen, Germany
       and contributions by many other people.

IUB                                                                June 18, 2006                                                       smixlate(1)
