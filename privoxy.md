PRIVOXY(8)                                                                                                                              PRIVOXY(8)

NAME
       privoxy - Privacy Enhancing Proxy

SYNOPSIS
       privoxy [--chroot ] [--config-test ] [--help ] [--no-daemon ] [--pidfile pidfile ] [--pre-chroot-nslookup hostname ] [--user user[.group] ]
       [--version ] [configfile ]

OPTIONS
       Privoxy may be invoked with the following command line options:

       --chroot
              Before changing to the user ID given in the --user option, chroot to that user's home directory, i.e. make the kernel pretend to the
              Privoxy  process that the directory tree starts there. If set up carefully, this can limit the impact of possible vulnerabilities in
              Privoxy to the files contained in that hierarchy.

       --config-test
              Exit after loading the configuration files before binding to the listen address. The exit code signals whether or not the configura‐
              tion files have been successfully loaded.

              If  the  exit  code is 1, at least one of the configuration files is invalid, if it is 0, all the configuration files have been suc‐
              cessfully loaded (but may still contain errors that can currently only be detected at run time).

              This option doesn't affect the log setting, combination with "--no-daemon" is recommended if a  configured  log  file  shouldn't  be
              used.

       --help Print brief usage info and exit.

       --no-daemon
              Don't   become   a  daemon,  i.e.  don't fork and become process group leader, don't detach from controlling tty, and do all logging
              there.

       --pidfile pidfile
              On startup, write the process ID to pidfile.  Delete the pidfile on exit.  Failure to create or delete the pidfile is non-fatal.  If
              no --pidfile option is given, no PID file will be used.

       --pre-chroot-nslookup hostname
              Initialize  the  resolver  library  using  hostname before chroot'ing. On some systems this reduces the number of files that must be
              copied into the chroot tree.

       --user user[.group]
              After (optionally) writing the PID file, assume the user ID of user and the GID of group, or, if the optional group was  not  given,
              the default group of user. Exit if the privileges are not sufficient to do so.

       --version
              Print version info and exit.

       If the configfile is not specified on  the  command  line, Privoxy  will  look for a file named config in the current directory. If no con‐
       figfile is found, Privoxy will fail to start.

DESCRIPTION
       Privoxy is a non-caching web proxy with advanced filtering capabilities for enhancing privacy, modifying web page data  and  HTTP  headers,
       controlling  access, and removing ads and other obnoxious Internet junk. Privoxy has a flexible configuration and can be customized to suit
       individual needs and tastes.  It has application for both stand-alone systems and multi-user networks.

       Privoxy is Free Software and licensed under the GNU GPLv2.

       Privoxy is an associated project of Software in the Public Interest (SPI).

       Helping hands and donations are welcome:

       · https://www.privoxy.org/faq/general.html#PARTICIPATE

       · https://www.privoxy.org/faq/general.html#DONATE

INSTALLATION AND USAGE
       Browsers can either be individually configured to use Privoxy as a HTTP proxy (recommended), or Privoxy can be combined with a packet  fil‐
       ter  to  build  an intercepting proxy (see config).  The default setting is  for localhost,  on port  8118 (configurable in the main config
       file).  To set the HTTP proxy in Firefox, go through: Tools; Options; General; Connection Settings; Manual Proxy Configuration.

       For Internet Explorer, go through: Tools; Internet Properties; Connections; LAN Settings.

       The Secure (SSL) Proxy should also be set to the same values, otherwise https: URLs will not be proxied. Note: Privoxy can only proxy  HTTP
       and  HTTPS  traffic. Do not try it with FTP or other protocols.  HTTPS presents some limitations, and not all features will work with HTTPS
       connections.

       For other browsers, check the documentation.

CONFIGURATION
       Privoxy can be configured with the various configuration files. The default configuration files are: config, default.filter, default.action
       and  default.action. user.action should be used for locally defined exceptions to the default rules in match-all.action and default.action,
       and user.filter for locally defined filters. These are well commented.  On Unix and Unix-like systems, these are located  in  /etc/privoxy/
       by default.

       Privoxy uses the concept of actions in order to manipulate the data stream between the browser and remote sites.  There are various actions
       available with specific functions for such things as blocking web sites, managing cookies, etc. These actions can be  invoked  individually
       or combined, and used against individual URLs, or groups of URLs that can be defined using wildcards and regular expressions. The result is
       that the user has greatly enhanced control and freedom.

       The actions list (ad blocks, etc) can also be configured with your web browser at http://config.privoxy.org/  (assuming  the  configuration
       allows it).  Privoxy's configuration parameters  can also  be viewed at the same page. In addition, Privoxy can be toggled on/off.  This is
       an internal page, and does not require Internet access.

       See the User Manual for a detailed explanation of installation, general usage, all configuration options, new features and notes on upgrad‐
       ing.

FILES
        /usr/sbin/privoxy
        /etc/privoxy/config
        /etc/privoxy/match-all.action
        /etc/privoxy/default.action
        /etc/privoxy/user.action
        /etc/privoxy/default.filter
        /etc/privoxy/user.filter
        /etc/privoxy/trust
        /etc/privoxy/templates/*
        /var/log/privoxy/logfile

       Various  other  files  should  be  included, but may vary depending on platform and build configuration. Additional documentation should be
       included in the local documentation directory.

SIGNALS
       Privoxy terminates on the SIGINT and SIGTERM signals. Log rotation scripts may cause a re-opening of the logfile by  sending  a  SIGHUP  to
       Privoxy.  Note  that  unlike other daemons,  Privoxy does not need to be made aware of config file changes by SIGHUP -- it will detect them
       automatically. Signals other than the ones listed above aren't explicitly handled and result in the default action defined by the operating
       system.

NOTES
       Please see the User Manual on how to contact the developers, for feature requests, reporting problems, and other questions.

SEE ALSO
       Other references and sites of interest to Privoxy users:

       https://www.privoxy.org/, the Privoxy Home page.

       https://www.privoxy.org/faq/, the Privoxy FAQ.

       https://www.privoxy.org/developer-manual/, the Privoxy developer manual.

       https://sourceforge.net/projects/ijbswa/, the Project Page for Privoxy on SourceForge.

       http://config.privoxy.org/, the web-based user interface. Privoxy must be running for this to work. Shortcut: http://p.p/

       https://sourceforge.net/tracker/?group_id=11118&atid=460288, to submit ``misses'' and other configuration related suggestions to the devel‐
       opers.

DEVELOPMENT TEAM
        Fabian Keil, lead developer
        David Schmidt
        Hal Burgiss
        Lee Rian
        Roland Rosenfeld
        Ian Silvester

COPYRIGHT AND LICENSE
   COPYRIGHT
       Copyright (C) 2001-2016 by Privoxy Developers <privoxy-devel@lists.privoxy.org>

       Some source code is based on code Copyright (C) 1997 by Anonymous Coders and Junkbusters, Inc. and licensed under the  GNU  General  Public
       License.

   LICENSE
       Privoxy  is  free  software; you can redistribute it and/or modify it under the terms of the GNU General Public License, version 2, as pub‐
       lished by the Free Software Foundation.

       Privoxy is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty  of  MERCHANTABILITY
       or FITNESS FOR A PARTICULAR PURPOSE.  See the  license for details.

Privoxy 3.0.26                                                      2012-11-08                                                          PRIVOXY(8)
