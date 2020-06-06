orca(1)                                                                                  General Commands Manual                                                                                  orca(1)

NAME
       orca - a scriptable screen reader

SYNOPSIS
       orca [option...]

DESCRIPTION
       orca is a screen reader for people with visual impairments, it provides alternative access to the desktop by using speech synthesis and braille.

       orca  works  with  applications  and  toolkits  that  support the Assistive Technology Service Provider Interface (AT-SPI), which is the primary assistive technology infrastructure for Linux and
       Solaris. Applications and toolkits supporting the AT-SPI include the GNOME Gtk+ toolkit, the Java platform's Swing toolkit, LibreOffice, Gecko, and WebKitGtk. AT-SPI support for the KDE Qt tool‐
       kit is being pursued.

OPTIONS
       -t, --text-setup
              When starting orca, initiate the text-based configuration.

       -u, --user-prefs-dir=dirname
              When starting orca, use dirname as an alternate directory for the user preferences.

       -e, --enable=speech|braille|braille-monitor
              When starting orca, force the enabling of the supplied options.

       -d, --disable=speech|braille|braille-monitor
              When starting orca, force the disabling of the supplied options.

       -l, --list-apps
              Prints  the names of all the currently running applications.  This is used primarily for debugging purposes to see if orca can talk to the accessibility infrastructure.  Note that if orca
              is already running, this will not kill the other orca process.  It will just list the currently running applications, and you will see orca listed twice: once for the  existing  orca  and
              once for this instance.

       --debug
              Enables  debug output for orca and sends all debug output to a file with a name of the form 'debug-YYYY-MM-DD-HH:MM:SS.out' in the current directory.  The YYYY-MM-DD-HH:MM:SS portion will
              be replaced with the current date and time.

       --debug-file=filename
              Enables debug output for orca and sends all debug output to the given filename.

       -v, --version
              outputs orca version number and exits.

       -h, --help
              displays orca help and exits.

       --replace
              Replace a currently running orca process.  By default, if orca detects an existing orca process for the same session, it will not start a new orca process.   This  option  will  kill  and
              cleanup after any existing orca process and then start a new orca in its place.

       KEYBOARD SETTINGS
              Orca provides two keyboard modes, Desktop and Laptop keyboard layout. The Orca_Modifier key is Insert in desktop keyboard layout and Caps_Lock in laptop keyboard layout.

              Orca uses default GNOME keyboard shortcuts to navigate the desktop and interact with various applications. The flat review commands provide an alternative method of interaction in certain
              inaccessible applications. It should not be confused with flat review functionality provided by other screen readers.

Desktop Mode
       Flat review commands

       Numpad-7 move the flat review cursor to the previous line and read it.

       Numpad-8 read the current line.

       Numpad-9 move the flat review cursor to the next line and read it.

       Numpad-4 move the flat review cursor to the previous word and read it.

       Numpad-5 read the current word.

       Numpad-6 move the flat review cursor to the next word and read it.

       Numpad-1 move the flat review cursor to the previous character and read it.

       Numpad-2 read the current character.

       Numpad-3 move the flat review cursor to the next character and read it.

       Numpad-slash perform a left mouse click at the location of the flat review cursor.

       Numpad-star perform a right mouse click at the location of the flat review cursor.

       Bookmark commands

       Alt+Insert+[1-6] assign a bookmark to a numbered slot. If a bookmark already exists in the slot it will be replaced with the new one.

       Insert+[1-6] go to the position pointed to by the bookmark bound to this numbered slot.

       Insert+B and Insert+Shift+B move between the given bookmarks for the given application or page.

       Alt+Insert+B save the defined bookmarks for the current application or page.

       Miscellaneous functions

       Numpad+Plus
        'say all' command; reads from the current position of the caret to the end of the document.

       Numpad+Enter
        'Where am I' command; speaks information such as the title of the current application window, as well as the name of the control that currently has focus.

       Insert+H enter into orca's 'learn mode'; press Escape to exit.

       Insert+Shift+Backslash toggle live regions monitoring on and off.

       Insert+F speak font and attribute information for the current character.

       Insert+Space Launch the orca Configuration dialog.

       Insert+Ctrl+Space reload user settings and reinitialize services as necessary. Also launches the orca Configuration dialog for the current application.

       Insert+S toggle speech on and off.

       Insert+F11 toggle the reading of tables, either by single cell or whole row.

Laptop Mode
       Flat review commands

       Caps_Lock+U move the flat review cursor to the previous line and read it. Double-click to move flat review to the top of the current window.

       Caps_Lock+I read the current line. Double-click to read the current line along with formatting and capitalization details.

       Caps_Lock+O move the flat review cursor to the next line and read it. Double- click to move flat review to the bottom of the current window.

       Caps_Lock+J move the flat review cursor to the previous word and read it. Double-click to move flat review to the word above the current word.

       Caps_Lock+K read the current word. Double-click to spell the word. Triple-click to hear the word spelled phonetically.

       Caps_Lock+L move the flat review cursor to the next word and read it. Double- click to move flat review to the word below the current word.

       Caps_Lock+M move the flat review cursor to the previous character and read it. Double-click to move flat review to the end of the current line.

       Caps_Lock+Comma read the current character. Double-click to pronounce the character phonetically if it is a letter.

       Caps_Lock+Period move the flat review cursor to the next character and read it.

       Caps_Lock+7 perform a left mouse click at the location of the flat review cursor.

       Caps_Lock+8 perform a right mouse click at the location of the flat review cursor.

       Bookmark commands

       Alt+Caps_Lock+[1-6]

       add a bookmark to the numbered slot. If a bookmark already exists for the slot it will be replaced with the new one.

       Caps_Lock+[1-6] go to the position pointed to by the bookmark bound to this numbered slot.

       Caps_Lock+Band Caps_Lock+Shift+B move between the given bookmarks for the given application or page.

       Alt+Caps_Lock+B save the defined bookmarks for the current application or page.

       Miscellaneous functions

       Caps_Lock+Semicolon
        'Say all' command; reads from the current position of the caret to the end of the document.  Caps_Lock+Enter
        'Where am I' command; speaks information such as the title of the current application window, as well as the name of the control that currently has focus.

       Caps_Lock+H enter learn mode (press Escape to exit).

       Caps_Lock+Shift+Backslash toggle live regions monitoring on and off.

       Caps_Lock+F speak font and attribute information for the current character.

       Caps_Lock+Space launch the orca Configuration dialog.

       Caps_Lock+Ctrl+Space reload user settings and reinitialize services as necessary; also launches the orca Configuration dialog for the current application.

       Caps_Lock+S toggle speech on and off.

       Caps_Lock+F11 toggle the reading of tables, either by single cell or whole row.

FILES
       ~/.local/share/orca
              Orca user preferences directory

       ~/.local/share/orca/user-settings.conf
              Orca user preferences configuration file.

       ~/.local/share/orca/orca-customizations.py
              Orca user customizations configuration file

       ~/.local/share/orca/orca-scripts
              Orca user orca scripts directory

       ~/.local/share/orca/bookmarks
              Orca user bookmarks directory

       ~/.local/share/orca/app-settings
              Orca user application specific settings directory

AUTHOR
       Orca originated as a community effort led by the Sun Microsystems Inc.  Accessibility Program Office and with contributions from many community members.

SEE ALSO
       For more information please visit orca wiki at <http://live.gnome.org/Orca> ⟨http://live.gnome.org/Orca⟩

       The orca mailing list <http://mail.gnome.org/mailman/listinfo/orca-list> To post a message to all orca list, send a email to orca-list@gnome.org

GNOME                                                                                       20 September 2013                                                                                     orca(1)
