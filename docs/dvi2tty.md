DVI2TTY(1)                                                                       General Commands Manual                                                                       DVI2TTY(1)

NAME
       dvi2tty - preview a TeX DVI-file on an ordinary ascii terminal

SYNOPSIS
       dvi2tty [ options ] dvi-file

DESCRIPTION
       dvi2tty  converts  a TeX DVI-file to a format that is appropriate for terminals and line printers. The program is intended to be used for preliminary proofreading of TeX-ed docu‐
       ments.  By default the output is directed to the terminal, possibly through a pager (depending on how the program was installed), but it can be directed to a file or a pipe.

       The output leaves much to be desired, but is still useful if you want to avoid walking to the laser printer (or whatever) for each iteration of your document.
       Since dvi2tty produces output for terminals and line printers the representation of documents is naturally quite primitive.  In principle Font Changes are  totally  ignored,  but
       dvi2tty recognizes a few mathematical and special symbols that can be be displayed on an ordinary ascii terminal, such as the '+' and '-' symbol.

       If  the  width of the output text requires more columns than fits in one line (c.f. the -w option) it is broken into several lines by dvi2tty although they will be printed as one
       line on regular TeX output devices (e.g. laser printers). To show that a broken line is really just one logical line an asterisk (``*'') in the last position means that the logi‐
       cal line is continued on the next physical line output by dvi2tty.  Such a continuation line is started with a a space and an asterisk in the first two columns.

       Options  may  be  specified in the environment variable DVI2TTY.  Any option on the command line, conflicting with one in the environment, will override the one from the environ‐
       ment.

       Options:

       -o file
              Write output to file ``file''.

       -p list
              Print the pages chosen by list.  Numbers refer to TeX-page numbers (known as \count0).  An example of format for list is ``1,3:6,8'' to choose pages 1, 3 through 6 and  8.
              Negative numbers can be used exactly as in TeX, e g -1 comes before -4 as in ``-p-1:-4,17''.

       -P list
              Like -p except that page numbers refer to the sequential ordering of the pages in the dvi-file.  Negative numbers don't make a lot of sense here...

       -w n   Specify  terminal  width n.  Legal range 16-132.  Default is 80. If your terminal has the ability to display in 132 columns it might be a good idea to use -w132 and toggle
              the terminal into this mode as output will probably look somewhat better.

       -v     Specify height of lines. Default value 450000. Allows to adjust linespacing.

       -q     Don't pipe the output through a pager.  This may be the default on some systems (depending on the whims of the person installing the program).

       -e n   This option can be used to influence the spacing between words.  With a negative value the number of spaces between words becomes less, with a positive  value  it  becomes
              more.  -e-11 seems to worked well.

       -f     Pipe  through  a pager, $PAGER if defined, or whatever the installer of the program compiled in (often ``more''). This may be the default, but it is still okay to redirect
              output with ``>'', the pager will not be used if output is not going to a terminal.

       -F     Specify the pager program to be used.  This overrides the $PAGER and the default pager.

       -Fprog Use ``prog'' as program to pipe output into. Can be used to choose an alternate pager (e g ``-Fless'').

       -t     \tt fonts were used (instead of cm) to produce dvi file. (screen.sty is a powerfull mean to do that with LaTeX).

       -a     Dvi2tty normally tries to output accented characters. With the -a option, accented characters are output without the accent sign.

       -l     Mark page breaks with the two-character sequence ``^L''. The default is to mark them with a form-feed character.

       -c     Do not attempt to translate any characters (like the Scandinavion/latin1 mode) except when running in tt-font.

       -u     Toggle option to process certain latin1 characters. Use this if your output devices supports latin1 cahracters.  Note this may interfere with -s. Best not to use -u and -s
              together.

       -s     Toggle  option  to  process the special Scandinavian characters that on most (?)  terminals in Scandinavia are mapped to ``{|}[\]''.  Note this may interfere with -u. Best
              not to use -u and -s together.

       -J     Auto detect NTT JTeX, ASCII pTeX, and upTeX dvi format.

       -N     Display NTT JTeX dvi.

       -A     Display ASCII pTeX dvi.

       -U     Display upTeX dvi.

       -Eenc  Set output Japanese encoding. The enc argument 'e', 's', 'j', and 'u' denotes EUC-JP, Shift_JIS, ISO-2022-JP, and UTF-8, respectively.

       -bdelim
              Print the name of fonts when switching to it (and ending it). The delim argument is used to delimit the fontname.

FILES
       /bin/more      probably the default pager.

ENVIRONMENT
       PAGER              the pager to use.
       DVI2TTY             can be set to hold command-line options.

SEE ALSO
       TeX, dvi2ps

AUTHOR
       Original Pascal verion: Svante Lindahl, Royal Institute of Technology, Stockholm
       Improved C version: Marcel Mol
       marcel@mesa.nl, MESA Consulting

BUGS
       Blanks between words get lost quite easy. This is less likely if you are using a wider output than the default 80.

       Only one file may be specified on the command line.

                                                                                     13 November 1990                                                                          DVI2TTY(1)
