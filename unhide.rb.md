unhide.rb(8)                                          unhide.rb - Finder of hidden processes                                          unhide.rb(8)

NAME
       unhide.rb - Scans system for hidden processes and lists any hits on stderr.

SYNOPSIS
       unhide.rb

DESCRIPTION
       Scans the system for hidden processes.

       Progress messages are printed on stdout and can be redirected to /dev/null.

       Error diagnostics and information about any hidden processes found is printed to stderr.

OPTIONS
       unhide.rb takes no options

EXIT STATUS
       0      No hidden processes found

       1      Something went wrong during scanning

       2      One or more hidden processes were detected

BUGS
       Report bugs to <johan.walles@gmail.com> or <https://bugs.launchpad.net/unhide.rb>.

LICENSING
       unhide.rb is licensed under the GPL-3, copyright Johan Walles <johan.walles@gmail.com>.

SEE ALSO
       rkhunter(8)

       The unhide.rb home page: <http://launchpad.net/unhide.rb>

NOTES
       unhide.rb is a Ruby port of unhide.  When it was first written, the Ruby port was about 10x faster than the original C program and had much
       better diagnostics when hidden processes were found.   The original unhide program can be found at <http://www.unhide-forensics.info/>.

                                                                    March 2011                                                        unhide.rb(8)
