EXO-PREFERRED-APPLICATIONS(1)                                                         User Commands                                                         EXO-PREFERRED-APPLICATIONS(1)

NAME
       exo-preferred-applications - Select preferred applications for Xfce desktop environment

DESCRIPTION
   Usage:
              exo-helper-1 [OPTION?]

   Help Options:
       -h, --help
              Show help options

       --help-all
              Show all help options

       --help-gtk
              Show GTK+ Options

   Application Options:
       -V, --version
              Print version information and exit

       -c, --configure
              Open the Preferred Applications

       configuration dialog

       -s, --socket-id=SOCKET ID
              Settings manager socket

       -l, --launch=TYPE [PARAMETER]
              Launch the default helper of TYPE with the optional PARAMETER, where TYPE is one of the following values.

       -q, --query=TYPE [PARAMETER]
              Query the default helper of TYPE, where TYPE is one of the following values.

       --display=DISPLAY
              X display to use

       The following TYPEs are supported for the --launch and --query commands:

       WebBrowser
              - The preferred Web Browser.

       MailReader
              - The preferred Mail Reader.

       FileManager
              - The preferred File Manager.

              TerminalEmulator - The preferred Terminal Emulator.

exo-preferred-applications 0.12.1                                                       June 2018                                                           EXO-PREFERRED-APPLICATIONS(1)
