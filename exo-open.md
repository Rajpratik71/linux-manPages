EXO-OPEN(1)                                                      Xfce Users Manual                                                     EXO-OPEN(1)

NAME
       exo-open - Open URLs and launch preferred applications

SYNOPSIS
       exo-open [[url]...]

       exo-open --launch [category] [[parameter]...]

DESCRIPTION
       exo-open is a command line frontend to the Xfce Preferred Applications framework. It can either be used to open a list of urls with the
       default URL handler or launch the preferred application for a certain category.

INVOCATION
       exo-open either takes a list of URLs and tries to open each of them using the default handler, or, when using the --launch tries to launch
       the preferred application for a certain category, optionally passing any number of parameters to the application.

   Options
       -?, --help
           Print brief help and exit.

       -v, --version
           Print version information and exit.

       --working-directory directory
           When using the --launch option and this option is specified as well, the application will be run in the given directory. This is
           primarily useful when running the preferred TerminalEmulator from another application and you want the command in the terminal window
           to be run in a specific directory.

       --launch category parameters...
           Launch the preferred application for the given category with the optional parameters..., where category is either WebBrowser,
           MailReader, TerminalEmulator or FileManager.

       If you do not specify the --launch option, exo-open will open all specified URLs with their preferred URL handlers. Else, if you specify
       the --launch option, you can select which preferred application you want to run, and pass additional parameters to the application (i.e.
       for TerminalEmulator you can pass the command line that should be run in the terminal).

COMPOSING EMAILS
       exo-open allows users and developers to open the preferred email composer from the command line by simply invoking exo-open
       mailto:USER@HOST.TLD. This will open the composer window with USER@HOST.TLD as the recipient. This syntax is supported by all MailReaders.
       In addition the MailReaders that ship as part of libexo also support extended mailto:-URIs (but be aware that user-defined mailers do not
       necessarily support this), which allows you to also specify default values for the subject and the body of the mail, add additional
       recipients (both Cc: and To:) and attach files to emails. For example mailto:foo@foo.org?cc=bar@bar.org&subject=Foo&attach=/foo/bar.txt
       tells the composer to start an email to foo@foo.org and bar@bar.org with Foo in the subject and the file /foo/bar.txt attached to the
       message.

AUTHOR
       exo-open was written by Benedikt Meurer <benny@xfce.org>.

       This manual page was provided by Benedikt Meurer <benny@xfce.org>.

Xfce                                                                08/29/2016                                                         EXO-OPEN(1)
