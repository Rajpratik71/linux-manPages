uuencode(1)                                                        User Commands                                                       uuencode(1)

NAME
       uuencode - encode a file into email friendly text

SYNOPSIS
       uuencode [-flags] [-flag [value]] [--option-name[[=| ]value]] [<in-file>] <output-name>

DESCRIPTION
       uuencode  is used to create an ASCII representation of a file that can be sent over channels that may otherwise corrupt the data.  Specifi‐
       cally, email cannot handle binary data and will often even insert a character when the six character sequence "0rom " is seen.

       uuencode will read in-file if provided and otherwise read data from standard in and write the encoded form to  standard  out.   The  output
       will  begin  with a header line for use by uudecode giving it the resulting suggested file output-name and access mode.  If the output-name
       is specifically /dev/stdout, then uudecode will emit the decoded file to standard out.

       Note: uuencode uses buffered input and assumes that it is not hand typed from a tty.  The consequence is that at a tty, you may need to hit
       Ctl-D several times to terminate input.

OPTIONS
       -m, --base64
              convert using base64.

              By  default, uuencode will encode using the traditional conversion.  It is slower and less compact than base64.  The encoded form of
              the file is expanded by 37% for UU encoding and by 35% for base64 encoding (3 bytes become 4 plus control information).

       -e, --encode-file-name
              encode the output file name.

              Since output file names may contain characters that are not handled well by various transmission modes, you  may  specify  that  the
              output-name be base64 encoded as well.  (Traditional uuencoding of the file name is not supported.)

       -h, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -R [cfgfile], --save-opts [=cfgfile]
              Save the option state to cfgfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.  The com‐
              mand will exit after updating the config file.

       -r cfgfile, --load-opts=cfgfile, --no-load-opts
              Load options from cfgfile.  The no-load-opts form will disable the loading of earlier config/rc/ini files.  --no-load-opts  is  han‐
              dled early, out of order.

       -v [{v|c|n --version [{v|c|n}]}]
              Output  version  of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

OPTION PRESETS
       Any option that is not marked as not presettable may be preset by loading values from configuration ("RC" or  ".INI")  file(s).   The  file
       "$HOME/.sharrc" will be used, if present.

STANDARDS
       This implementation is compliant with P1003.2b/D11.

FILES
       See OPTION PRESETS for configuration files.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       66  (EX_NOINPUT)
              A specified configuration file could not be loaded.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

SEE ALSO
       uudecode(1), uuencode(5)

HISTORY
       The uuencode command first appeared in BSD 4.0.

AUTHORS
       Free Software Foundation, Inc.

COPYRIGHT
       Copyright  (C)  1994-2015  Free Software Foundation, Inc. all rights reserved.  This program is released under the terms of the GNU General
       Public License, version 3 or later.

BUGS
       Please put sharutils in the subject line for emailed bug reports.  It helps to spot the message.

       Please send bug reports to: bug-gnu-utils@gnu.org

NOTES
       This manual page was AutoGen-erated from the uuencode option definitions.

GNU sharutils (4.15.2)                                              30 May 2015                                                        uuencode(1)
