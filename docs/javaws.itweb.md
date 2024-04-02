javaws(1)                                                                                  General Commands Manual                                                                                  javaws(1)



NAME
       javaws - a Java Web Start client

SYNOPSIS
       javaws [-run-options] jnlp file
       javaws [-control-options]

DESCRIPTION
       javaws is an implementation of a JNLP client. It uses a JNLP (Java Network Launch Protocol) file to securely run a remote Java application or a Java applet. This implementation of javaws is from the
       IcedTea project and is based on the NetX project.

       A JNLP file is an xml file that describes how to securely run a remote Java application or a Java applet.


OPTIONS
       When specifying options, the name of the jnlp file can be after the command, the -jnlp option, an option with no arguments, or after an argument with an option that takes one argument. A  html  file
       that launches a jnlp can be specified after the -html option.
       The jnlp-file can either be a url or a local path.
       The JNLP file should only be specified once, whether as a main argument, after -jnlp or through an html file.

       Control options:


       -about      Shows a sample application.(No argument expected)

       -help       Prints out information about supported command and basic usage.(No argument expected)

       -license    Display the GPL license and exit.(No argument expected)

       -viewer     Shows the trusted certificate viewer.(No argument expected)

       -Xclearcache
                   Clean the JNLP application cache.(No argument expected)


       Run options:


       -allowredirect
                   Follows HTTP redirects.(No argument expected)

       -arg arg    Adds an application argument before launching.(Expected one or more arguments)

       -browser    Launch embeded browser. Use in great need only!(Expected one or more arguments)

       -headless   Disables download window, other UIs.(No argument expected)

       -html       Location  of  HTML  file to launch (url or file). You can use parameter ALL  or numbers (like 1 2 5) to select applets on page. However experimental, this switch should keep you still in
                   safety.(Expected one or more arguments)

       -jnlp       Location of JNLP file to launch (url or file).(Exactly one argument expected)

       -nosecurity Disables the secure runtime environment.(No argument expected)

       -noupdate   Disables checking for updates.(No argument expected)

       -param name=value
                   Adds an applet parameter before launching.(Expected one or more arguments)

       -property name=value
                   Sets a system property before launching.(Expected one or more arguments)

       -strict     Enables strict checking of JNLP file format.(No argument expected)

       -update seconds
                   Check for updates.(Exactly one argument expected)

       -verbose    Enable verbose output.(No argument expected)

       -version    Print the IcedTea-Web version and exit.(No argument expected)

       -Xignoreheaders
                   Skip jar header verification.(No argument expected)

       -xml        Uses a strict XML parser to parse the JNLP file.(No argument expected)

       -Xnofork    Do not create another JVM.(No argument expected)

       -Xoffline   Prevent ITW network connection. Only cache will be used. Application can still connect.(No argument expected)

       -Xtrustnone Instead of asking user, will foretold all answers as no.(No argument expected)


EXAMPLES
       javaws -about
                   Shows basic help and about informations.

       javaws -about -headless
                   Shows basic help and about informations in terminal only.

       javaws  -Xnofork -Xignoreheaders -allowredirect -Xoffline http://mypage.web/dangerous.jnlp
                   Will start dangerous.jnlp application, originally from mypage.web, without downloading it, without headers check and in forced single VM.


FILES
       $JAVA_HOME/lib/deployment.config
                   java-global deployment properties file. May be affected by deployment.jre.dir.

       $JAVA_HOME/lib/security/cacerts
                   Contains  various system java-wide stored certificates. Controlled by deployment.system.security.cacerts


       $JAVA_HOME/lib/security/jssecacerts
                   Contains  various system java-wide stored certificates. Controlled by deployment.system.security.jssecacerts


       $JAVA_HOME/lib/security/trusted.certs
                   Contains  various system java-wide stored certificates. Controlled by deployment.system.security.trusted.certs


       $JAVA_HOME/lib/security/trusted.clientcerts
                   Contains  various system java-wide stored certificates. Controlled by deployment.system.security.trusted.clientautcerts


       $JAVA_HOME/lib/security/trusted.jssecerts
                   Contains  various system java-wide stored certificates. Controlled by deployment.system.security.trusted.jssecerts


       $TMP/$USER/netx/locks
                   Location of netx locks. Controlled by deployment.user.locksdir


       $TMP/$USER/netx/locks/netx_running
                   Location of netx main lock. Controlled by deployment.user.runningfile


       $XDG_CACHE_HOME/icedtea-web/cache
                   Contains cached runtime entries. Controlled by deployment.user.cachedir


       $XDG_CACHE_HOME/icedtea-web/cache/recently_used
                   Additional information about items in cache

       $XDG_CACHE_HOME/icedtea-web/pcache
                   Contains saved application data. Controlled by deployment.user.pcachedir


       $XDG_CACHE_HOME/icedtea-web/tmp
                   Contains temporary runtime files. Controlled by deployment.user.tmp


       $XDG_CONFIG_HOME/icedtea-web/.appletTrustSettings
                   File responsible for various actions on applets and apps based on their codebase based on users actions.

       $XDG_CONFIG_HOME/icedtea-web/deployment.properties
                   Users main deployment properties file.

       $XDG_CONFIG_HOME/icedtea-web/icons
                   Location where icons of javaws applications desktop/menu launchers icons are stored

       $XDG_CONFIG_HOME/icedtea-web/log
                   contains file-log files (if enabled), itw-cplugin-date_time.log for native part of plugin, itw-javantx-date_time.log for everything else. Controlled by deployment.user.logdir


       $XDG_CONFIG_HOME/icedtea-web/security/java.policy
                   Contains granted permissions for selected unsigned apps. Controlled by deployment.user.security.policy


       $XDG_CONFIG_HOME/icedtea-web/security/trusted.cacerts
                   Contains  various users stored certificates. Controlled by deployment.user.security.trusted.cacerts


       $XDG_CONFIG_HOME/icedtea-web/security/trusted.certs
                   Contains  various users stored certificates. Controlled by deployment.user.security.trusted.certs


       $XDG_CONFIG_HOME/icedtea-web/security/trusted.clientcerts
                   Contains  various users stored certificates. Controlled by deployment.user.security.trusted.clientauthcerts


       $XDG_CONFIG_HOME/icedtea-web/security/trusted.jssecacerts
                   Contains  various users stored certificates. Controlled by deployment.user.security.trusted.jssecacerts


       $XDG_CONFIG_HOME/icedtea-web/security/trusted.jssecerts
                   Contains  various users stored certificates. Controlled by deployment.user.security.trusted.jssecerts


       $XDG_DATA_HOME/applications/javaws
                   Subdirectory in users menus space, for placing custom menu shortcuts.

       /etc/.java/deployment/.appletTrustSettings
                   File responsible for various actions on applets and apps based on their codebase based on admins actions.

       /etc/.java/deployment/deployment.config
                   Global deployment config file.


       Where $XDG_CONFIG_DIR, $XDG_CACHE_DIR and $XDG_RUNTIME_DIR are  set  as ~/.config, ~/.cache and /tmp or /var/tmp if not set.

BUGS
       There aren't any known bugs. If you come across one, please file it at:
       http://icedtea.classpath.org/wiki/IcedTea-Web#Filing_bugs
       http://icedtea.classpath.org/bugzilla

       Please run in debug (-verbose switch or itw-settings setting or ICEDTEAPLUGIN_DEBUG variable set to true) mode and include that output (best is from java console) with URL to jnlp or html  file  (or
       the jnlp/html file or  application itself) when filing out the bug report.


AUTHOR
       The following people have made contibutions to this project.
       Please keep this list in alphabetical order.
       Lillian  Angel  <langel@redhat.com>Andrew  Azores  <aazores@redhat.com>Deepak  Bhole  <dbhole@redhat.com>Adam  Buchta <adbuch7@gmail.com>Ricardo Martín Camarero <rickyepoderi@yahoo.es>Marcin Cieslak
       <marcin.cieslak@gmail.com>Danesh Dadachanji <ddadacha@redhat.com>Adam Domurad <adomurad@redhat.com>Lukasz Dracz <ldracz@redhat.com>Thomas Fitzsimmons  <fitzsim@redhat.com>Michał  Górny  <mgorny@gen‐
       too.org>Mark  Greenwood  <mark@dcs.shef.ac.uk>Tereza  Hlavackova  <hlavackova.tereza@gmail.com>Peter Hatina <phatina@redhat.com>Andrew John Hughes <ahughes@redhat.com>Jie Kang <jkang@redhat.com>Alex
       Kashchenko <akashche@redhat.com>Matthias Klose <doko@ubuntu.com>Alexandr Kolouch <skolnag@gmail.com>Jan Kmetko <jan.kmetko.ml@gmail.com>Francis Kung <fkung@redhat.com>Denis Lila <dlila@redhat.com>DJ
       Lucas  <dj@lucasit.com>Omair  Majid  <omajid@redhat.com>Jon  A.  Maxwell  <jmaxwell@users.sourceforge.net>Thomas Meyer <thomas@m3y3r.de>Kurt Miller <kurt@intricatesoftware.com>Saad Mohammad <smoham‐
       mad@redhat.com>Martin Olsson  <martin@minimum.se>Stefan Ring  <stefan@complang.tuwien.ac.at>Ville Skyttä <ville.skytta@iki.fi>Fridrich Strba <fridrich.strba@suse.com>Andrew Su <asu@redhat.com>Joshua
       Sumali <jsumali@redhat.com>Michal Vala <mvala@redhat.com>Jiri Vanek <jvanek@redhat.com>Tomáš Votava <tomcacolca@gmail.com>Mark Wielaard <mark@klomp.org>Jacob Wisor  <gitne@excite.co.jp>Man Lung Wong
       <mwong@redhat.com>
       This project also includes code from the following projects:
       OpenJDK <http://openjdk.java.net/>
       Netx <http://jnlp.sourceforge.net/netx/>



SEE ALSO
       icedtea-web(1) javaws(1) icedtea-web-plugin(1) itweb-settings(1) policyeditor(1) policytool(1) java(1)

       http://icedtea.classpath.org/wiki/IcedTea-Web
       http://icedtea.classpath.org/hg/icedtea-web




icedtea-web (rhel-1.el7-x86_64)                                                                  11 Apr 2018                                                                                        javaws(1)
