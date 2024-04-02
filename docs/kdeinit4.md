KDEINIT4(8)                                                                                   KDE User's Manual                                                                                   KDEINIT4(8)



NAME
       kdeinit4 - KDE process launcher.

SYNOPSIS
       kdeinit4 [--help] [[--no-fork] | [--no-kded] | [--suicide]] [[+programs] | [programs]]

DESCRIPTION
       kdeinit4 is a process launcher somewhat similar to the famous init used for booting UNIX. It executes KDE programs and kdeinit loadable modules (KLMs) starting them more efficiently.

       Using kdeinit4 to launch KDE applications makes starting a typical KDE application a couple times faster and reduces memory consumption by a substantial amount.

       kdeinit4 is linked against all libraries a standard KDE application needs. With this technique, starting an application becomes much faster because now only the application itself needs to be linked
       whereas otherwise both the application as well as all the libaries it uses need to be linked.

DISADVANTAGES
       The process name of applications started via kdeinit4 is "kdeinit4". This problem can be corrected to a degree by changing the application name as shown by ps. However, applications like killall
       will only see kdeinit4 as the process name. To workaround this, use kdekillall (from kdesdk/scripts) for applications started via kdeinit4.

OPTIONS
       --help
           Show help about options

       --no-fork
           Do not fork, i.e. do not exit until all the executed programs ends

       --no-kded
           Do not start kded

       --suicide
           Terminate when no KDE applications are left running

       +programs
           runs the programs handling requests

       programs
           runs the programs without handling requests

USAGE
       A standard way to run this program is by simply specifying the following command at the prompt kdeinit4 program or kdeinit4 +program

FILES
       /tmp/kde-$USER/kdeinit4_$INSTANCE
           ...

ENVIRONMENT VARIABLES
       $HOME
           Specifies the home directory of the current user

       $KDE_HOME_READONLY
           Specifies if the home directory of the current user is read only

       $KDE_IS_PRELINKED
           If set, tells kdeinit4 that the KDE programs are pre-linked.

           (Prelinking is a process that allows you to speed up the process of dynamic linking.)

       $KDE_DISPLAY
           If set, tells kdeinit4 that it is running on a KDE desktop.

SEE ALSO
       kded, kdekillall

BUGS
       There are probably tons of bugs. Use bugs.kde.org[1] to report them.

AUTHORS
       Waldo Bastian <bastian@kde.org>
           Author.

       Mario Weilguni <mweilguni@sime.com>
           Author.

       Lubos Lunak <l.lunak@kde.org>
           Author.

NOTES
        1. bugs.kde.org
           http://bugs.kde.org



0.01.01                                                                                           2008-10-03                                                                                      KDEINIT4(8)
