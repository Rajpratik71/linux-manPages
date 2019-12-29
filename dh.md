DH(1)                                          Debhelper                                         DH(1)

NAME
       dh - debhelper command sequencer

SYNOPSIS
       dh sequence [--with addon[,addon ...]] [--list] [debhelper options]

DESCRIPTION
       dh runs a sequence of debhelper commands. The supported sequences correspond to the targets of
       a debian/rules file: build-arch, build-indep, build, clean, install-indep, install-arch,
       install, binary-arch, binary-indep, and binary.

OVERRIDE TARGETS
       A debian/rules file using dh can override the command that is run at any step in a sequence, by
       defining an override target.

       To override dh_command, add a target named override_dh_command to the rules file. When it would
       normally run dh_command, dh will instead call that target. The override target can then run the
       command with additional options, or run entirely different commands instead. See examples
       below.

       Override targets can also be defined to run only when building architecture dependent or
       architecture independent packages.  Use targets with names like override_dh_command-arch and
       override_dh_command-indep.  (Note that to use this feature, you should Build-Depend on
       debhelper 8.9.7 or above.)

OPTIONS
       --with addon[,addon ...]
           Add the debhelper commands specified by the given addon to appropriate places in the
           sequence of commands that is run. This option can be repeated more than once, or multiple
           addons can be listed, separated by commas.  This is used when there is a third-party
           package that provides debhelper commands. See the PROGRAMMING file for documentation about
           the sequence addon interface.

           A Build-Depends relation on the package dh-sequence-addon implies a --with addon. This
           avoids the need for an explicit --with in debian/rules that only duplicates what is already
           declared via the build dependencies in debian/control.  The relation can (since 12.5) be
           made optional via e.g.  build-profiles.  This enables you to easily disable an addon that
           is only useful with certain profiles (e.g. to facilitate bootstraping).

           Since debhelper 12.5, addons can also be activated in indep-only mode (via Build-Depends-
           Indep) or arch-only mode (via Build-Depends-Arch). Such addons are only active in the
           particular sequence (e.g. binary-indep) which simplifies dependency management for cross-
           builds.

           Please note that addons activated via Build-Depends-Indep or Build-Depends-Arch are subject
           to additional limitations to ensure the result is deterministic even when the addon is
           unavailable (e.g. during clean).  This implies that some addons are incompatible with these
           restrictions and can only be used via Build-Depends (or manually via debian/rules).
           Currently, such addons can only add commands to sequences.

       --without addon
           The inverse of --with, disables using the given addon. This option can be repeated more
           than once, or multiple addons to disable can be listed, separated by commas.

       --list, -l
           List all available addons.

           When called only with this option, dh can be called from any directory (i.e. it does not
           need access to files from a source package).

       --no-act
           Prints commands that would run for a given sequence, but does not run them.

           Note that dh normally skips running commands that it knows will do nothing.  With --no-act,
           the full list of commands in a sequence is printed.

       Other options passed to dh are passed on to each command it runs. This can be used to set an
       option like -v or -X or -N, as well as for more specialised options.

EXAMPLES
       To see what commands are included in a sequence, without actually doing anything:

               dh binary-arch --no-act

       This is a very simple rules file, for packages where the default sequences of commands work
       with no additional options.

               #!/usr/bin/make -f
               %:
                       dh $@

       Often you'll want to pass an option to a specific debhelper command. The easy way to do with is
       by adding an override target for that command.

               #!/usr/bin/make -f
               %:
                       dh $@

               override_dh_strip:
                       dh_strip -Xfoo

               override_dh_auto_configure:
                       dh_auto_configure -- --with-foo --disable-bar

       Sometimes the automated dh_auto_configure(1) and dh_auto_build(1) can't guess what to do for a
       strange package. Here's how to avoid running either and instead run your own commands.

               #!/usr/bin/make -f
               %:
                       dh $@

               override_dh_auto_configure:
                       ./mondoconfig

               override_dh_auto_build:
                       make universe-explode-in-delight

       Another common case is wanting to do something manually before or after a particular debhelper
       command is run.

               #!/usr/bin/make -f
               %:
                       dh $@

               override_dh_fixperms:
                       dh_fixperms
                       chmod 4755 debian/foo/usr/bin/foo

       Python tools are not run by dh by default, due to the continual change in that area. Here is
       how to use dh_python2.

               #!/usr/bin/make -f
               %:
                       dh $@ --with python2

       Here is how to force use of Perl's Module::Build build system, which can be necessary if
       debhelper wrongly detects that the package uses MakeMaker.

               #!/usr/bin/make -f
               %:
                       dh $@ --buildsystem=perl_build

       Here is an example of overriding where the dh_auto_* commands find the package's source, for a
       package where the source is located in a subdirectory.

               #!/usr/bin/make -f
               %:
                       dh $@ --sourcedirectory=src

       And here is an example of how to tell the dh_auto_* commands to build in a subdirectory, which
       will be removed on clean.

               #!/usr/bin/make -f
               %:
                       dh $@ --builddirectory=build

       If your package can be built in parallel, please either use compat 10 or pass --parallel to dh.
       Then dpkg-buildpackage -j will work.

               #!/usr/bin/make -f
               %:
                       dh $@ --parallel

       If your package cannot be built reliably while using multiple threads, please pass
       --no-parallel to dh (or the relevant dh_auto_* command):

               #!/usr/bin/make -f
               %:
                       dh $@ --no-parallel

       Here is a way to prevent dh from running several commands that you don't want it to run, by
       defining empty override targets for each command.

               #!/usr/bin/make -f
               %:
                       dh $@

               # Commands not to run:
               override_dh_auto_test override_dh_compress override_dh_fixperms:

       A long build process for a separate documentation package can be separated out using
       architecture independent overrides.  These will be skipped when running build-arch and binary-
       arch sequences.

               #!/usr/bin/make -f
               %:
                       dh $@

               override_dh_auto_build-indep:
                       $(MAKE) -C docs

               # No tests needed for docs
               override_dh_auto_test-indep:

               override_dh_auto_install-indep:
                       $(MAKE) -C docs install

       Adding to the example above, suppose you need to chmod a file, but only when building the
       architecture dependent package, as it's not present when building only documentation.

               override_dh_fixperms-arch:
                       dh_fixperms
                       chmod 4755 debian/foo/usr/bin/foo

INTERNALS
       If you're curious about dh's internals, here's how it works under the hood.

       In compat 10 (or later), dh creates a stamp file debian/debhelper-build-stamp after the build
       step(s) are complete to avoid re-running them.  It is possible to avoid the stamp file by
       passing --without=build-stamp to dh.  This makes "no clean" builds behave more like what some
       people expect at the expense of possibly running the build and test twice (the second time as
       root or under fakeroot(1)).

       Inside an override target, dh_* commands will create a log file debian/package.debhelper.log to
       keep track of which packages the command(s) have been run for.  These log files are then
       removed once the override target is complete.

       In compat 9 or earlier, each debhelper command will record when it's successfully run in
       debian/package.debhelper.log. (Which dh_clean deletes.) So dh can tell which commands have
       already been run, for which packages, and skip running those commands again.

       Each time dh is run (in compat 9 or earlier), it examines the log, and finds the last logged
       command that is in the specified sequence. It then continues with the next command in the
       sequence.

       A sequence can also run dependent targets in debian/rules.  For example, the "binary" sequence
       runs the "install" target.

       dh uses the DH_INTERNAL_OPTIONS environment variable to pass information through to debhelper
       commands that are run inside override targets. The contents (and indeed, existence) of this
       environment variable, as the name might suggest, is subject to change at any time.

       Commands in the build-indep, install-indep and binary-indep sequences are passed the -i option
       to ensure they only work on architecture independent packages, and commands in the build-arch,
       install-arch and binary-arch sequences are passed the -a option to ensure they only work on
       architecture dependent packages.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

12.6.1ubuntu2                                 2019-09-17                                         DH(1)
