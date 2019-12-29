PO2DEBCONF(1)                                 po-debconf                                 PO2DEBCONF(1)

NAME
       po2debconf - merge master templates file and PO files

SYNOPSIS
       po2debconf [-v] [-h] [--podir=DIR] [-o FILE] [-e STRING] master

DESCRIPTION
       This program reads all PO files and a single templates file, and produces a Debconf templates
       file containing all translations, similar to the one produced by debconf-mergetemplate(1) (from
       the "debconf-utils" package).  PO files are by default searched in the po subdirectory below
       the location of the master file.

       To help the language code transition for Norwegian Bokmål, the no and nb language codes are
       handled specially.  If no.po exists, it should be renamed to nb.po.  Using nb.po will make both
       "-no" and "-nb" translations available in the templates file.

       Lines beginning with a number sign ("#") are comments in templates files.  They are useful to
       give hints to translators, and are discarded by po2debconf.  Special comments have been
       introduced in "po-debconf" 1.0.  They are in the form "#flag:directive".  The "#flag:partial"
       is the only directive interpreted by po2debconf.  Normally when a field is composed of several
       paragraphs (like "__Choices" and "_Description"), it is translated if all paragraphs are
       translated.  When a field contains "#flag:partial", translated strings may be mixed with
       untranslated strings.

OPTIONS
       -h, --help
           Display a usage summary and exit.

       -v, --verbose
           Process in verbose mode.

       --podir=DIR
           Set directory for PO files.  Default is to search PO files in the po subdirectory below the
           location of the master file.

       -o, --output=FILE
           Set output filename (default is standard output).

       -e, --encoding=STRING
           Convert encoding.  Argument can take 3 values: "utf8" (convert to UTF-8), "po" (do not
           change encoding) and "popular" (convert encoding of input files depending on their
           language; the "PODEBCONF_ENCODINGS" environment variable must point to a name of a file
           containing the encoding map).

           Such a filename looks like:

             #
             #   Number is comment sign
             #
             cs       ISO-8859-2
             da       ISO-8859-1
             de       ISO-8859-1
             el       ISO-8859-7

           etc.

           Default encoding used to be "popular", and has been switched to "utf8" since po-debconf
           0.9.0.

OUTPUT FORMAT
       Since debconf 1.2.0, templates format has changed, encoding is part of field names, i.e. they
       are "foo-lang.encoding".  When older debconf encounter such fields, they are silently ignored,
       which means that original text is displayed.

       If present, a po/output file can override defaults for encoding and output format.  It contains
       a single line with two fields. The first field is the output format (currently valid values are
       1 for fields in the form "foo-lang", and 2 for "foo-lang.encoding") and the second field is the
       encoding, e.g.

          echo '2 utf8' > po/output

       let po2debconf convert text to UTF-8.

       When encoding is set to "po" or "utf8", output format is always set to 2, so that older debconf
       do not try to display text with wrong encodings.

SEE ALSO
       debconf-gettextize(1), debconf-updatepo(1), po-debconf(7).

AUTHOR
         Denis Barbier <barbier@linuxfr.org>

                                              2018-11-20                                 PO2DEBCONF(1)
