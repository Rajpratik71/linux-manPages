OPENBOX(1)                                                    General Commands Manual                                                   OPENBOX(1)

NAME
       openbox-session — Runs an Openbox session without any session manager.

DESCRIPTION
       openbox-session  runs  an  openbox  session without any session manager. Without a session manager, you will not be able to save your state
       from one log in to the next.

       openbox-session does not take any command line arguments.

       On log in, openbox-session will run the ~/.config/openbox/autostart script if it exists, and will run the system-wide script /etc/xdg/open‐
       box/autostart otherwise. You may place anything you want to run automatically in those files, for example:

              xsetroot -solid grey &
              gnome-settings-daemon &

       Make sure that each line is followed by a "&" or else the script will stop there and further commands will not be executed. You can use the
       /etc/xdg/openbox/autostart file as an example for creating your own.

SEE ALSO
       openbox(1), openbox-session(1), openbox-gnome-session(1).

       The program's full documentation is available on the website: http://openbox.org/

       Please report bugs to: http://bugzilla.icculus.org/

                                                                                                                                        OPENBOX(1)
