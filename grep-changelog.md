grep-changelog(1)                                                                          General Commands Manual                                                                          grep-changelog(1)



NAME
       grep-changelog - print ChangeLog entries matching criteria

SYNOPSIS
       grep-changelog [options] [CHANGELOG...]

DESCRIPTION
       grep-changelog  searches the named CHANGELOGs (by default files matching the regular expressions ChangeLog and ChangeLog\.[0-9]+) for entries matching the specified criteria.  At least one option or
       file must be specified.  This program is distributed with GNU Emacs.

OPTIONS
       The program accepts unambiguous abbreviations for option names.

       --author=AUTHOR
              Print entries whose author matches regular expression AUTHOR.

       --text=TEXT
              Print entries whose text matches regular expression TEXT.

       --exclude=TEXT
              Exclude entries matching regular expression TEXT.

       --from-date=YYYY-MM-DD
              Only consider entries made on or after the given date.  ChangeLog date entries not in the “YYYY-MM-DD” format are never matched.

       --to-date=YYYY-MM-DD
              Only consider entries made on or before the given date.

       --rcs-log
              Print output in a format suitable for RCS log entries.  This format removes author lines, leading spaces, and file names.

       --with-date
              In RCS log format, print short dates.

       --reverse
              Show matches in reverse order.

       --version
              Display version information.

       --help Display basic usage information.

COPYING
       Copyright (C) 2008-2013 Free Software Foundation, Inc.

       Permission is granted to make and distribute verbatim copies of this document provided the copyright notice and this permission notice are preserved on all copies.

       Permission is granted to copy and distribute modified versions of this document under the conditions for verbatim copying, provided that the entire resulting derived work is  distributed  under  the
       terms of a permission notice identical to this one.

       Permission  is  granted to copy and distribute translations of this document into another language, under the above conditions for modified versions, except that this permission notice may be stated
       in a translation approved by the Free Software Foundation.




                                                                                                                                                                                            grep-changelog(1)
