pdebuild(1)                                                          pbuilder                                                          pdebuild(1)

NAME
       pdebuild - pbuilder way of doing debuild

SYNOPSIS
       pdebuild [pdebuild options] -- [pbuilder options]

DESCRIPTION
       A  convenience  program  for  pbuilder which invokes pbuilder after obtaining appropriate root privilege in a Debian source directory.  One
       must be inside the source tree containing the debian directory.

       By default, build log file is stored in ../<package>_<version>_<arch>.build.

PDEBUILD OPTIONS
       The options have the form --option name which modify the operation semantics as explained below.  They are applied from left to right,  and
       when options conflict, the option that appear later take precedence.

       --buildsourceroot [fakeroot]
              The command used to gain root privilege for invoking dpkg-buildpackage

       --pbuilderroot [sudo -E]
              The command used to gain root privilege for invoking pbuilder.

       --pbuildersatisfydepends [/usr/lib/pbuilder/pbuilder-satisfydepends]
              The command used to satisfy (i.e. install) build-dependencies.

       --architecture

              Set architecture.  This is currently required when it doesn't match the host architecture.

       --auto-debsign

              Invoke debsign at the end of pdebuild process.

       --debsign-k [key-id]
              Pass -k option to debsign to specify which key-id to sign with.

       --buildresult [Directory for build results]

              The place where the build result is stored.

              Note that for pdebuild, buildresult needs to be specified as a pdebuild option on the command-line, not as a pbuilder option.

              Note that the default value for buildresult is what is defined for pbuilder, which is /var/cache/pbuilder/result and not ..

       --configfile [Extra config file to use]

              The configuration file is used, and passed on to pbuilder.

       --debbuildopts [options to pass to dpkg-buildpackage]

              The  space-delimited list of options are passed to dpkg-buildpackage.  This option appends to pbuilder option --debbuildopts and may
              also be used to reset the list of options by passing the empty string.

              Multiple options are delimited with spaces.

              Note that for pdebuild, debbuildopts needs to be specified as a pdebuild option in the command-line, not as a pbuilder option.

       --use-pdebuild-internal
              Uses a different implementation of pdebuild, which calls clean and build inside the chroot, using bind-mounts.

              pdebuild-internal tries to run debian/rules clean inside the chroot.  To do so, the  working  directory  is  passed  on  inside  the
              chroot, in the form of bind-mounting and debuild is run.

              This option will not protect the working directory and its parent directories from the build scripts.

       --logfile [file to log]
              Specifies  the  build  logfile  to create.  The messages generated during execution will be written to the file, as well as standard
              output.

       --pbuilder [pbuilder]
              Specifies which command to invoke as pbuilder.

       --help

              Show a brief help message.

       -- [pbuilder options]

              After the -- symbol, an arbitrary number of pbuilder options can be specified.  See pbuilder(8) for a full list of options.

              There is an exception that --buildresult and --debbuildopts need to be specified as pdebuild options before the -- in  order  to  be
              effective.

FILES
       /etc/pbuilderrc
              The configuration file for pbuilder, used in pdebuild.

       /usr/share/pbuilder/pbuilderrc
              The default configuration file for pbuilder, used in pdebuild.

       ${HOME}/.pbuilderrc
              Configuration file for pbuilder, used in pdebuild.  It overrides /etc/pbuilderrc

EXAMPLES
       pdebuild

              $ pwd
              /home/dancer/DEBIAN/cowdancer/cowdancer
              $ ls debian/rules
              debian/rules
              $ pdebuild
              W: /home/dancer/.pbuilderrc does not exist
              dpkg-buildpackage: source package is cowdancer
              dpkg-buildpackage: source version is 0.26
              dpkg-buildpackage: source changed by Junichi Uekawa <dancer@debian.org>
              dpkg-buildpackage: source version without epoch 0.26
               fakeroot debian/rules clean
              dh_testdir
              dh_testroot
              rm -f build-stamp configure-stamp
              /usr/bin/make clean
              make[1]: Entering directory `/home/dancer/DEBIAN/cowdancer/cowdancer'
              rm -f *~ *.o *.lo libcowdancer.so cow-shell cowbuilder
              make[1]: Leaving directory `/home/dancer/DEBIAN/cowdancer/cowdancer'
              dh_clean
               dpkg-source -b cowdancer
              dpkg-source: warning: source directory `./cowdancer' is not <sourcepackage>-<upstreamversion> `cowdancer-0.26'
              dpkg-source: building cowdancer in cowdancer_0.26.tar.gz
                   .
                   .
                   .

BUGS
       pdebuild will accept all options that pbuilder accepts as pdebuild option.  However, unless the option is documented in the manual page, it
       may be ignored.

AUTHOR
       Initial coding and main maintenance is done by Junichi Uekawa <dancer@debian.org>.

       The homepage is http://pbuilder.alioth.debian.org

SEE ALSO
       /usr/share/doc/pbuilder/pbuilder-doc.html, pbuilder(8), pbuilderrc(5)

Debian                                                              2006 May 24                                                        pdebuild(1)
