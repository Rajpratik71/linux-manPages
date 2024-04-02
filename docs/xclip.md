XCLIP(1)                                                      General Commands Manual                                                     XCLIP(1)

NAME
       xclip - command line interface to X selections (clipboard)

SYNOPSIS
       xclip [OPTION] [FILE]...

DESCRIPTION
       Reads  from  standard in, or from one or more files, and makes the data available as an X selection for pasting into X applications. Prints
       current X selection to standard out.

       -i, -in
              read text into X selection from standard input or files (default)

       -o, -out
              print the selection to standard out (generally for piping to a file or program)

       -f, -filter
              when xclip is invoked in the in mode with output level set to silent (the defaults), the filter option will cause xclip to print the
              text piped to standard in back to standard out unmodified

       -l, -loops
              number of X selection requests (pastes into X applications) to wait for before exiting, with a value of 0 (default) causing xclip to
              wait for an unlimited number of requests until another application (possibly another invocation of xclip)  takes  ownership  of  the
              selection

       -t, -target
              specify  a  particular data format using the given target atom.  With -o the special target atom name "TARGETS" can be used to get a
              list of valid target atoms for this selection.  For more information about target atoms refer to ICCCM section 2.6.2

       -d, -display
              X display to use (e.g. "localhost:0"), xclip defaults to the value in $DISPLAY if this option is omitted

       -h, -help
              show quick summary of options

       -selection
              specify which X selection to use, options are "primary" to use XA_PRIMARY (default), "secondary" for XA_SECONDARY or "clipboard" for
              XA_CLIPBOARD

       -version
              show version information

       -silent
              fork into the background to wait for requests, no informational output, errors only (default)

       -quiet show informational messages on the terminal and run in the foreground

       -verbose
              provide a running commentary of what xclip is doing

       -noutf8
              operate in legacy (i.e. non UTF-8) mode for backwards compatibility (Use this option only when really necessary, as the old behavior
              was broken)

       xclip reads text from standard in or files and makes it available to other X applications for pasting as an X selection (traditionally with
       the  middle  mouse button). It reads from all files specified, or from standard in if no files are specified. xclip can also print the con‐
       tents of a selection to standard out with the -o option.

       xclip was designed to allow tighter integration of X applications and command line programs. The default action is to silently wait in  the
       background for X selection requests (pastes) until another X application places data in the clipboard, at which point xclip exits silently.
       You can use the -verbose option to see if and when xclip actually receives selection requests from other X applications.

       Options can be abbreviated as long as they remain unambiguous. For example, it is possible to use -d or -disp instead of -display. However,
       -v couldn't be used because it is ambiguous (it could be short for -verbose or -version), so it would be interpreted as a filename.

       Note  that  only  the  first  character  of the selection specified with the -selection option is important. This means that "p", "sec" and
       "clip" would have the same effect as using "primary", "secondary" or "clipboard" respectively.

EXAMPLES
       I hate man pages without examples!

       uptime | xclip

       Put your uptime in the X selection. Then middle click in an X application to paste.

       xclip -loops 10 -verbose /etc/motd

       Exit after /etc/motd (message of the day) has been pasted 10 times. Show how many selection requests (pastes) have been processed.

       xclip -o > helloworld.c

       Put the contents of the selection into a file.

       xclip -t text/html index.html

       Middle click in an X application supporting HTML to paste the contents of the given file as HTML.

ENVIRONMENT
       DISPLAY
              X display to use if none is specified with the -display option.

REPORTING BUGS
       Please report any bugs, problems, queries, experiences, etc. directly to the author.

AUTHORS
       Kim Saunders <kims@debian.org> Peter Åstrand <astrand@lysator.liu.se>

                                                                                                                                          XCLIP(1)
