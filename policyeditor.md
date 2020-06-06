policyeditor(1)                                                                            General Commands Manual                                                                            policyeditor(1)



NAME
       policyeditor - view and modify security policy settings for javaws and the browser plugin


SYNOPSIS
       policyeditor
       policyeditor [-file] policy_file

DESCRIPTION
       policyeditor  is  a  GUI  application with small command line support to view and edit applet security policy settings used by the IcedTea-Web implementation of javaws and the browser plugin.  It is
       intended as a simpler, easier to use, and more accessible alternative to the standard JDK Policy Tool.  Administrators and power users who need fine grained control over policy files should probably
       use Policy Tool instead of PolicyEditor.

       If  executed  without any arguments, no file is opened, and saving the file will result in a prompt on where to save it. Otherwise, if a file path is given as a command line argument, then that file
       path will be opened and parsed as policy file.


OPTIONS
       -codebase url
                   Specifies an applet codebase URL. This can be used with the other selector options to select a policy entry upon opening the editor; if no such identifier exists then it will be  created
                   and then selected.(Exactly one argument expected)

       -defaultfile
                   Specifies  that  the  default  user-level policy file should be opened. This is the file which is normally used by IcedTea-Web to make decisions about custom policies and permissions for
                   applets at runtime, unless configured otherwise.(No argument expected)

       -file policy_file
                   Specifies a policy file path to open. If exactly one argument is given, and it is not this flag, it is interpreted as a file path to open, as if this flag  was  given  first.  This  flag
                   exists mostly for compatibility with Policy Tool.(Exactly one argument expected)

       -help       Prints out information about supported command and basic usage.(No argument expected)

       -principals class_name principal_name
                   Specifies  class  name/principal  name pairs (space-separated) for the policy entry identifier. This can be used with the other selector options to select a policy entry upon opening the
                   editor; if no such identifier exists then it will be created and then selected.(Expected even number of arguments with param=value as valid argument)

       -signedby certificate_alias
                   Specifies a certificate alias for a certificate stored in the keystore. This can be used with the other selector options to select a policy entry upon opening  the  editor;  if  no  such
                   identifier exists then it will be created and then selected.(Exactly one argument expected)

       -verbose    Enable verbose output.(No argument expected)


EXAMPLES
       policyeditor
                   Show the GUI editor with no file opened.

       policyeditor -file $XDG_CONFIG_HOME/icedtea-web/security/java.policy
                   Show GUI and opens the default policy file.


FILES
       $XDG_CACHE_HOME/icedtea-web/cache/recently_used
                   Additional information about items in cache

       $XDG_CONFIG_HOME/icedtea-web/security/java.policy
                   Contains granted permissions for selected unsigned apps. Controlled by deployment.user.security.policy



       Where $XDG_CONFIG_DIR, $XDG_CACHE_DIR and $XDG_RUNTIME_DIR are  set  as ~/.config, ~/.cache and /tmp or /var/tmp if not set.

BUGS
       There aren't any known bugs. If you come across one, please file it at:
       http://icedtea.classpath.org/wiki/IcedTea-Web#Filing_bugs
       http://icedtea.classpath.org/bugzilla

       Please  run  in debug (-verbose switch or itw-settings setting or ICEDTEAPLUGIN_DEBUG variable set to true) mode and include that output (best is from java console) with URL to jnlp or html file (or
       the jnlp/html file or  application itself) when filing out the bug report.


AUTHOR
       The following people have made contibutions to this project.
       Please keep this list in alphabetical order.
       Lillian Angel <langel@redhat.com>Andrew Azores <aazores@redhat.com>Deepak Bhole  <dbhole@redhat.com>Adam  Buchta  <adbuch7@gmail.com>Ricardo  Martín  Camarero  <rickyepoderi@yahoo.es>Marcin  Cieslak
       <marcin.cieslak@gmail.com>Danesh  Dadachanji  <ddadacha@redhat.com>Adam  Domurad <adomurad@redhat.com>Lukasz Dracz <ldracz@redhat.com>Thomas Fitzsimmons <fitzsim@redhat.com>Michał Górny <mgorny@gen‐
       too.org>Mark Greenwood <mark@dcs.shef.ac.uk>Tereza Hlavackova <hlavackova.tereza@gmail.com>Peter Hatina <phatina@redhat.com>Andrew John  Hughes  <ahughes@redhat.com>Jie  Kang  <jkang@redhat.com>Alex
       Kashchenko <akashche@redhat.com>Matthias Klose <doko@ubuntu.com>Alexandr Kolouch <skolnag@gmail.com>Jan Kmetko <jan.kmetko.ml@gmail.com>Francis Kung <fkung@redhat.com>Denis Lila <dlila@redhat.com>DJ
       Lucas <dj@lucasit.com>Omair Majid <omajid@redhat.com>Jon A. Maxwell <jmaxwell@users.sourceforge.net>Thomas  Meyer  <thomas@m3y3r.de>Kurt  Miller  <kurt@intricatesoftware.com>Saad  Mohammad  <smoham‐
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




icedtea-web (rhel-1.el7-x86_64)                                                                  11 Apr 2018                                                                                  policyeditor(1)
