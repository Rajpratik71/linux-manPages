UNITY-CONTROL-CENT(1)                                                                         User Commands                                                                         UNITY-CONTROL-CENT(1)

NAME
       unity-control-center - Configure Unity settings

SYNOPSIS
       unity-control-center [OPTION...] [PANEL] [ARG...]

DESCRIPTION
       unity-control-center is a graphical user interface to configure various aspects of Unity.

       When run without arguments, the shell displays the overview, which shows all available configuration panels. The overview allows to open individual panels by clicking on them. It also has a
       search entry to find panels by searching keywords.

       It is also possible to specify a panel name as commandline argument to go directly to that panel. Individual panels may accept further arguments to specify which tab to open (for multi-tabbed
       panels) or which item to display (for panels with lists).

       Note that unity-control-center is not meant to expose each and every setting that is available. The settings that can be found here represent what is considered useful and commonly needed
       options. For more exotic or uncommon options, you can look at gnome-tweak-tool or the gsettings commandline utility.

PANELS
       The following panel names can be specified:

       background
           The background panel lets you set your desktop background.

       bluetooth
           The bluetooth panel lets you configure your computer's Bluetooth adapter, and pair the computer with Bluetooth keyboards, phones, etc.

       color
           The color panel can calibrate monitors, web cams and printers for accurate color reproduction.

       datetime
           The datetime panel lets you set the timezone and time format.

           Some operations in this panel affect all user accounts on the computer and require privieges.

       display
           The display panel configures the resolution and arrangement of monitors and laptop panels. Note that monitors can be rearranged by drag-and-drop, and you can change which monitor is your
           main display by dragging the black bar.

       info
           The info panel shows a general overview of the system configuration. It also lets you change the default applications for various tasks and the handling of removable media.

       keyboard
           The keyboard panel can change how the keyboard reacts to key presses and lets you change keyboard shortcuts or create custom shortcuts.

           You can open this panel on a specific tab by passing typing or shortcuts as extra argument.

       mouse
           The mouse panel can change how mice and touchpads react to user input.

       network
           The network panel provides a view of available network devices (wired, wireless or mobile) and their current configuration. It also provides a way to create new VPN connections and configure
           proxy settings.

       online-accounts
           The online-accounts panel shows your configured online accounts and lets you add or remove accounts.

       power
           The power panel shows the fill level of batteries and can configure what happens when the computer is idle or runs out of battery.

       printers
           The printers panel shows all known printers and their status. It is possible to inspect queued print jobs and add new printers.

           Some operations in this panel require privileges.

       region
           The region panel contains regional settings such as the display language, formatting for times, dates, numbers, and input sources.

           You can open this panel on a specific tab by passing language, formats, layouts or system as extra argument.

       screen
           The screen panel contains settings that control the screen brightness and screen lock behavior.

       sound
           The sound panel shows all known sound devices and their configuration, including volume and balance settings.

           You can open this panel on a specific tab by passing output, input, hardware, effects or applications as extra argument.

       universal-access
           The universal-access panel contains settings for accessible technologies such as the screen reader, magnifier, screen keyboard and AccessX options.

       user-accounts
           The user-accounts panel shows all user accounts that exist on the computer and allows to change them in some ways, such as changing the user name, password or permissions. It also allows to
           create or remove accounts.

           Some operations in this panel require privileges.

       wacom
           the wacom panel shows connected Wacom graphics tablets and lets you calibrate and configure such devices.

OPTIONS
       -?, --help
           Prints a short help text and exits.

       --version
           Prints the program version and exits.

       -v, --verbose
           Enables verbose mode.

       -o, --overview
           Opens the overview.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       gsettings(1)

Ubuntu                                                                                                                                                                              UNITY-CONTROL-CENT(1)
