IM-CONFIG(8)                                                                             System Manager's Manual                                                                             IM-CONFIG(8)

NAME
       im-config - set up input method configuration for X Window System

SYNOPSIS
       im-config [OPTION]

OPTIONS
       -a      List all; force to list all possible input methods in menu or STDOUT even if any associated packages are not installed on the system.

       -c      Use console dialogue.

       -x      Use X dialogue with zenity.

       -s      No action; perform a simulation of events that would occur but do not actually change configuration files.

       -l      List all available input method configuration settings to STDOUT.  Unless -a is used, list only ones with associated packages installed.

       -m      List configuration values to STDOUT:
               ·   active configuration (system)
               ·   active configuration (user)
               ·   automatic configuration for the current locale
               ·   override configuration for the current locale
               ·   automatic configuration for most locales
               If the active configuration is custom, the user made a custom configuration and im-config should not change it.

       -n      <input method name>

               Set  input  method  to <input method name>. This option is for other configuration tool to set the input method.  Since the default value of <input method name> is "auto", you usually do
               not need to use this from other configuration script.

               Specifying invalid <input method name> causes the error exit. Updating the configuration file which was not updated by im-config also causes the error exit.

               When this <input method name> is "REMOVE" then it always removes the configuration file even if it was not updated by im-config.

       -o      <input method name>

               Print the localized description of the input method <input method name> to STDOUT.

       The -l, -m, -n, and -o options are meant to be API for other programs to control the im-config.

DESCRIPTION
       This manual page very briefly documents im-config and the configuration of the input method.

       im-config provides the framework to configure the input method on X Window System with GTK GUI or console terminal dialogue. If this is invoked without option, this lists available input methods
       as  its  choice  while  marking  automatic  choice with trailing @-mark. The listing is ordered by the priority of the input method.  The input method with the highest priority comes first.  The
       availability of the input method is judged by the installation of any associated packages. After you make a choice for the input method, this displays a guidance for associated  packages  to  be
       installed.

       If only a set of required input method packages along with the im-config package is installed, you do not need to use this command.  Such a installation works well in its default and there is no
       need to use this command.  When you wish to have multiple input method environments installed and wish to switch among them, you need to use this command.

       If you have no idea for what package to install, im-config invoked with both -a and -s is a good start.

       This input method is the essential mechanism for Japanese, Chinese and Korean (CJK) languages to enter their non-ASCII native characters.  This is also useful  to  support  specialized  keyboard
       bindings for other non-European languages such as Indic and other Asian languages.

       Some  input  methods  such as IBus, fcitx, and uim support not only one of these CJK languages but support almost all languages simultaneously by dynamically switching keyboard modes with GUI on
       the fly.

       The im-config package installs a hook script /etc/X11/Xsession.d/70im-config_launch. When X starts, it sources this file as a POSIX shell code.  Then this hook script tries to  source  the  user
       configuration file ~/.xinputrc, if it exists.  Otherwise, this hook script sources the system configuration file /etc/X11/xinit/xinputrc.

       im-config  invoked  from  a user account updates the user configuration file ~/.xinputrc.  im-config invoked from the root account updates the system configuration file ~/etc/X11/xinit/xinputrc.
       The essential contents of generated files are:

       run_im <input method name>

       When these files are sourced, the run_im shell function instructs to source the initialization code for the corresponding input method. This initialization code is defined in the <2 digits  num‐
       ber>_<input method name>.rc file in /usr/share/im-config/data.

       The im-config hook script, /etc/X11/Xsession.d/70im-config_launch, exports following variables to X programs: $XMODIFIERS, $GTK_IM_MODULE, $QT_IM_MODULE, $QT4_IM_MODULE, and $CLUTTER_IM_MODULE.

       The im-config hook script, /etc/X11/Xsession.d/70im-config_launch, also set $STARTUP to use /usr/bin/im-launch for starting required daemons.

       If  you  wish to create a custom configuration beyond what im-config can do for you, please copy one of these initialization code files into ~/.xinputrc or /etc/X11/xinit/xinputrc and edit it to
       suite your need.  For example, 02_cjkv.rc tells how input method can be customized for each locale.  This script should be written to set environment variables if "$IM_CONFIG_PHASE" = 1  and  to
       start daemon programs if "$IM_CONFIG_PHASE" = 2 .

       Please note that this <2 digits number> part of these configuration files may change for every new releases of the im-config package.

       When  a user makes manual changes to ~/.xinputrc or /etc/X11/xinit/xinputrc without using im-config, im-config will detect it using a md5sum hush value embedded in the shell comment and will not
       overwrite such files.  You must erase them manually if you wish to replace them with ones created by im-config.

       The <2 digits number>_<input method name>.conf files in /usr/share/im-config/data provide the UI data for im-config and the heuristic logic of selecting desirable input  method  under  the  auto
       mode.  The smaller number of the <2 digits number> indicates the higher priority of <input method name>.

       These <2 digits number>_<input method name>.conf files defines few variables and functions.  The value of IM_CONFIG_SHORT is the short description of the input method for the menu.  The value of
       IM_CONFIG_LONG is the long description of the input method explaining its package dependency.  The package_menu shell function defines as a function to return true if any associated input method
       packages  are installed to activate its menu entry.  The package_auto shell function defines as a function to return true if the sufficient input method packages are installed for the auto mode.
       These definitions use the package_status shell function which takes package name as its argument and returns true if it is installed properly.

       The menu lists input methods with the <2 digits number> between 00 and 89.  The auto mode considers its input method candidate from <2 digits number> between 10 and 79 in this order.  The  usage
       convention of <2 digits number> is:

       00-09:  Input Method choice mode       (default/auto/cjkv/REMOVE)

       10-49:  Input Method supporting multiple languages.(auto ready)

       50-79:  Input Method supporting limited languages. (auto ready)

       80-89:  Input Method (deprecated one) (not for auto)

       90-99:  Used internally by im-config (not for auto)

       This structure ensures to have different input methods to be installed side-by-side with minimal user configurations.

TROUBLESHOOT
       If  you  have  any problem, see the first part of ~/.xsession-errors and look for the cause.  If you are running im-config while Debian (sid) system is undergoing a major library transition, you
       may need to manually set up ~/.xinputrc with adjusted library version number etc.  Please file a bug report to the im-config package using reportbug(1) describing your resolution experience.

SEE ALSO
       /usr/share/doc/im-config/README.Debian.gz

AUTHOR
       This manual page was written by Osamu Aoki <osamu@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                                                                                                                                             IM-CONFIG(8)
