ZENITY(1)                                                                               General Commands Manual                                                                              ZENITY(1)

NAME
       zenity - display GTK+ dialogs

SYNOPSIS
       zenity [options]

DESCRIPTION
       zenity is a program that will display GTK+ dialogs, and return (either in the return code, or on standard output) the users input. This allows you to present information, and ask for informa‐
       tion from the user, from all manner of shell scripts.

       For example, zenity --question will return either 0, 1 or 5, depending on whether the user pressed OK, Cancel or timeout has been reached. zenity --entry will output on standard  output  what
       the user typed into the text entry field.

       Comprehensive documentation is available in the GNOME Help Browser.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-').

       Dialog options

       --calendar
              Display calendar dialog

       --entry
              Display text entry dialog

       --error
              Display error dialog

       --file-selection
              Display file selection dialog

       --info Display info dialog

       --list Display list dialog

       --notification
              Display notification

       --progress
              Display progress indication dialog

       --question
              Display question dialog

       --text-info
              Display text information dialog

       --warning
              Display warning dialog

       --scale
              Display scale dialog

       --color-selection
              Display color selection dialog

       --password
              Display password dialog

       --forms
              Display forms dialog

       General options

       --title=TITLE
              Set the dialog title

       --window-icon=ICONPATH
              Set the window icon with the path to an image. Alternatively, one of the four stock icons can be used: 'error', 'info', 'question' or 'warning'

       --width=WIDTH
              Set the dialog width

       --height=HEIGHT
              Set the dialog height

       --timeout=TIMEOUT
              Set the dialog timeout in seconds

       Calendar options

       --text=STRING
              Set the dialog text

       --day=INT
              Set the calendar day

       --month=INT
              Set the calendar month

       --year=INT
              Set the calendar year

       --date-format=PATTERN
              Set the format for the returned date. The default depends on the user locale or be set with the strftime style. For example %A %d/%m/%y

       Text entry options

       --text=STRING
              Set the dialog text

       --entry-text=STRING
              Set the entry text

       --hide-text
              Hide the entry text

       Error options

       --text=STRING
              Set the dialog text

       --no-wrap
              Do not enable text wrapping

       --no-markup
              Do not enable pango markup

       File selection options

       --filename=FILENAME
              Set the file or directory to be selected by default

       --multiple
              Allow selection of multiple filenames in file selection dialog

       --directory
              Activate directory-only selection

       --save Activate save mode

       --separator=SEPARATOR
              Specify separator character when returning multiple filenames

       --confirm-overwrite
              Confirm file selection if filename already exists

       --file-filter=NAME | PATTERN1 PATTERN2
              Sets a filename filter

       Info options

       --text=STRING
              Set the dialog text

       --no-wrap
              Do not enable text wrapping

       --no-markup
              Do not enable pango markup

       List options

       --text=STRING
              Set the dialog text

       --column=STRING
              Set the column header

       --checklist
              Use check boxes for first column

       --radiolist
              Use radio buttons for first column

       --separator=STRING
              Set output separator character

       --multiple
              Allow multiple rows to be selected

       --editable
              Allow changes to text

       --print-column=NUMBER
              Specify what column to print to standard output. The default is to return the first column. 'ALL' may be used to print all columns.

       --hide-column=NUMBER
              Hide a specific column

       --hide-header
              Hides the column headers

       Notification options

       --text=STRING
              Set the notification text

       --listen
              Listen  for  commands  on  stdin.  Commands  include  'message', 'tooltip', 'icon', and 'visible' separated by a colon. For example, 'message: Hello world', 'visible: false', or 'icon:
              /path/to/icon'. The icon command also accepts the four stock icon: 'error', 'info', 'question', and 'warning'

       Progress options

       --text=STRING
              Set the dialog text

       --percentage=INT
              Set initial percentage

       --auto-close
              Close dialog when 100% has been reached

       --auto-kill
              Kill parent process if cancel button is pressed

       --pulsate
              Pulsate progress bar

       --no-cancel
              Hides the cancel button

       Question options

       --text=STRING
              Set the dialog text

       --no-wrap
              Do not enable text wrapping

       --no-markup
              Do not enable pango markup

       --ok-label
              Set the text of the OK button

       --cancel-label
              Set the text of the cancel button

       Text options

       --filename=FILENAME
              Open file

       --editable
              Allow changes to text

       --checkbox=TEXT
              Enable a checkbox for use like a 'I read and accept the terms.'

       --ok-label
              Set the text of the OK button

       --cancel-label
              Set the text of the cancel button

       Warning options

       --text=STRING
              Set the dialog text

       --no-wrap
              Do not enable text wrapping

       --no-markup
              Do not enable pango markup

       Scale options

       --text=STRING
              Set the dialog text

       --value=VALUE
              Set initial value

       --min-value=VALUE
              Set minimum value

       --max-value=VALUE
              Set maximum value

       --step=VALUE
              Set step size

       --print-partial
              Print partial values

       --hide-value
              Hide value

       Color selection options

       --color=VALUE
              Set the initial color

       --show-palette
              Show the palette

       Password dialog options

       --username
              Display the username field

       Forms dialog options

       --add-entry=FIELDNAME
              Add a new Entry in forms dialog

       --add-password=FIELDNAME
              Add a new Password Entry in forms dialog

       --add-calendar=FIELDNAME
              Add a new Calendar in forms dialog

       --text=STRING
              Set the dialog text

       --separator=STRING
              Set output separator character

       --forms-date-format=PATTERN
              Set the format for the returned date. The default depends on the user locale or be set with the strftime style. For example %A %d/%m/%y

       Miscellaneous options

       -?, --help
              Show summary of options.

       --about
              Display an about dialog.

       --version
              Show version of program.

       Also the standard GTK+ options are accepted. For more information about the GTK+ options, execute following command.

              zenity --help-gtk

ENVIRONMENT
       Normally, zenity detects the terminal window from which it was launched and keeps itself above that window.  This behavior can be disabled by unsetting the WINDOWID environment variable.

EXAMPLES
       Display a file selector with the title Select a file to remove. The file selected is returned on standard output.

              zenity  --title="Select a file to remove" --file-selection

       Display a text entry dialog with the title Select Host and the text Select the host you would like to flood-ping. The entered text is returned on standard output.

              zenity  --title "Select Host" --entry --text "Select the host you would like to flood-ping"

       Display a dialog, asking Microsoft Windows has been found! Would you like to remove it?. The return code will be 0 (true in shell) if OK is selected, and 1 (false) if Cancel is selected.

              zenity  --question --title "Alert"  --text "Microsoft Windows has been found! Would you like to remove it?"

       Show the search results in a list dialog with the title Search Results and the text Finding all header files....

              find . -name '*.h' | zenity --list --title "Search Results" --text "Finding all header files.." --column "Files"

       Show a notification in the message tray

              zenity --notification --window-icon=update.png --text "System update necessary!"

       Display a weekly shopping list in a check list dialog with Apples and Oranges pre selected

              zenity --list --checklist --column "Buy" --column "Item" TRUE Apples TRUE Oranges FALSE Pears FALSE Toothpaste

       Display a progress dialog while searching for all the postscript files in your home directory

       find $HOME -name '*.ps' | zenity --progress --pulsate

AUTHOR
       Zenity was written by Glynn Foster <glynn.foster@sun.com>.

       This manual page was written by Ross Burton <ross@burtonini.com>.

SEE ALSO
       dialog(1)

                                                                                             December 2011                                                                                   ZENITY(1)
