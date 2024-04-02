DISSY(1)                                                      General Commands Manual                                                     DISSY(1)

NAME
       dissy - graphical frontend for objdump

DESCRIPTION
       Dissy  is  a  disassembler  for  Linux and UNIX which supports multiple architectures and allows easy navigation through the code. Dissy is
       implemented in Python and uses objdump for disassembling files. Dissy can be used for debugging, reverse engineering and checking compiler-
       generated code.

       -t BASE_ADDRESS
              Use BASE_ADDRESS as the start address of the disassembled code

       -h     Display usage

Features and usage
       * Dissy shows jumps with red links to the destination address

       * A label is used to show call destinations

       * Clicking (or pressing enter) on calls or jumps will take you to the destination function / address

       * Dissy supports interactive searching for labels and addresses both for functions and instructions

       * Browser-like history navigation (back/forward) is available, which is useful for example to lookup callchains. Alt-Left and Alt-Right are
       used to navigate back and forward

       * The lookup (use Ctrl-l to access) feature allows for looking up pasted addresses or labels. The lookup is intelligent in that it tries to
       convert  common  patterns  into  numbers before reverting to label lookup. Pasting multiple addresses or names will lookup each in turn and
       stop at the last (access the earlier in the history)

       * The highlight field (ues Ctrl-k to access) allows the disassembled text to be highlighted for example to show all accesses to  a  certain
       register. Regular expressions are allowed in this field

       *  The  preferences  window  can be used to select which objdump to use (which can also be controlled by the OBJDUMP environment variable).
       Colors can also be selected in this window.

HOMEPAGE
       http://rtlab.tekproj.bth.se/wiki/index.php/Dissy

AUTHOR
       This manual page was written by Varun Hiremath <varunhiremath@gmail.com>, for the Debian project (but may be used by others).

                                                                 October 20, 2006                                                         DISSY(1)
