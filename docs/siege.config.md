SIEGE.CONFIG(1)                                                siege.config utility                                                SIEGE.CONFIG(1)

   NAME
       siege.config - builds a siege.conf template in the user's home directory.

   INTRODUCTION
       siege's default settings are stored in $HOME/.siege/siege.conf. This utility will create a new siege.conf if one does not already exist.
       Generally speaking you should not have to run this command with siege releases equal or later to 4.0.0.

       At start up, siege checks for a $HOME/.siege/siege.conf. If one does not exist, siege will run this command to create a new one then read
       that file to configure itself.

   INVOCATION
       The format for invoking siege.config is this:

         siege.config [no arguments]

   AUTHOR
       Jeffrey Fulmer, et al. <jeff@joedog.org>

   COPYRIGHT
       Copyright  Jeffrey Fulmer, et al. <jeff@joedog.org>

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

   AVAILABILITY
       siege.config is distributed as part of siege

   SEE ALSO
       $_PROGRAM(1)

JoeDog                                                              2016-05-20                                                     SIEGE.CONFIG(1)
