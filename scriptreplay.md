SCRIPTREPLAY(1)                                                                                 User Commands                                                                                 SCRIPTREPLAY(1)



NAME
       scriptreplay - play back typescripts, using timing information

SYNOPSIS
       scriptreplay [options] [-t] timingfile [typescript [divisor]]

DESCRIPTION
       This program replays a typescript, using timing information to ensure that output happens at the same speed as it originally appeared when the script was recorded.

       The  replay  simply displays the information again; the programs that were run when the typescript was being recorded are not run again.  Since the same information is simply being displayed, scrip‐
       treplay is only guaranteed to work properly if run on the same type of terminal the typescript was recorded on.  Otherwise, any escape characters in the typescript may be interpreted differently  by
       the terminal to which scriptreplay is sending its output.

       The timing information is what script(1) outputs to standard error if it is run with the -t parameter.

       By default, the typescript to display is assumed to be named typescript, but other filenames may be specified, as the second parameter or with option -s.

       If  the  third parameter is specified, it is used as a speed-up multiplier.  For example, a speed-up of 2 makes scriptreplay go twice as fast, and a speed-up of 0.1 makes it go ten times slower than
       the original session.

OPTIONS
       The first three options will overide old-style arguments.

       -t, --timing file
              File containing script timing output.

       -s, --typescript file
              File containing the script terminal output.

       -d, --divisor number
              Speed up the replay displaying this number of times.  The argument is a floating point number.  It's called divisor because it divides the timings by this factor.

       -V, --version
              Display version information and exit.

       -h, --help
              Display a help message and exit.

EXAMPLE
       % script --timing=file.tm script.out
       Script started, file is script.out
       % ls
       <etc, etc>
       % exit
       Script done, file is script.out
       % scriptreplay --timing file.tm --typescript script.out

SEE ALSO
       script(1)

COPYRIGHT
       Copyright © 2008 James Youngman
       Copyright © 2008 Karel Zak

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

       Released under the GNU General Public License version 2 or later.

AUTHOR
       The original scriptreplay program was written by Joey Hess ⟨joey@kitenet.net⟩.  The program was re-written in C by James Youngman ⟨jay@gnu.org⟩ and Karel Zak ⟨kzak@redhat.com⟩.

AVAILABILITY
       The scriptreplay command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                      September 2011                                                                                SCRIPTREPLAY(1)
