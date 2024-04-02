itweb-settings(1)                                                                          General Commands Manual                                                                          itweb-settings(1)



NAME
       itweb-settings - view and modify settings for javaws and the browser plugin


SYNOPSIS
       itweb-settings
       itweb-settings command arguments

DESCRIPTION
       itweb-settings is a command line and a GUI program to modify and edit settings used by the IcedTea-Web implementation of javaws and the browser plugin

       If executed without any arguments, it starts up a GUI. Otherwise, it tries to do what is specified in the argument.

       The command-line allows quickly searching, making a copy of and modifying specific settings without having to hunt through a UI.

DESCRIPTION
       -check name Checks that all the current settings have valid values.(No argument expected)

       -get name   Shows the value of the specified settings.(Expected one or more arguments)

       -headless   Disables download window, other UIs.(No argument expected)

       -help       Prints out information about supported command and basic usage. Can also take an parameter, and then it prints detailed help for this command.(No argument expected)

       -info name  Shows additional information about the named settings. Includes a description, the current value, the possible values, and the source of the setting.(Expected one or more arguments)

       -list       Shows a list of all the IcedTea-Web settings and their current values.(No argument expected)

       -reset name Resets the specified settings to their original value.(Expected one or more arguments)

       -reset all  Resets all settings to their original values.(No argument expected)

       -set name value
                   Sets the settings to the new value specified, if it is an appropriate value.(Expected even number of arguments with param=value as valid argument)

       -verbose    Enable verbose output.(No argument expected)



EXAMPLES
       itweb-settings
                   Show the GUI editor

       itweb-settings  -reset deployment.proxy.type
                    Resets the value of `deployment.proxy.type` setting.



       Known properties (key and default value):



       deployment.browser.path
                   null (Possible: include an absolute path to a file or directory)

       deployment.cache.jarcompression
                   0 (Possible: are in range 0 to 10 (inclusive))

       deployment.cache.max.size
                   -1 (Possible: are in range -1 to 2,147,483,647 (inclusive))

       deployment.console.startup.mode
                   HIDE (Possible: [DISABLE, HIDE, SHOW, SHOW_PLUGIN_ONLY, SHOW_JAVAWS_ONLY])

       deployment.https.noenforce
                   false (Possible: are true or false)

       deployment.javapi.cache.enabled
                   false (Possible: are true or false)

       deployment.javaws.associations
                   2 (Possible: are in range 0 to 3 (inclusive))

       deployment.javaws.autodownload
                   false (Possible: are true or false)

       deployment.javaws.installURL
                   null (Possible: include any valid url (eg. http://icedtea.classpath.org/hg/))

       deployment.javaws.shortcut
                   ASK_IF_HINTED (Possible: [ALWAYS, ALWAYS_IF_HINTED, ASK_USER, ASK_IF_HINTED, NEVER])

       deployment.javaws.update.timeout
                   500 (Possible: are in range 0 to 10,000 (inclusive))

       deployment.jnlpclassloader.strict
                   true (Possible: are true or false)

       deployment.jre.dir
                   null

       deployment.log
                   false (Possible: are true or false)

       deployment.log.file
                   false (Possible: are true or false)

       deployment.log.file.clientapp
                   true (Possible: are true or false)

       deployment.log.file.legacylog
                   false (Possible: are true or false)

       deployment.log.headers
                   false (Possible: are true or false)

       deployment.log.stdstreams
                   true (Possible: are true or false)

       deployment.log.system
                   true (Possible: are true or false)

       deployment.manifest.attributes.check
                   ALL  (Possible: (Values that can be used alone only): [ALL, NONE] (Values that can be used in combination separated by the delimiter "," with no space expected ): [ALAC, CODEBASE, ENTRY‐
                   POINT, PERMISSIONS, TRUSTED])

       deployment.plugin.jvm.arguments
                   null

       deployment.proxy.auto.config.url
                   null (Possible: include any valid url (eg. http://icedtea.classpath.org/hg/))

       deployment.proxy.bypass.list
                   null

       deployment.proxy.bypass.local
                   null

       deployment.proxy.ftp.host
                   null

       deployment.proxy.ftp.port
                   null

       deployment.proxy.http.host
                   null

       deployment.proxy.http.port
                   null

       deployment.proxy.https.host
                   null

       deployment.proxy.https.port
                   null

       deployment.proxy.override.hosts
                   null

       deployment.proxy.same
                   false (Possible: are true or false)

       deployment.proxy.socks.host
                   null

       deployment.proxy.socks.port
                   null

       deployment.proxy.type
                   3 (Possible: are in range -1 to 3 (inclusive))

       deployment.security.askgrantdialog.notinca
                   true (Possible: are true or false)

       deployment.security.askgrantdialog.show
                   true (Possible: are true or false)

       deployment.security.expired.warning
                   true (Possible: are true or false)

       deployment.security.jsse.hostmismatch.warning
                   true (Possible: are true or false)

       deployment.security.level
                   null (Possible: DENY_ALL DENY_UNSIGNED ASK_UNSIGNED ALLOW_UNSIGNED)

       deployment.security.notinca.warning
                   true (Possible: are true or false)

       deployment.security.sandbox.awtwarningwindow
                   true (Possible: are true or false)

       deployment.security.sandbox.jnlp.enhanced
                   true (Possible: are true or false)

       deployment.security.trusted.policy
                   null (Possible: include an absolute path to a file or directory)

       deployment.system.cachedir
                   null (Possible: include an absolute path to a file or directory)

       deployment.system.security.cacerts
                   $JAVA_HOME/lib/security/cacerts (Possible: include an absolute path to a file or directory)

       deployment.system.security.jssecacerts
                   $JAVA_HOME/lib/security/jssecacerts (Possible: include an absolute path to a file or directory)

       deployment.system.security.policy
                   null (Possible: include any valid url (eg. http://icedtea.classpath.org/hg/))

       deployment.system.security.trusted.certs
                   $JAVA_HOME/lib/security/trusted.certs (Possible: include an absolute path to a file or directory)

       deployment.system.security.trusted.clientautcerts
                   $JAVA_HOME/lib/security/trusted.clientcerts (Possible: include an absolute path to a file or directory)

       deployment.system.security.trusted.jssecerts
                   $JAVA_HOME/lib/security/trusted.jssecerts (Possible: include an absolute path to a file or directory)

       deployment.user.cachedir
                   $XDG_CACHE_HOME/icedtea-web/cache (Possible: include an absolute path to a file or directory)

       deployment.user.locksdir
                   $TMP/$USER/netx/locks (Possible: include an absolute path to a file or directory)

       deployment.user.logdir
                   $XDG_CONFIG_HOME/icedtea-web/log (Possible: include an absolute path to a file or directory)

       deployment.user.pcachedir
                   $XDG_CACHE_HOME/icedtea-web/pcache (Possible: include an absolute path to a file or directory)

       deployment.user.runningfile
                   $TMP/$USER/netx/locks/netx_running (Possible: include an absolute path to a file or directory)

       deployment.user.security.policy
                   $XDG_CONFIG_HOME/icedtea-web/security/java.policy (Possible: include any valid url (eg. http://icedtea.classpath.org/hg/))

       deployment.user.security.trusted.cacerts
                   $XDG_CONFIG_HOME/icedtea-web/security/trusted.cacerts (Possible: include an absolute path to a file or directory)

       deployment.user.security.trusted.certs
                   $XDG_CONFIG_HOME/icedtea-web/security/trusted.certs (Possible: include an absolute path to a file or directory)

       deployment.user.security.trusted.clientauthcerts
                   $XDG_CONFIG_HOME/icedtea-web/security/trusted.clientcerts (Possible: include an absolute path to a file or directory)

       deployment.user.security.trusted.jssecacerts
                   $XDG_CONFIG_HOME/icedtea-web/security/trusted.jssecacerts (Possible: include an absolute path to a file or directory)

       deployment.user.security.trusted.jssecerts
                   $XDG_CONFIG_HOME/icedtea-web/security/trusted.jssecerts (Possible: include an absolute path to a file or directory)

       deployment.user.tmp
                   $XDG_CACHE_HOME/icedtea-web/tmp (Possible: include an absolute path to a file or directory)


FILES
       $JAVA_HOME/lib/deployment.config
                   java-global deployment properties file. May be affected by deployment.jre.dir.

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

       $XDG_CONFIG_HOME/icedtea-web/generated_jnlps
                   Location where jnlp files generated from html pages for javaws applications desktop/menu launchers icons are stored

       $XDG_CONFIG_HOME/icedtea-web/icons
                   Location where icons of javaws applications desktop/menu launchers icons are stored

       $XDG_CONFIG_HOME/icedtea-web/log
                   contains file-log files (if enabled), itw-cplugin-date_time.log for native part of plugin, itw-javantx-date_time.log for everything else. Controlled by deployment.user.logdir


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




icedtea-web (rhel-1.el7-x86_64)                                                                  11 Apr 2018                                                                                itweb-settings(1)
