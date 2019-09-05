XPN(1)                                                            xpn User Manual                                                           XPN(1)

NAME
       xpn - graphical newsreader written in Python with the GTK+ toolkit

SYNOPSIS
       xpn [-d | --home_dir]

       xpn [-c | --custom_dir= {directory}]

       xpn [-h | --help]

DESCRIPTION
       This manual page documents briefly the xpn command.

       This manual page was written for the Debian distribution because the original program does not have a manual page. Instead, it has
       documentation in the GNU info(1) format; see below.

       xpn is a graphical newsreader written in Python with the GTK+ toolkit.

       With XPN you can read/write articles on the Usenet with a good MIME support. XPN can operate with all the most diffuse charset starting
       from US-ASCII to UTF-8. When you edit an article XPN automatically chooses the best charset, however is always possible to override this
       choice.

       There also other useful features like scoring, filtered views, random tag-lines, external editor support, one-key navigation, ROT13,
       spoiler char, ...

OPTIONS
       -d, --home_dir
           use the home directory to store config files and articles (default).

       -c directory, --custom_dir=directory
           specify an existing directory where to store config files and articles.

       -h, --help
           show summary of options.

FILES
       ${HOME}/.xpn/
           Default directory where xpn stores its configuration and articles.

AUTHORS
       Antonio Caputo <nemesis2001@gmx.it>
           Upstream author.

       Batista Facundo <facundo@taniquetil.com.ar>
           Contributed some code.

       David Paleino <d.paleino@gmail.com>
           Wrote this manpage for the Debian system.

       Emmanuele Bassi <emmanuele.bassi@infinito.it>
           Contributed some code.

       Guillame Bedot <guillaume.bedot@wanadoo.fr>
           French translator and contributed some code.

       Marek Macioschek <Marek.M@gmx.net>
           German translator.

       Patrick Lamaiziere <patrick.softs@lamaiziere.net>
           French translator.

       Rene Fischer <rene.fischer@gaehn.org>

           German translator.

       Valentino Volonghi <dialton3@virgilio.it>
           Contributed some code.

COPYRIGHT
       Copyright © 2008 David Paleino

       This manual page was written for the Debian system (but may be used by others).

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 3 or (at
       your option) any later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

xpn                                                                 02/09/2008                                                              XPN(1)
