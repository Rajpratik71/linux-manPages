NAMECHECK(1)                                                                                                                                                                                 NAMECHECK(1)

NAME
       namecheck - Check project names are not already taken.

ABOUT
       This is a simple tool to automate the testing of project names at the most common Open Source / Free Software hosting environments.

       Each new project requires a name, and those names are ideally unique.  To come up with names is hard, and testing to ensure they're not already in use is time-consuming - unless you have a tool
       such as this one.

CUSTOMIZATION
       The script, as is, contains a list of sites, and patterns, to test against.

       If those patterns aren't sufficient then you may create your own additions and add them to the script.  If you wish to have your own version of the patterns you may save them into the file
       ~/.namecheckrc

HOMEPAGE
       The most recent version of this script may be found here:

       http://mybin.repository.steve.org.uk/?raw-file/tip/namecheck

AUTHOR
       Steve -- http://www.steve.org.uk/

LICENSE
       Copyright (c) 2008 by Steve Kemp.  All rights reserved.

       This module is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

Debian Utilities                                                                                2016-03-23                                                                                   NAMECHECK(1)
