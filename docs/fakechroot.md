FAKECHROOT(1)                                                                                                                        FAKECHROOT(1)

NAME
       fakechroot - gives a fake chroot environment

SYNOPSIS
       fakechroot [-s|--use-system-libs] [-l|--lib library] [-d|--elfloader ldso] [-e|--environment type] [-c|--config-dir directory]
       [-b|--bindir directory] [--] [command]

       fakechroot -h|--help

       fakechroot -v|--version

DESCRIPTION
       fakechroot runs a command in an environment where is additional possibility to use chroot(8) command without root privileges. This is
       useful for allowing users to create own chrooted environment with possibility to install another packages without need for root privileges.

       fakechroot replaces some C library functions (chroot(2), open(2), etc.)  by ones that simulate the effect of being called with root
       privileges.

       These wrapper functions are provided as a shared library libfakechroot.so which is loaded through the "LD_PRELOAD" mechanism of the dynamic
       loader.  (See ld.so(8))

       In fake chroot you can install i.e. Debian bootstrap with debootstrap(8) command. In such environment you can run i.e. apt-get(8) command
       to install another packages. You don't need a special privileges and you can run it on common user's account.

OPTIONS
       -l library|--lib library
           Specify an alternative wrapper library. The default is libfakechroot.so

       -d ldso|--elfloader ldso
           Specify an alternative dynamic linker. This dynamic linker will be invoked directly.

       -s|--use-system-libs
           Use system libraries before chroot's libraries. This might be a workaround if system dynamic linker can not load libc.so from fake
           chroot.

           Try this setting if you noticed following errors:

            $ fakechroot /usr/sbin/chroot /tmp/sarge /bin/true
            /bin/true: relocation error: /srv/sarge/lib/tls/libc.so.6: symbol _dl
            _starting_up, version GLIBC_PRIVATE not defined in file ld-linux.so.2
             with link time reference

            $ fakechroot /usr/sbin/chroot /tmp/centos4 /bin/true
            Segmentation fault

       -e|--environment type
           Load additional configuration with environment. This configuration file is a shell script which is executed before calling command. The
           script can set additional environment variables, like i.e.: "FAKECHROOT_EXCLUDE_PATH", "FAKECHROOT_CMD_SUBST" or "LD_LIBRARY_PATH".

           The environment type is guessed based on command name with optional extension removed (e.g. running gettext.sh loads "gettext"
           environment file). If command argument is fakeroot(1) this argument is omitted and next argument is taken as environment type.

           The configuration file name is type.env and is searched at $HOME/.fakechroot and /etc/fakechroot directories.

           The default environment type is default and its configuration file name is "default.env".

           The special environment none means that no environment settings are loaded at all.

       -c|--config-dir directory
           Specify a directory which contains additional configuration for fakechroot. The default directory are "$HOME/.fakechroot" and
           "/etc/fakechroot".

       -b|--bindir directory
           Specify a directory which contains the replacement executables shipped with fakechroot.  Those are script files with the extension
           ".fakechroot".  By default they are distributed over the "bin" and "sbin" directories in fakechroot's install prefix, but sometimes a
           fixed location at build time is not feasible.

       [--] command
           Any command you want to be ran as fakechroot. Use '--' if in the command you have other options that may confuse fakechroot's option
           parsing.

       -h  Display help.

       -v  Display version.

EXAMPLES
       An example session with fakechroot:

         $ id
         uid=1000(dexter) gid=1000(dexter) groups=1000(dexter)

         $ fakechroot fakeroot debootstrap sid /tmp/sid
         I: Retrieving Release
         I: Retrieving Release.gpg
         I: Checking Release signature
         ...
         I: Base system installed successfully.

         $ fakechroot fakeroot chroot /tmp/sid apt-get install -q hello
         Reading package lists...
         Building dependency tree...
         Reading state information...
         The following NEW packages will be installed:
           hello
         0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
         Need to get 57.4 kB of archives.
         After this operation, 558 kB of additional disk space will be used.
         Get:1 http://ftp.us.debian.org/debian/ sid/main hello amd64 2.8-4 [57.4 kB]
         Fetched 57.4 kB in 0s (127 kB/s)
         Selecting previously unselected package hello.
         (Reading database ... 24594 files and directories currently installed.)
         Unpacking hello (from .../archives/hello_2.8-4_amd64.deb) ...
         Processing triggers for man-db ...
         Processing triggers for install-info ...
         Setting up hello (2.8-4) ...

         $ fakechroot chroot /tmp/sid hello
         Hello, world!

FAKEROOT
       fakeroot(1) is a complementary tool which emulates root environment. fakeroot and fakechroot might wrap the same C library functions, i.e.
       mknod(2) function. It is important to start fake environment in proper order. fakeroot should be started inside fakechroot:

         $ fakechroot fakeroot chroot /tmp/sid /bin/mknod /tmp/device c 1 2

SECURITY ASPECTS
       fakechroot is a regular, non-setuid program. It does not enhance a user's privileges.

       fakechroot should not be used as a tool for enhancing system security i.e. by separating (sandboxing) applications. It is very easy to
       escape from a fake chroot environment.

       fakechroot should not be run with real root privileges. It might decrease the security of the system because the fakechroot provides own
       version of core functions with behavior depended on some environment variables.

FILES
       libfakechroot.so
           The shared library containing the wrapper functions.

ENVIRONMENT
       FAKECHROOT
           The value is true for fake chroot environment.

       FAKECHROOT_VERSION
           The version number of the current fakechroot library.

       FAKECHROOT_BASE
           The root directory of fake chroot environment.

       FAKECHROOT_DETECT
           If this variable is set then "fakechroot version" string is printed to standard output and the current process is terminated with
           status taken from this variable. It can be a method to check if fakechroot is preloaded correctly.

             $ case "`FAKECHROOT_DETECT=1 /bin/echo`" in fakechroot*) echo LOADED;; esac

       FAKECHROOT_DEBUG
           The fakechroot library will dump some debugging info if this variable is set.

       FAKECHROOT_AF_UNIX_PATH
           The root directory for unix sockets. The default value is the same as "FAKECHROOT_BASE" and it can be set separately if the
           "FAKECHROOT_BASE" is too long and the unix socket path could exceed the limit of 108 bytes.

       FAKECHROOT_EXCLUDE_PATH
           The list of directories which are excluded from being chrooted. The elements of list are separated with colon.

           The /dev, /proc and /sys directories are excluded by default if this environment variable is not set.

       FAKECHROOT_ELFLOADER
           A path to another dynamic linker (i.e. /lib/ld-linux.so.2 for i386 architecture, /lib64/ld-linux-x86-64.so.2 for x86_64 architecture).

           This dynamic linker will be invoked directly. The dynamic linker don't allow to change "argv[0]" besides the file name of the
           executable file, so some application won't work correctly, i.e. busybox(1).

       FAKECHROOT_CMD_SUBST
           A list of command substitutions. If a program tries to execute one of the commands given (path relative to the chroot, trailing dot is
           removed) then the substitute command runs instead (path to substitute command is not chrooted).

           The substituted command inherits "FAKECHROOT_*" variables but the original "FAKECHROOT_BASE" variable which is saved as
           "FAKECHROOT_BASE_ORIG". It means that substituted command runs outside fakechroot environment. Also original command name is saved as
           "FAKECHROOT_CMD_ORIG".

           For example:

             export FAKECHROOT_CMD_SUBST=/usr/bin/mkfifo=/bin/true

           will substitute "/bin/true" for "/usr/bin/mkfifo" and will make possible to install sysvinit binary package.

           Give as many substitute commands as you want, separated by ":" (colon) characters.

           It is suggested to substitute at least:

           · "/bin/mount=/bin/true"

           · "/sbin/insserv=/bin/true"

           · "/sbin/ldconfig=/bin/ldconfig"

           · "/usr/bin/env=/usr/bin/env.fakechroot"

           · "/usr/bin/ischroot=/bin/true"

           · "/usr/bin/ldd=/usr/bin/ldd.fakechroot"

           · "/usr/bin/mkfifo=/bin/true"

           to make debootstrap(8) working correctly.

           To prevent some looping, the command substitution is done only if "FAKECHROOT_CMD_ORIG" variable is not set currently.

       LD_LIBRARY_PATH, LD_PRELOAD
           Fakechroot is implemented by wrapping system calls. This is accomplished by setting "LD_PRELOAD=libfakechroot.so". If this library
           can't be found by dynamic linker, the /etc/ld.so.conf file or "LD_LIBRARY_PATH" variable have to be modified.

LIMITATIONS
       ·   /lib/ld-linux.so.2 and /lib64/ld-linux-x86-64.so.2 are always loaded from real environment. This path is hardcoded by linker for all
           binaries.  You can set the "FAKECHROOT_ELFLOADER" environment variable or use "--elfloader" option.

       ·   Every command executed within fakechroot needs to be linked to the same version of the dynamic linker from real environment. If the
           libraries in chroot are not compatible, try to use "--use-system-libs" option.

       ·   You can provide symlinks to the outside. The symlink have to be created before chroot is called. It can be useful for accessing the
           real /proc and /dev directory. You can also set the "FAKECHROOT_EXCLUDE_PATH" environment variable:

             $ export FAKECHROOT_EXCLUDE_PATH=/tmp:/proc:/dev:/sys:/var/run:/home

       ·   Statically linked binaries doesn't work, especially ldconfig(8), so you have to wrap this command with dummy version and set the proper
           "FAKECHROOT_CMD_SUBST" environment variable.

       ·   ldd(1) also doesn't work. You have to use "alias ldd='LD_TRACE_LOADED_OBJECTS=1'" or to use a wrapper instead. The wrapper is installed
           as ldd.fakechroot and can be used with "FAKECHROOT_CMD_SUBST" environment variable.

       ·   The full screen applications hangs up if /dev/tty file is not a real device. Link /dev/tty file or whole /dev directory to the real one
           or remove it from fake chroot environment with "FAKECHROOT_EXCLUDE_PATH" variable.

       ·   lckpwdf(3) and ulckpwdf(3) are ignored so passwd(1) command should work

       ·   Your real uid should exist in /etc/passwd. Create it with adduser --uid realuid realuser inside fake chroot environment.

       ·   debuild(1) cleans environment. Use --preserve-env option to prevent this behavior.

       ·   rpmbuild(8) uses own glob(3) implementation which breaks fakechroot so buildroot directory have to be the same inside and outside
           fakechroot.

SEE ALSO
       fakeroot(1), debuild(1), debootstrap(8), rinse(8), http://fakechroot.alioth.debian.org/

BUGS
       If you find the bug or want to implement new features, please report it at <https://github.com/fakechroot/fakechroot/issues>

AUTHORS
       Copyright (c) 2003, 2005, 2007-2011, 2013 Piotr Roszatycki <dexter@debian.org>

       Copyright (c) 2007 Mark Eichin <eichin@metacarta.com>

       Copyright (c) 2006, 2007 Alexander Shishkin <virtuoso@slind.org>

       Copyright (c) 2006, 2007 Lionel Tricon <lionel.tricon@free.fr>

COPYING
       fakechroot is distributed under the GNU Lesser General Public License (LGPL 2.1 or greater).

fakechroot                                                          29 Nov 2013                                                      FAKECHROOT(1)
