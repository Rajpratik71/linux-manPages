uudecode(1)                                                        User Commands                                                       uudecode(1)

NAME
       uudecode - decode an encoded file

SYNOPSIS
       uudecode [-flags] [-flag [value]] [--option-name[[=| ]value]] [<file>...]

       If no file(s) are provided, then standard input is decoded.

DESCRIPTION
       uudecode transforms uuencoded files into their original form.

       The encoded file(s) may be specified on the command line, or one may be read from standard input.  The output file name is specified in the
       encoded file, but may be overridden with the -o option.  It will have the mode of the original file, except that setuid  and  execute  bits
       are not retained.  If the output file is specified to be /dev/stdout or -, the result will be written to standard output. If there are mul‐
       tiple input files and the second or subsquent file specifies standard output, the decoded data will be written to the same file as the pre‐
       vious output.  Don't do that.

       uudecode  ignores  any  leading  and  trailing  lines.  It looks for a line that starts with "begin" and proceeds until the end-of-encoding
       marker is found.  The program determines from the header line of the encoded file which of the two supported encoding schemes was used  and
       whether or not the output file name has been encoded with base64 encoding.  See uuencode(5).

OPTIONS
       -o file, --output-file=file
              direct output to file.

              If  specified, decoded data are written to this file.  When multiple inputs are specified on the command line, this option cannot be
              specified.  All decoded data must be written to the file name encoded in the data.

       -c, --ignore-chmod
              ignore fchmod(3P) errors.

              By default, if the output file permissions cannot be changed to the permissions specified in the encoded data, the file will not  be
              written  out  and execution stops.  This option will cause that error to be ignored.  The resulting file will have all the data, but
              the incorrect mode settings.

              fchmod() errors are also ignored if POSIXLY_CORRECT is set in the environment.  RE: http://austingroupbugs.net/view.php?id=635

              A warning is always emitted when fchmod() fails.

       -h, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -R [cfgfile], --save-opts [=cfgfile]
              Save the option state to cfgfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.  The com‐
              mand will exit after updating the config file.

       -r cfgfile, --load-opts=cfgfile, --no-load-opts
              Load  options  from cfgfile.  The no-load-opts form will disable the loading of earlier config/rc/ini files.  --no-load-opts is han‐
              dled early, out of order.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright  information  and
              `n' will print the full copyright notice.

OPTION PRESETS
       Any  option  that  is  not marked as not presettable may be preset by loading values from configuration ("RC" or ".INI") file(s).  The file
       "$HOME/.sharrc" will be used, if present.

STANDARDS
       This implementation is compliant with P1003.2b/D11.

FILES
       See OPTION PRESETS for configuration files.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_OPTION_ERROR)
              The command options were misconfigured.

       2  (EXIT_INVALID)
              (warning) One or more input files contained no valid data

       4  (EXIT_NO_INPUT)
              (warning) The specified input file was not found

       8  (EXIT_NO_OUTPUT)
              The specified output file could not be created (error); or else one of the output files could not be  written  or  its  access  mode
              could not be changed (warnings).  The accompanying message(s) will distinguish.

       9  (EXIT_NO_MEM)
              No process memory available

       66  (EX_NOINPUT)
              A specified configuration file could not be loaded.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

              The  exit  status  codes  are (mostly) warning codes.  As such, each code is "or"-ed into the final exit code as the input files are
              processed.  For example, an exit code of '6' is not listed above.  It is the sum of EXIT_INVALID and EXIT_NO_INPUT.  It  would  mean
              that at least one input file contained invalid data and also at least one input file could not be found at all.

SEE ALSO
       uuencode(1), uuencode(5)

AUTHORS
       Free Software Foundation, Inc.

COPYRIGHT
       Copyright  (C)  1994-2015  Free Software Foundation, Inc. all rights reserved.  This program is released under the terms of the GNU General
       Public License, version 3 or later.

BUGS
       Please put sharutils in the subject line for emailed bug reports.  It helps to spot the message.

       If more than one name in the encoded files are the same, or if the second or following input files specifies standard output for the output
       file,  then  the result is probably not what is expected.  Specifically, standard output will be appended to and named output files will be
       replaced.

       Please send bug reports to: bug-gnu-utils@gnu.org

NOTES
       This manual page was AutoGen-erated from the uudecode option definitions.

GNU sharutils (4.15.2)                                              30 May 2015                                                        uudecode(1)
