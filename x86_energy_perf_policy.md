X86_ENERGY_PERF_POLICY(8)                                     System Manager's Manual                                    X86_ENERGY_PERF_POLICY(8)

NAME
       x86_energy_perf_policy - read or write MSR_IA32_ENERGY_PERF_BIAS

SYNOPSIS
       x86_energy_perf_policy [-c cpu] [-v] -r
       x86_energy_perf_policy [-c cpu] [-v] 'performance'
       x86_energy_perf_policy [-c cpu] [-v] 'normal'
       x86_energy_perf_policy [-c cpu] [-v] 'powersave'
       x86_energy_perf_policy [-c cpu] [-v] n

DESCRIPTION
       x86_energy_perf_policy allows software to convey its policy for the relative importance of performance versus energy savings to the proces‐
       sor.

       The processor uses this information in model-specific ways when it must select trade-offs between performance and energy efficiency.

       This policy hint does not supersede Processor Performance states (P-states) or CPU Idle power states (C-states),  but  allows  software  to
       have influence where it would otherwise be unable to express a preference.

       For  example,  this  setting  may  tell the hardware how aggressively or conservatively to control frequency in the "turbo range" above the
       explicitly OS-controlled P-state frequency range.  It may also tell the hardware how aggressively is  should  enter  the  OS  requested  C-
       states.

       Support for this feature is indicated by CPUID.06H.ECX.bit3 per the Intel Architectures Software Developer's Manual.

   Options
       -c  limits  operation  to a single CPU.  The default is to operate on all CPUs.  Note that MSR_IA32_ENERGY_PERF_BIAS is defined per logical
       processor, but that the initial implementations of the MSR were shared among all processors in each package.

       -v increases verbosity.  By default x86_energy_perf_policy is silent.

       -r is for "read-only" mode - the unchanged state is read and displayed.

       performance Set a policy where performance is paramount.  The processor will be unwilling to sacrifice any  performance  for  the  sake  of
       energy saving. This is the hardware default.

       normal Set a policy with a normal balance between performance and energy efficiency.  The processor will tolerate minor performance compro‐
       mise for potentially significant energy savings.  This reasonable default for most desktops and servers.

       powersave Set a policy where the processor can accept a measurable performance hit to maximize energy efficiency.

       n Set MSR_IA32_ENERGY_PERF_BIAS to the specified number.  The range of valid numbers is 0-15, where 0 is maximum performance and 15 is max‐
       imum energy efficiency.

NOTES
       x86_energy_perf_policy runs only as root.

FILES
       /dev/cpu/*/msr

SEE ALSO
       msr(4)

AUTHORS
       Written by Len Brown <len.brown@intel.com>

                                                                                                                         X86_ENERGY_PERF_POLICY(8)
