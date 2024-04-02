UNITY-GREETER(1)                                                                         General Commands Manual                                                                         UNITY-GREETER(1)

NAME
       unity-greeter - LightDM greeter for the Unity desktop

SYNOPSIS
       unity-greeter [ OPTIONS ]

DESCRIPTION
       Unity  Greeter  is a LightDM greeter for the Unity desktop.  It is run by the LightDM daemon if configured in lightdm.conf.  It is not normally run by a user, but can run in a test mode with the
       --test-mode option.  This allows the interface to be tested without installing an updated version.

OPTIONS
       -v, --version
              Show release version.

       --test-mode
              Run the greeter in a test mode inside the current X session.

       -?, --help
              Show help options.

SEE ALSO
       lightdm

                                                                                              June 21, 2012                                                                              UNITY-GREETER(1)
