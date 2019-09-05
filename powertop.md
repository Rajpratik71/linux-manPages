POWERTOP(8)                                                    System Administration                                                   POWERTOP(8)

NAME
       powertop - a power consumption and power management diagnosis tool.

SYNOPSIS
       powertop [options]

DESCRIPTION
       powertop  is  a program that helps to diagnose various issues with power consumption and power management.  It also has an interactive mode
       allowing one to experiment with various power management settings.  When invoking powertop without arguments powertop starts in interactive
       mode.

OPTIONS
       --auto-tune
              Set all tunable options to their good setting without interaction.

       -c, --calibrate
              Runs  powertop in calibration mode.  When running on battery, powertop can track power consumption as well as system activity.  When
              there are enough measurements, powertop can start to report power estimates.  One can get more  accurate  estimates  by  using  this
              option to enable a calibration cycle.  This will cycle through various display levels and USB device activities and workloads.

       -C, --csv[=filename]
              Generate  a  CSV report.  If a filename is not specified then the default name powertop.csv is used.  The CSV report can be used for
              reporting and data analysis.

       --debug
              Run in debug mode.

       --extech=devnode
              Use the Extech Power Analyzer for measurements.  This allows one to specify the serial device node of the serial to USB adaptor con‐
              necting to the Extech Power Analyzer, for example /dev/ttyUSB0.

       -r, --html[=filename]
              Generate  an  HTML report.  If a filename is not specified then the default name powertop.html is used.  The HTML report can be sent
              to others to help diagnose power issues.

       -i, --iteration[=iterations]
              Number of times to run each test.

       -q, --quiet
              Suppress stderr output.

       -t, --time[=seconds]
              Generate a report for a specified number of seconds.

       -w, --workload[=workload]
              Execute workload file as a part of calibration before making a report.

       -V, --version
              Print version information and exit.

       -h, --help
              Show the help message and exit.

COMMANDS
       In interactive mode, the following key bindings are available:

              Tab                    Show next tab
              BackTab                Show previous tab
              Right Arrow            Scroll to the right
              Left Arrow             Scroll to the left
              Up Arrow, PageUp       Scroll up or select previous item

              Down Arrow, PageDown   Scroll down or select next item
              Space, Return          Activate current item
              s                      Set refresh timeout
              r                      Refresh window
              q, Ctrl-C, Escape      Exit powertop

BUGS
       Send bug reports to ⟨powertop@lists.01.org⟩

SEE ALSO
       The program is more fully described at ⟨https://01.org/powertop⟩

AUTHOR
       powertop was written by Arjan van de Ven ⟨arjan@linux.intel.com⟩, and is currently maintained  by  Chris  E  Ferron  ⟨chris.e.ferron@linux.
       intel.com⟩.

powertop manual                                                     2014-08-02                                                         POWERTOP(8)
