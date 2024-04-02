yum-groups-manager(1)                                                                                                                                                                   yum-groups-manager(1)



NAME
       yum-groups-manager - create and edit yum's group metadata

SYNOPSIS
       yum-groups-manager [options] [packages]

DESCRIPTION
       yum-groups-manager  is  used  to create or edit a group metadata file for a yum repository. This is often much easier than writing/editing the XML by hand.  The yum-groups-manager can load an entire
       file of groups metadata and either create a new group or edit an existing group and then write all of the groups metadata back out.

OPTIONS
       -h, --help
              Display a help message, and then quit.

       --version
              Display a version message, and then quit.

       -n, --name
              The name to lookup/use for the group. If you specify an existing group id, then the group with that id will have it's name changed to this value.

       --id   The id to lookup/use for the group. If you don't specify an id, but do specify a name that doesn't refer to an existing group, then an id for the group is generated based on the name.

       --description
              The description to use for the group.

       --mandatory
              Store the package names specified within the mandatory section of the specified group, the default is to use the default section. This overrides the optional argument.

       --optional
              Store the package names specified within the optional section of the specified group, the default is to use the default section. This option is overridden by the mandatory argument.

       --dependencies
              Also include the names of the direct dependencies for each package specified.

       --not-user-visible
              Make the group not visible in yum grouplist.

       --user-visible
              Make the group visible in yum grouplist (this is the default).

       --display-order
              Change the integer which controls the order groups are presented in, for example in yum grouplist.

       --load Load the groups metadata information from the specified file, before performing any operations. This option can be specified multiple times.

       --save Save the result to this file, you can specify the name of a file you are loading from as the data will only be saved when all the operations have been performed. This option can also be spec‐
              ified multiple times.

       --merge
              This is the same as loading and saving a file, however the "merge" file is loaded before any others and saved last.

       --print
              Also print the result to stdout, if saving or merging.

       --remove
              Instead of adding package, remove them. Note that the packages are removed from all sections (default, mandatory and optional).

       --translated-name
              This is another name for the group within the locale given. The syntax is lang:text. Eg. en:my-group-name-in-english

       --translated-description
              This is another description for the group within the locale given. The syntax is lang:text. Eg. en:my-group-description-in-english.


YUM OPTIONS
       The following options are meant to be the same as those with the same name in yum.

       -c CONFIG, --config=CONFIG

       --quiet

       --verbose

       --enablerepo

       --disablerepo

       --noplugins

       -C, --cache

       --tempcache


EXAMPLES
       Create a new group metadata file, with a group called yum containing all the packages that start with yum:
               yum-groups-manager --name YUM --save groups.xml 'yum*'

       After the above command, load the groups.xml data, work with the yum group, make the group not user visible, and remove the yum-skip-broken and yum-priorities packages from it:
               yum-groups-manager -n YUM --merge groups.xml --remove yum-skip-broken yum-priorities --not-user-visible

       After the above commands, add a description and a translated name to the yum group:
               yum-groups-manager -n YUM --merge groups.xml --description 'This is a group with most of the yum packages in it' --translated-name 'en:yum packages'

FILES
       yum-groups-manager uses the yum libraries for retrieving information and packages. If no configuration file is specified, the default yum configuration will be used.

       /etc/yum.conf
       /etc/yum/repos.d/

SEE ALSO
       yum (8)
       yum.conf (5)
       http://yum.baseurl.org/

AUTHORS
       See the Authors file included with this program.

BUGS
       There are a couple of options you can't set, yet. Most notably you cannot put
       package names into the conditional section (where they are installed with
       groupinstall only if another package is installed).

       Other than that, there are no bugs, but should you find any, you should first
       consult the FAQ section on http://yum.baseurl.org/wiki/Faq and if unsuccessful
       in finding a resolution contact the mailing list: yum-devel@lists.baseurl.org.
       To file a bug use http://bugzilla.redhat.com for Fedora/RHEL/Centos
       related bugs and http://yum.baseurl.org/report for all other bugs.




                                                                                                23 August 2008                                                                          yum-groups-manager(1)
