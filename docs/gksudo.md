GKSU(1)                                                            User Commands                                                           GKSU(1)

NAME
       gksu - GTK+ frontend for su and sudo

SYNOPSIS
       gksu

       gksu [-u <user>] [options] <command>

       gksudo [-u <user>] [options] <command>

DESCRIPTION
       This manual page documents briefly gksu and gksudo

       gksu  is  a frontend to su and gksudo is a frontend to sudo.  Their primary purpose is to run graphical commands that need root without the
       need to run an X terminal emulator and using su directly.

       Notice that all the magic is done by the underlying library, libgksu. Also notice that the library will decide if it should use su or  sudo
       as  backend  using the /apps/gksu/sudo-mode gconf key, if you call the gksu command. You can force the backend by using the gksudo command,
       or by using the --sudo-mode and --su-mode options.

       If no command is given, the gksu program will display a small window that allows you to type in a command to be run,  and  to  select  what
       user the program should be run as. The other options are disregarded, right now, in this mode.

OPTIONS
       --debug, -d

              Print information on the screen that might be useful for diagnosing and/or solving problems.

       --user <user>, -u <user>

              Call <command> as the specified user.

       --disable-grab, -g

              Disable the "locking" of the keyboard, mouse, and focus done by the program when asking for password.

       --prompt, -P

              Ask the user if they want to have their keyboard and mouse grabbed before doing so.

       --preserve-env, -k

              Preserve the current environments, does not set $HOME nor $PATH, for example.

       --login, -l

              Make  this  a login shell. Beware this may cause problems with the Xauthority magic. Run xhost to allow the target user to open win‐
              dows on your display!

       --description <description|file>, -D <description|file>

              Provide a descriptive name for the command to be used in the default message, making it nicer.  You can also  provide  the  absolute
              path for a .desktop file. The Name key for will be used in this case.

       --message <message>, -m <message>

              Replace  the  standard message shown to ask for password for the argument passed to the option.  Only use this if --description does
              not suffice.

       --print-pass, -p

              Ask gksu to print the password to stdout, just like ssh-askpass. Useful to use in scripts with programs that  accept  receiving  the
              password on stdin.

       --su-mode, -w

              Force gksu to use su(1) as its backend for running the programs.

       --sudo-mode, -S

              Force gksu to use sudo(8) as its backend for running the programs.

SEE ALSO
       su(1), sudo(8)

gksu version 2.0.x                                                  August 2006                                                            GKSU(1)
