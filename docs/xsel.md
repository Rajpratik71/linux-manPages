XSEL(1x)                                                                                                                                  XSEL(1x)

NAME
       xsel - manipulate the X selection.

SYNOPSIS
       xsel [OPTION]...

DESCRIPTION
       Retrieve and set the X selection.

       The X server maintains three selections, called PRIMARY, SECONDARY and CLIPBOARD. The PRIMARY selection is conventionally used to implement
       copying and pasting via the middle mouse button. The SECONDARY and CLIPBOARD selections are less frequently used by  application  programs.
       This program operates on the PRIMARY selection unless otherwise specified.

       By default, this program outputs the selection without modification if both standard input and standard output are terminals (ttys). Other‐
       wise, the current selection is output if standard output is not a terminal (tty), and the selection is set from standard input if  standard
       input is not a terminal (tty). If any input or output options are given then the program behaves only in the requested mode.

       If both input and output is required then the previous selection is output before being replaced by the contents of standard input.

       Input options

       -a, --append
              append standard input to the selection. Implies -i.

       -f, --follow
              append to selection as standard input grows. Implies -i.

       -i, --input
              read standard input into the selection.

       Output options

       -o, --output
              write the selection to standard output.

       Action options

       -c, --clear
              clear the selection. Overrides all input options.

       -d, --delete
              Request  that  the  current  selection be deleted. This not only clears the selection, but also requests to the program in which the
              selection resides that the selected contents be deleted. Overrides all input options.

       Selection options

       -p, --primary
              operate on the PRIMARY selection (default).

       -s, --secondary
              operate on the SECONDARY selection.

       -b, --clipboard
              operate on the CLIPBOARD selection.

       -k, --keep
              Do not modify the selections, but make the PRIMARY and SECONDARY selections persist even after the programs they  were  selected  in
              exit.  (Conventionally,  the  CLIPBOARD selection is persisted by a separate special purpose program such as xclipboard(1)). Ignores
              all input and output options.

       -x, --exchange
              exchange the PRIMARY and SECONDARY selections. Ignores all input and output options.

       X options

       -d displayname, --display displayname
              specify the server to use; see X(1).

       -t ms, --selectionTimeout ms
              Specify the timeout in milliseconds within which the selection must  be  retrieved.  A  value  of  0  (zero)  specifies  no  timeout
              (default).

       Miscellaneous options

       -l filename, --logfile filename
              Specify the file to log errors to when detached. (Default $HOME/.xsel.log)

       -n, --nodetach
              Do  not  detach from the controlling terminal. Without this option, xsel will fork to become a background process in input, exchange
              and keep modes.

       -h, --help
              display usage information and exit

       -v, --verbose
              Print informative messages. Additional instances of -v raise the debugging level, ie. print more information.

       --version
              output version information and exit

NOTES
       There is no X selection buffer. The selection mechanism in X11 is an interclient communication mediated by the X server each time any  pro‐
       gram  wishes  to  know the selection contents, eg. to perform a middle mouse button paste. In order to implement modification of the selec‐
       tion(s) (in input, keep and exchange modes) this program detaches from the terminal, spawning a child process  to  supply  the  new  selec‐
       tion(s)  on  demand.  This  child exits immediately when any other program takes over the selection(s), eg. when the user next selects some
       text in a terminal window or by running xsel -c.

STANDARDS
       xsel conforms to the Inter-Client Communication Conventions Manual Version 2.0 (ICCCM2).

SEE ALSO
       X(7), Xserver(1), xset(1), xclipboard(1), xpaste(1)

AUTHOR
       Conrad Parker <conrad@vergenet.net>, July 2001

                                                                   January 2008                                                           XSEL(1x)
