CIFER-DICT(1)                                                 General Commands Manual                                                CIFER-DICT(1)

NAME
       cifer-dict - turn files containing lists of words into a dictionary for cifer(1)

SYNOPSIS
       cifer-dict input1 [input2]... output

DESCRIPTION
       In order to use some functions of cifer(1), a specially formatted 'dictionary' must be supplied. cifer-dict takes files containing lists of
       words as arguments, and outputs the correctly formatted dictionary.

       This dictionary will have unicode characters converted to their nearest ASCII equivalents and all characters converted to  lower  case.  It
       will be sorted and duplicates removed.

EXAMPLES
       cifer-dict /usr/share/dict/words dict

       This uses /usr/share/dict/words as the input list and creates the formatted dictionary as dict.

       cifer-dict /usr/share/dict/words /home/superman/mywords dictionary

       This uses /usr/share/dict/words and /home/superman/mywords as input lists and creates the formatted dictionary as dictionary.

BUGS
       Please report any bugs by sending email to either <simrunbasuita@googlemail.com> or <danieljonathanrichman@googlemail.com>.

AUTHORS
       Daniel Richman <danieljonathanrichman@googlemail.com>, Simrun Basuita <simrunbasuita@googlemail.com>

COPYRIGHT
       This manual page is Copyright 2008 Simrun Basuita and Daniel Richman.

       This  manual  page  was written by Simrun Basuita <simrunbasuita@googlemail.com> and Daniel Richman <danieljonathanrichman@googlemail.com>.
       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 3  or  any
       later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

SEE ALSO
       cifer(1)

                                                                                                                                     CIFER-DICT(1)
