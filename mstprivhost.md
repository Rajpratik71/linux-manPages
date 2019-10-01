MSTPRIVHOST(1)                                                                                  User Commands                                                                                  MSTPRIVHOST(1)



NAME
       mstprivhost - manual page for mstprivhost 1.0.0, mstflint 4.11.0, built on Nov 21 2018, 13:06:58. Git SHA Hash: N/A

DESCRIPTION
       usage: mstprivhost [-h] [-v] --device DEVICE [--disable_rshim]

              [--disable_tracer] [--disable_counter_rd] [--disable_port_owner] {r,restrict,p,privilege}

       restrict or privilege host Note: New configurations takes effect immediately.  Note: privileged host - host has all supported privileges.

              restricted host - host is not allowed to modify global per port/parameters or access other hosts parametersis.

   optional arguments:
       -h, --help
              show this help message and exit

       -v, --version
              show program's version number and exit

OPTIONS
       --device DEVICE, -d DEVICE
              Device to work with.

       --disable_rshim
              When TRUE, the host does not have an RSHIM function to access the embedded CPU registers mlxconfig_name: HOST_DISABLE_RSHIM

       --disable_tracer
              When TRUE, the host will not be allowed to own the Tracer mlxconfig_name: HOST_DISABLE_TRACER_OWNER

       --disable_counter_rd
              When TRUE, the host will not be allowed to read Physical port counters mlxconfig_name: HOST_DISABLE_PORT_COUNTER

       --disable_port_owner
              When TRUE, the host will not be allowed to be Port Owner mlxconfig_name: HOST_DISABLE_PORT_OWNER

   Commands:
              {r,restrict,p,privilege}

       restrict:
              Set host 1 (ARM) privileged, host 0 (x86_64) restricted.

              privilege: Set host 1 (ARM) privileged, host 0 (x86_64) privileged

              (back to default).

SEE ALSO
       The full documentation for mstprivhost is maintained as a Texinfo manual.  If the info and mstprivhost programs are properly installed at your site, the command

              info mstprivhost

       should give you access to the complete manual.



mstprivhost 1.0.0, mstflint 4.11.0, built on Nov 21 2018, 13:06:58. Git SHA Hash: N/A           November 2018                                                                                  MSTPRIVHOST(1)
