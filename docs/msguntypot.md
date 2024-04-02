MSGUNTYPOT(1p)                                                      Po4a Tools                                                      MSGUNTYPOT(1p)

NAME
       msguntypot - update PO files when a typo is fixed in POT file

SYNOPSIS
       msguntypot -o old_pot -n new_pot pofiles ...

DESCRIPTION
       When you fix a trivial error which surely doesn't affect translations (e.g.  a typo) in a POT file, you should unfuzzy the corresponding
       msgstr in the translated PO files to avoid so extra work to the translators.

       This task is difficult and error prone when done manually, and this tool is there to help doing so correctly. You just need to provide the
       two versions of the POT file: before the edition and after as marked in the above synopsis, and it all becomes automatic.

HOW TO USE IT
       In short, when you discover a typo in one of your [english] message, do the following:

       - Regenerate your POT and PO files.
             make -C po/ update-po # for message program translations
             debconf-updatepo      # for debconf translations
             po4a po4a.conf        # for po4a based documentation translations

           or something else, depending on your project's building settings. You know how to make sure your POT an PO files are uptodate, don't
           you??

       - Make a copy of your POT file.
             cp myfile.pot myfile.pot.orig

       - Make a copy of all your files.
             mkdir po_fridge; cp *.po po_fridge

       - Fix your typo.
           $EDITOR the_file_in_which_there_is_a_typo

       - Regenerate your POT and PO files.
           See above.

       At this point, the typo fix fuzzied all the translations, and this unfortunate change is the only one between the PO files of your main
       directory and the one from the fridge. Here is how to solve this.

       - Discard fuzzy translation, restore the ones from the fridge.
             cp po_fridge/*.po .

       - Manually merge the PO files with the new POT file, but taking the useless fuzzy into account.
             msguntypot -o myfile.pot.orig -n myfile.pot *.po

       - Cleanups.
             rm -rf myfile.pot.orig po_fridge

       You're done. The typo was eradicated from msgstr of both your POT and PO files, and the PO files were not fuzzyied in the process. Your
       translators love you already.

SEE ALSO
       Despite its name, this tool is not part of the gettext tool suite. It is instead part of po4a. More precisely, it's a random Perl script
       using the fine po4a modules. For more information about po4a, please see:

       po4a(7)

AUTHORS
        Martin Quinson (mquinson#debian,org)

COPYRIGHT AND LICENSE
       Copyright 2005 by SPI, inc.

       This program is free software; you may redistribute it and/or modify it under the terms of GPL (see the COPYING file).

Po4a Tools                                                          2016-01-05                                                      MSGUNTYPOT(1p)
