IDNCONV(1)                                                                                 General Commands Manual                                                                                 IDNCONV(1)



NAME
       idnconv - codeset converter for named.conf and zone master files

SYNOPSIS
       idnconv [options..] [file...]

DESCRIPTION
       idnconv  is a codeset converter for named configuration files and zone master files.  idnconv performs codeset conversion specified either by the command-line arguments or by the configuration file,
       and writes the converted text to stdout.

       If file name is specified, idnconv converts the contents of the file.  Otherwise, idnconv converts stdin.

       Since idnconv is specifically designed for converting internatinalized domain names, it may not be suitable as a general codeset converter.

OPERATION MODES
       idnconv has two operation modes.

       One is a mode to convert local-encoded domain names to IDN-encoded one.  Usually this mode is used for preparing domain names to be listed in named configuration files or zone master files.  In this
       mode, the following processes are performed in addition to the codeset (encoding) conversion.

         - local mapping

         - standard domain name preperation (NAMEPREP)

       The other mode is a reverse conversion, from IDN-encoded domain name to local-encoded domain names.  In this mode, local mapping and NAMEPREP are not performed since IDN-encoded names should already
       be normalized.  Instead, a check is done in order to make sure the IDN-encoded domain name is properly NAMEPREP'ed.  If it is not, the name will be output in IDN encoding, not in the local encoding.

OPTIONS
       Normally idnconv reads system's default configuration file (idn.conf) and performs conversion or name preparation according to the parameters specified in the file.  You can override the setting  in
       the configuration file by various command line options below.

       -in in-code, -i in-code
           Specify the codeset name of the input text.  Any of the following codeset names can be specified.

           · Any codeset names which iconv_open() library function accepts

           · Punycode

           · UTF-8

           · Any alias names for the above, defined by the codeset alias file.

           If  this  option  is not specified, the default codeset is determined from the locale in normal conversion mode.  In reverse conversion mode, the default codeset is the IDN encoding specified by
           the configuration file (``idn-encoding'' entry).

       -out out-code, -o out-code
           Specify the codeset name of the output text. out-code can be any codeset name that can be specified for -in option.

           If this option is not specified, the default is the IDN encoding specified by the configuration file (``idn-encoding'' entry) in normal conversion mode.  In reverse conversion mode, the  default
           codeset is determined from the locale.

       -conf path, -c path
           Specify the pathname of idnkit configuration file (``idn.conf'').  If not specified, system's default file is used, unless -noconf option is specified.

       -noconf, -C
           Specify that no configuration file is to be used.

       -reverse, -r
           Specify reverse conversion mode.
           If this option is not specified, the normal conversion mode is used.

       -nameprep version, -n version
           Specify the version of NAMEPREP.  The following is a list of currently available versions.

           RFC3491
               Perform NAMEPREP according to the RFC3491 ``rfc-3491.txt''.

       -nonameprep, -N
           Specify to skip NAMEPREP process (or NAMEPREP verification process in the reverse conversion mode).  This option implies -nounassigncheck and -nobidicheck.

       -localmap map
           Specify the name of local mapping rule.  Currently, following maps are available.

           RFC3491
               Use the list of mappings specified by RFC3491.

           filemap:path
               Use list of mappings specified by mapfile path.  See idn.conf(5) for the format of a mapfile.

           This option can be specified more than once.  In that case, each mapping will be performed in the order of the specification.

       -nounassigncheck, -U
           Skip unassigned codepoint check.

       -nobidicheck, -B
           Skip bidi character check.

       -nolengthcheck
           Do not check label length of normal conversion result.  This option is only meaningful in the normal conversion mode.

       -noasciicheck, -A
           Do not check ASCII range characters.  This option is only meaningful in the normal conversion mode.

       -noroundtripcheck
           Do not perform round trip check.  This option is only meaningful in the reverse conversion mode.

       -delimiter codepoint
           Specify the character to be mapped to domain name delimiter (period).  This option can be specified more than once in order to specify multiple characters.
           This option is only meaningful in the normal conversion mode.

       -whole, -w
           Perform  local  mapping, nameprep and conversion to output codeset for the entire input text.  If this option is not specified, only non-ASCII characters and their surrounding texts will be pro-
           cessed.  See ``NORAML CONVERSION MECHANISM'' and ``REVERSE CONVERSION MECHANISM'' for details.

       -alias path, -a path
           Specify a codeset alias file.  It is a simple text file, where each line has a pair of alias name and real name separated by one or more white spaces like below:

               alias-codeset-name    real-codeset-name

           Lines starting with ``#'' are treated as comments.

       -flush
           Force line-buffering mode.

       -version, -v
           Print version information and quit.

LOCAL CODESET
       idnconv guesses local codeset from locale and environment variables.  See the ``LOCAL CODESET'' section in idn.conf(5) for more details.

NORMAL CONVERSION MECHANISM
       idnconv performs conversion line by line.  Here describes how idnconv does its job for each line.

       1. read a line from input text

       2. convert the line to UTF-8
           idnconv converts the line from local encoding to UTF-8.

       3. find internationalized domain names
           If the -whole (or -w) option is specified, the entire line is assumed as an internationalized domain name.  Otherwise, idnconv recognizes any character sequences having the following  properties
           in the line as internationalized domain names.

           · containing at least one non-ASCII character, and

           · consisting of legal domain name characters (alphabets, digits, hypens), non-ASCII characters and period.

       4. convert internationalized domain names to ACE
           For each internationalized domain name found in the line, idnconv converts the name to ACE.  The details about the conversion procedure is:

           4.1. delimiter mapping
               Substibute certain characters specified as domain name delimiter with period.

           4.2. local mapping
               Perform  local  mapping.   If the local mapping is specified by command line option -localmap, the specified mapping rule is applied.  Otherwise, find the mapping rule from the configuration
               file which matches to the TLD of the name, and perform mapping according to the matched rule.
               This step is skipped if the -nolocalmap (or -L) option is specified.

           4.3. NAMEPREP
               Perform name preparation (NAMEPREP).  Mapping, normalization, prohibited character checking, unassigned codepoint checking, bidirectional character checking are done in that order.   If  the
               prohibited character check, unassigned codepoint check, or bidi character check fails, the normal conversion procedure aborts.
               This step is skipped if the -nonameprep (or -N) option is specified.

           4.4. ASCII character checking
               Checks  ASCII  range  character  in  the domain name.  the normal conversion procedure aborts, if the domain name has a label beginning or end with hyphen (U+002D) or it contains ASCII range
               character except for alphanumeric and hyphen,
               This step is skipped if the -noasciicheck (or -A) option is specified.

           4.5. ACE conversion
               Convert the string to ACE.

           4.6. label length checking
               The normal conversion procedure aborts, if the domain name has an empty label or too long label (64 characters or more).
               This step is skipped if the -nolengthcheck option is specified.

       5. output the result

REVERSE CONVERSION MECHANISM
       This is like the normal conversion mechanism, but they are not symmetric.  idnconv does its job for each line.

       1. read a line from input text

       2. convert the line to UTF-8
           idnconv converts the line from local encoding to UTF-8.

       3. find internationalized domain names
           If the -whole (or -w) option is specified, the entire line is assumed as an internationalized domain name.  Otherwise, idnconv decodes any valid ASCII domain names including  ACE  names  in  the
           line.

       4. convert domain names to local encoding
           Then, idnconv decodes the domain names.  The decode procedure consists of the following steps.

           4.1. Delimiter mapping
               Substibute certain characters specified as domain name delimiter with period.

           4.2. NAMEPREP
               Perform name preparation (NAMEPREP) for each label in the domain name.  Mapping, normalization, prohibited character checking, unassigned codepoint checking, bidirectional character checking
               are done in that order.  If the prohibited character check, unassigned codepoint check, or bidi character check fails, disqualified labels are restored to original input strings and  further
               conversion on those labels are not performed.
               This step is skipped if the -nonameprep (or -N) option is specified.

           4.3. ACE conversion
               Convert the string from ACE to UTF-8.

           4.4. Round trip checkning
               For  each  label, perform the normal conversion and compare it with the result of the step 4.2.  This check succeeds, if they are equivalent strings.  In case of failure, disqualified labels
               are restored to original input strings and further conversion on those labels are not performed.
               This step is skipped if the -noroundtripcheck option is specified.

           4.5. local encoding conversion
               Convert the result of the step 4.3. from UTF-8 to local encoding.  If a label in the domain name contains a character which cannot be represented in the local encoding, the label is restored
               to the original input string.

       5. output the result

FILE MANAGEMENT
       Maybe  the  best way to manage named.conf or zone master files that contains internationalized domain name is to keep them in your local codeset so that they can be edited with your favorite editor,
       and generate a version in the IDN encoding using idnconv.

       `make' is a convenient tool for this purpose.  Suppose the local codeset version has suffix `.lc', and its ACE version has suffix `.ace'.  The following Makefile enables you to generate ACE  version
       from local codeset version by just typing `make'.

           .SUFFIXES: .lc .ace
           .lc.ace:
                idnconv -in $(LOCALCODE) -out $(IDNCODE) \
                    $(IDNCONVOPT) $< > $@

           LOCALCODE = EUC-JP
           IDNCODE = Punycode
           IDNCONVOPT =

           DESTFILES = db.zone1.ace db.zone2.ace

           all: $(DESTFILES)

SEE ALSO
       idn.conf(5), iconv(3)

BUGS
       The automatic input-code selection depends on your system, and sometimes it cannot guess or guess wrong.  It is better to explicitly specify it using -in option.



                                                                                                 Mar 3, 2001                                                                                       IDNCONV(1)
