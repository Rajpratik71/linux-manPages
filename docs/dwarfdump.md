DWARFDUMP()                                                                                                                            DWARFDUMP()

NAME
       dwarfdump - dumps DWARF debug information of an ELF object

SYNOPSIS
       dwarfdump [options] objectfilename

DESCRIPTION
       The dwarfdump command prints or checks DWARF sections as requested by specific options.  With no options (but with the required objectfile‐
       name ) all sections print (but some sections cannot be printed independently safely, so  those  are  only  printed  at  offsets  where  the
       .debug_info section refers to those sections).

       As  of June 2011 the printing options and the checking options are mutually exclusive (if checking options are selected the section details
       are not printed).   When errors are encountered dwarfdump does attempt to print sufficient context so that one can understand exactly where
       the error is in the DWARF.  This change makes checking really large object files much easier.

       The format is intended to be human readable.  If a script is to parse the output, the -d option is useful.

       Not all sections actually exist in any given object file.

       The format may change from release to release, so it is unwise to depend too heavily on the format.

       Frame  information (.debug_frame and .eh_frame) is heavily dependent on the ABI/ISA of the object file.  By default we use a generic set of
       register names handling up to 100 registers named r0-100.  The '-R' option uses a built-in generic register name set handling  up  to  1200
       registers  named  r0-r1199.   The  '-x abi=<abi>' description below shows how to name an abi and use that to guide the -f or -F processing.
       Unless the cpu for the object file being dumped has many registers, do not use -R or -x abi=generic as those can be needlessly slow dumping
       frame  sections. Instead, use the correct abi (if it exists in dwarfdump.conf) or a generic such as -x abi=generic100 or -x abi=generic500.
       To get MIPS/IRIX register names names and call the old version 2 libdwarf frame interface use the option '-x abi=mips'.   Without  '-R'  or
       '-x  abi=<abi>'  dwarfdump  ignores  the dwarfdump.conf file and uses compiled-in generic set of register names.  If no '-x name=<path>' is
       given, dwarfdump looks for "./dwarfdump.conf", "$HOME/.dwarfdump.conf", "<install-prefix>/lib/dwarfdump.conf" and takes the first it finds.
       If one or more '-x name=<path>' is given the last of these is used and all other such files are ignored.

       Some  -k  (checking)  options  print so-called harmless errors.  These are compiler errors that do not cause any known problem and are only
       detected inside libdwarf itself.  These are difficult to properly report in dwarfdump and any error strings may not  appear  close  to  the
       time the error was encountered.

URI STYLE INPUT STRINGS
       The  <objectfilename>  and  the  options  taking name strings look for URIs and translate the URI strings to characters by default (see -x,
       -c<compiler name>, -S, -u).  So any single % character is treated as if the following two characters are hex digits representing the under‐
       lying  true character.  Various characters are meaningful to shells (such as bash or sh) and to getopt (such as the space character) If the
       URI translation does anything it prints the before and after of the URI translation on standard output, so inspection of the first lines of
       output  will  show  if URI did anything.  The actual options themselves are assumed to be non-URI.  So in the option '-cS&T' the -c portion
       must be non-URI, but the & character might cause input issues so '-cS%26T' could be used instead.  To actually input a single  %  character
       (in a name, for example), double it to %% on the command line.

       Options  -U  (turning off URI interpretation) and -q (making finding URI sequences silent) give finer control of URI interpretation.  PP As
       an example, to get a string'a b' make the string 'a%20b' (here the quote  (') is for exposition not part of the  string,  though  quote  is
       certainly problematic in a name).  Instead of escaping " quotes in the string,  type %25, as in
          'a "b'  should be typed   'a%20%25b' Any characters can be typed in URI style, not just characters which are problematic to the shell or
       getopt.  We strongly suggest you not type URI-style characters where such are not needed or use the %  character  itself  in  command  line
       strings unless you must.

PRINTING OPTIONS
       -a     Print  each  section as independently as possible. Sections that can safely be printed independently (like .debug_abbrev) have rele‐
              vant info printed in the report (sometimes dependent on -v).

       -b     Print the .debug_abbrev section. Because the DWARF specfications do not rule out garbage data areas in .debug_abbrev  (if  they  are
              not referenced from .debug_info) any garbage bytes can result in this print failing.

       -c     Print locations lists.

       -f     Print the .debug_frame section.

       -F     Print the .eh_frame section.

       -i     Print  the .debug_info section.

       -l     Print the .debug_info section and the associated line section data.

       -m     Print the .debug_macinfo section.

       -N     Print  .debug_ranges  section.  Because the DWARF specfications do not rule out garbage data areas in .debug_ranges (if they are not
              referenced from .debug_info) any garbage bytes can result in this print failing.

       -p     Print the .debug_pubnames section.

       -r     Print the .debug_aranges section.

       -s     Print .debug_string section.

       -ta    Print the IRIX only sections .debug_static_funcs and .debug_static_vars.

       -tf    Print the IRIX only section .debug_static_funcs.

       -tv    Print the IRIX only section .debug_static_vars.

       -w     Print the IRIX-only .debug_weaknames section.

       -y     Print the .debug_pubtypes section (and .debug_typenames, an SGI IRIX-only section).

       Having dwarfdump print relocations may help establish whether dwarfdump understands any relocations that might exist.

       -o     Print all relocation records as well as we can manage.

       -oi    Print .rel*debug_info relocations.

       -ol    Print .rel*debug_line relocation.

       -op    Print .rel*debug_pubnames relocation.

       -oa    Has no effect.

       -or    Print .rel*debug_aranges relocations.

       -of    Print .rel*debug_frame relocations.

       -oo    Print .rel*debug_loc relocations.

       -oR    Print .rel*debug_ranges relocations.

       -g     Normally used only for testing libdwarf, this tells dwarfdump to print .debug_info and use an older dwarf_loclist() interface  func‐
              tion (a function that cannot handle all current location lists).

       -V     Print a dwarfdump date/version string and stop.

CHECKING OPTIONS
       -cg    Restricts checking to compilers whose producer string starts with 'GNU' and turns off -cs .

       -cs    Restricts checking to compilers whose producer string starts with 'SN' and turns off -cg .

       -cname Restricts checking to compilers whose producer string contains 'name' (not case sensitive).  The 'name' is read as a URI string.

       -ka : Turns on all checking options except -kxe (-kxe might
                           be slow enough one mignt not want to use it routinely.)

       -kb : Checks for certain abbreviations section errors when reading
                           DIEs.

       -kc    Checks for errors in constants in debug_info.

       -kd    Turns on full reporting of error totals per producer.  (the default shows less detail).

       -ke    Turns on reading pubnames and checking for fde errors.

       -kf    Turns on checking for FDE errors.

       -kF    Turns on checking for line table errors.

       -kg    Turns on checking for unused gaps in .debug_info (these gaps are not an error, just a waste of space).

       -ki    Causes a summary of checking results per compiler (producer) to be printed at the end.

       -kl    Turns on locations list checking.

       -km    Turns on checking of ranges.

       -kM    Turns on checking of aranges.

       -kr    Turns on DIE tag-attr combinations checking.

       -kR    Turns  on reading DIEs and checking for forward declarations rom DW_AT_specification attributes.  (which are not an error but can be
              a source of inefficiency for debuggers).

       -ks    Turns on extra reporting for some DIE errors checking detects .

       -kS    Turns on checking DIE references for circular references.

       -kt    Turns on tag-tag combinations checking.

       -kx    Turns on check_frames.

       -kxe   Turns off basic check_frames and turns on extended frame checking.

       -ky    Turns on type_offset, decl_file checking,

OPTION MODIFIERS
       -C     Normally when checking for tag-tag or tag-attribute combinations both the standard  combinations  and  some  common  extensions  are
              allowed.  With -C the extensions are taken out of the allowed class of combinations.

       -d     When  printing  DIEs, put all the attributes for each DIE on the same (long) line as the TAG.  This makes searching for DIE informa‐
              tion (as with grep) much simpler as the entire DIE is on one line.

       -D     Turns off the display of section offsets and attribute values in  printed  output.   So  the  .debug_info  output  isjust  TAGs  and
              Attributes.   For  pubnames (and the like) it removes offsets from the output.  For locations lists it removes offsets from the out‐
              put, but that is useless since the attribute values don't show so neither does the location data.

       -e     Turns on truncation of attribute and tag names. For example DW_TAG_foo  becomes   foo .    Not compatible with checking, only useful
              for printing DIEs.

       -G     When printing, add global offsets to the offsets printed.

       -H number
              When printing or checking .debug_info, this terminates the search after 'number' compilation units.  When printing frame information
              this terminates the FDE reporting after 'number' FDEs and the CIE reporting (which occurs if  one  adds  -v)  after  'number'  CIEs.
              Example   '-H 1'

       -M     When  printing, this means one want to have the FORM show for each attribute.  If a -v is also added (or more than one) then details
              of any form indirection are also shown.

       -n     When printing frames, this turns off the search for function names.  In a really large object the search can take more time than one
              wants to wait, so this avoids the search.

       -Q     Suppresses section data printing (set automatically with a checking option).

       -R     When  printing  frames for ABIs with lots of registers, this allows up to 1200 registers to be named (like R999) without choosing an
              ABI with, for example '-x abi=ppc'

       -v     Increases the detail shown when printing.  In some sections, using more -v options will increase the detail (one to three  are  use‐
              ful) or may change the report to show, for example, the actual line-data-commands instead of the resultant line-table.

SELECTIVE ENTRY PRINTING
       These  -S  options  stand  alone and basic print information about the compilation unit and DIE where the string(s) appear.  At most one of
       each of the following is effective (so for example one can only have one 'match', but one can have a 'match', an  'any',  and  a  'regex').
       Any -S causes the .debug_info section to be inspected.  No checking options or printing options should be supplied with -S.

       -S match=string
              When printing DIEs for each tag value or attribute name that matches 'string' exactly print the compilation unit information and its
              section offset.  Any CU with no match is not printed.  The 'string' is read as a URI string.

       -S any=string
              When printing DIEs for each tag value or attribute name that contains 'string' somewhere in the tag or attribute (case  insensitive)
              print  the compilation unit information and its section offset.  Any CU with no match is not printed.  The 'string' is read as a URI
              string.

       -S regex=string
              When printing DIEs for each tag value or attribute name where the 'string' reqular expression matches  print  the  compilation  unit
              information and its section offset.  Any CU with no match is not printed.  The 'string' is read as a URI string.

       The  string  cannot have spaces or other characters which are meaningful to getopt(3) and the shell will strip off quotes and other charac‐
       ters.  So the string is assumed to be in URI style and is translated.  In other words, to match 'a b' make the -S string 'a%20b' Instead of
       escaping " quotes in the string,  type %25, as in
          'a  "b'   should  be  typed    'a%20%25b'  (the ' are for exposition here, not part of the strings).  Any characters can be typed in URI
       style, not just characters which are problematic to the shell or getopt.

       The -S any= and -S regex= options are only usable if the library functions required are found at configure time.

       The -W option is a modifier to the -S option, and increases the amount of output -W prints.  Now we show  the  -W  in  context  with  a  -S
       option.

       -S match=string1 -W
              Prints the parent tree and the children tree for the DIEs that -S matches.

       -S match=string2 -Wp
              Prints the parent tree for the DIEs that -S matches.

       -S match=string3 -Wc
              Prints the parent tree for the DIEs that -S matches.

OTHER OPTIONS
       -# number
              This option controls internal debugging output, higher numbers mean more debug actions. See the source code.

       -x name=/p/a/t/h.conf
              The file path given is the name of a file assumed to be a dwarfdump.conf-like file.  The file path is read as a URI string.

       -x abi=ppc
              Selects  the  abi  (from a dwarfdump.conf file) to be used in printing frame information (here using ppc as an example).  The abi is
              read as a URI string.

       -P     When  checking this adds the list of compilation-unit names seen for each producer-compiler to the printed checking results.

       -q     When a URI is found and translated while reading the command line, be quiet about the URI translation. That  is,   don't  print  the
              original and translated option strings.

       -E     Turns on printing object-internal header data for some systems (for Unix/Linux does nothing).

       -u cuname
              Turns  on  selective  printing  of  DIEs  (printing like -i).  Only the DIEs for a compilation unit that match the name provided are
              printed.  If the compilation unit is ./a/b/c.c the 'cuname' you provide should be c.c as the characters through the final path-sepa‐
              rating  /  are  ignored.   If  'cuname'  begins with a / then the entire name string of a compilation unit must match 'cuname'.  The
              'cuname' is read as a URI string.

       -U     Turn off the URI interpretation of the command line strings entirely.  Must be be on the command line before any URI strings encoun‐
              tered to be fully effective.

       -z     No longer suported.

FILES
       dwarfdump

       dwarfdump.conf

       $(HOME)/.dwarfdump.conf

       $(HOME)/dwarfdump.conf

       <install-prefix>/lib/dwarfdump.conf

NOTES
       In  some  cases  compilers use DW_FORM_data1 (for example) and in such cases the signedness of the value must be taken from context. Rather
       than attempt to determine the context, dwarfdump prints the value with both signednesses whenever there  is  ambiguity  about  the  correct
       interpretation.   For  example,  "DW_AT_const_value            176(as  signed = -80)".  For normal DWARF consumers that correctly and fully
       evaluate all attributes there is no ambiguity of signedness: the ambiguity for dwarfdump is due to dwarfdump evaluating DIEs  in  a  simple
       order and not keeping track of much context.

BUGS
       Support for DWARF3 is being completed but may not be complete.

                                                                                                                                       DWARFDUMP()
