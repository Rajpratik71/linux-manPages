INSSERV(8)                                                                                The openSUSE boot concept                                                                                INSSERV(8)



insserv
       insserv - Enable an installed system init script

SYNOPSIS
       insserv [[-r] <script>]

OPTIONS
       --remove, -r
           Remove the listed scripts from all runlevels

DESCRIPTION
       This version of insserv is just a stub for compatibility. It only reads the 'Default-Start' property of LSB init script headers to enable init scripts.  Anything else is handled by systemd.

       ### BEGIN INIT INFO # Provides:          boot_facility_1 [ boot_facility_2 ...]  # Required-Start:    boot_facility_1 [ boot_facility_2 ...]  # Required-Stop:     boot_facility_1 [ boot_facility_2
       ...]  # Should-Start:      boot_facility_1 [ boot_facility_2 ...]  # Should-Stop:       boot_facility_1 [ boot_facility_2 ...]  # X-Start-Before:    boot_facility_1 [ boot_facility_2 ...]  # X-Stop-
       After:      boot_facility_1 [ boot_facility_2 ...]  # Default-Start:     run_level_1 [ run_level_2 ...]  # Default-Stop:      run_level_1 [ run_level_2 ...]  # X-Interactive:     true # Short-
       Description: single_line_description # Description:       multiline_description ### END INIT INFO

SEE ALSO
       systemd(1)



                                                                                                  2014-06-18                                                                                       INSSERV(8)
