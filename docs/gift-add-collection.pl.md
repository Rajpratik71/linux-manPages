gnuift(1)                              General Commands Manual                              gnuift(1)

NAME
       gnuift — GNU Image Finding Tool - index and search images by content

DESCRIPTION
       This manual page documents briefly the gnuift and gift-*       commands.

       This manual page was written for the Debian distribution because the original program does not
       have a manual page.

       The GIFT (the GNU Image-Finding Tool) is a Content Based Image Retrieval  System  (CBIRS).  It
       enables  you  to  do  Query  By Example on images, giving you the opportunity to improve query
       results by relevance feedback. For processing your queries the program relies entirely on  the
       content  of  the  images, freeing you from the need to annotate all images before querying the
       collection.

       The GIFT comes with a tool which lets you index whole directory trees containing images in one
       go. You then can use the GIFT server and its client, to browse your own image collections.

       The GIFT is an open framework for content-based image retrieval. We explicitly have taken into
       account the possibility of adding new ways of querying to  the  framework.  Our  communication
       protocol   for   client-server   communication,  MRML,  is  XML  based  and  fully  documented
       (http://www.mrml.net). This aims at promoting code reuse  among  researchers  and  application
       developers.

       The current version of the GIFT can be seen in action at http://viper.unige.ch/demo/

       The  GIFT  (ex  Viper) is the result of a research effort at the Vision Group at the CUI (com‐
       puter science center) of the University of Geneva (see http://vision.unige.ch/). This cutting-
       edge  research  has been the subject of several publications and conference talks. Details can
       be found at http://viper.unige.ch/.

SEE ALSO
       The gnuift-doc package contains reference manuals, configuration hints  and  further  informa‐
       tion.

AUTHOR
       This  manual  page was written by Robert Jordens jordens@debian.org for the Debian system (but
       may be used by others).  Permission is granted to copy, distribute and/or modify this document
       under the terms of the GNU General Public License, Version 2. On Debian systems, the full text
       of this license can be found in the file /usr/share/common-licenses/GPL-2.

                                                                                            gnuift(1)
