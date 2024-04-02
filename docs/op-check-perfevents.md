OP-CHECK-PERFEVENTS(1)                                                                     General Commands Manual                                                                     OP-CHECK-PERFEVENTS(1)



NAME
       op-check-perfevents - checks for kernel perf pmu support

SYNOPSIS
       op-check-perfevents [ options ]

DESCRIPTION
       The small helper program op-check-perfevents determines whether the kernel supports the perf interface and returns a zero exit status if the perf pmu support is available.

OPTIONS
       --help / -h
              Show usage help message.

       --verbose / -v
              Print string describing the error number of perf_event_open syscall


ENVIRONMENT
       No special environment variables are recognised by op-check-perfevents.


VERSION
       This man page is current for oprofile-0.9.9.


SEE ALSO
       /usr/share/doc/oprofile/, oprofile(1)



4th Berkeley Distribution                                                                    Fri 02 November 2018                                                                      OP-CHECK-PERFEVENTS(1)
