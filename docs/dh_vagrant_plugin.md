DH_VAGRANT_PLUGIN(1)                                                                                                                                                                                                                                                                               DH_VAGRANT_PLUGIN(1)

NAME
       dh_vagrant_plugin - packaging helper for vagrant plugins

SYNOPSIS
       gem2deb-test-runner [PACKAGE-NAME]

DESCRIPTION
       dh_vagrant_plugin installs the necessary metadata for vagrant to recognize plugins installed by Debian packages. To use it, you need to 1) make sure the package Ruby code is installed as in any other Ruby package, and 2) call dh_vagrant_plugin at the install phase of your package.

       If PACKAGE-NAME is omitted, it will be taken from the first line in the output of dh_list_packages(1).

       A sample debian/rules that should just work is as follows:

         #!/usr/bin/make -f

         export DH_RUBY = --gem-install

         %:
               dh $@ --buildsystem=ruby --with ruby

         override_dh_auto_install:
               dh_auto_install
               dh_vagrant_plugin

SEE ALSO
       vagrant(1), dh_list_packages(1).  EOF

                                                                                                                                                       2019-03-07                                                                                                                                  DH_VAGRANT_PLUGIN(1)
