ENCHANT(1)                                                    Enchant Mini Help File                                                    ENCHANT(1)

NAME
       Enchant - a spellchecker

SYNOPSIS
       enchant [-a] [-d dict] [-h] [-l] [-L] [-v]

DESCRIPTION
       Enchant is an ispell-compatible spellchecker.

   OPTIONS
       -a     List suggestions in ispell pipe mode format.

       -d dict
              Use dictionary <dict>.

       -h     Show short help.

       -l     List only the misspellings.

       -L     Include the line number in the output.

       -v     Prints the program's version.

ENCHANT ORDERING FILE
       Enchant has a global and a per-user ordering file named enchant.ordering.  It lets the user specify which spelling backend to use for indi‐
       vidual languages in the case when you care which backend gets used. The global file is located in $(datadir)/enchant and the per-user  file
       is located in ~/.enchant.  The per-user file takes precedence, if found.

       The  ordering file takes the form language_tag:<comma-separated list of spelling backends>. I am currently aware of the following backends:
       aspell, myspell, ispell, uspell, hspell, voikko, and zemberek. '*' is used to mean "use this ordering for all languages, unless  instructed
       otherwise." For example:

       *:aspell,myspell,ispell
       en:aspell,myspell,ispell
       en_UK:myspell,aspell,ispell
       fr:myspell,ispell:aspell

DIRECTORIES IMPORTANT TO ENCHANT
       Unless  configured otherwise, Enchant's Myspell, Ispell, and Uspell backends will look for dictionaries in directories specific to Enchant,
       and will not use your system-wide installed dictionaries. This is for pragmatic reasons since many distributions install these dictionaries
       into different locations.

       Like the enchant.ordering file described above, Enchant looks in the global directory for these dictionaries and a per-user directory.  The
       per-user directory  takes  precedence  if  it  is  found.   Enchant  looks  for  Myspell  dictionaries  in  $(datadir)/enchant/myspell  and
       ~/.enchant/myspell.   Enchant  looks  for Ispell dictionaries in $(datadir)/enchant/ispell and ~/.enchant/ispell.  Enchant looks for Uspell
       dictionaries in $(datadir)/enchant/uspell and ~/.enchant/uspell.

       Packagers and users may wish to make symbolic links to the system-wide dictionary directories. Or, preferably, use the  --with-myspell-dir,
       --with-ispell-dir, and --with-uspell-dir 'configure' arguments.

MORE INFORMATION
       http://www.abisource.com/enchant/

SEE ALSO
       aspell(1), ispell(1),

AUTHOR
        Dom Lachowicz
        WEB: http://www.abisource.com/enchant/
        MAIL: domlachowicz@gmail.com

enchant                                                              July 2006                                                          ENCHANT(1)
