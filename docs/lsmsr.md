lsmsr(8)                                                                                   System Manager's Manual                                                                                   lsmsr(8)



NAME
       lsmsr - show MSR information for x86 CPUs


SYNOPSIS
       lsmsr [-hv] [-a [-c cpu_nr] [-f family] [-l] [-r name|address] [-V verbosity] [MSR]


DESCRIPTION
       lsmsr  is a tool to display information for machine specific registers of x86 CPUs. Following CPUs are supported: AMD family 0xf and family 0x10. For Intel and other AMD CPUs just a some common MSRs
       is supported.

OPTIONS
       -a, --all
              Show information for all MSRs known to the tool for that CPU family.

       -c cpu_nr, --cpu cpu_nr
              Select CPU (by number) for which MSR information should be displayed (default: 0).

       -f fam, --family fam
              Specify CPU family. Normally CPU family is auto-detected. You can use this option to disable auto-detection, e.g. for debugging purposes.

       -l, --list
              Show definition (address, field description) of selected MSR(s).

       -r name|address, --register name|address
              Specify MSR  (by name or address in hex) for which MSR information should be displayed.

       -V num, --verbosity num
              Select verbosity of output format (between 0 and 4, default: 0)

       -h, --help
              Print help message and exit.

       -v, --version
              Display version info and exit.

Examples

       Show all MSRs beginning with 'MTRR' and force CPU family  to 0x10

         # lsmsr -l -f 0x10 MTRR
          MTRRcap             : 0x000000fe
          MTRRphysBase0       : 0x00000200
          MTRRphysMask0       : 0x00000201
          MTRRphysBase1       : 0x00000202
          MTRRphysMask1       : 0x00000203
          MTRRphysBase2       : 0x00000204
          MTRRphysMask2       : 0x00000205
          MTRRphysBase3       : 0x00000206
          MTRRphysMask3       : 0x00000207
          MTRRphysBase4       : 0x00000208
          MTRRphysMask4       : 0x00000209
          MTRRphysBase5       : 0x0000020a
          MTRRphysMask5       : 0x0000020b
          MTRRphysBase6       : 0x0000020c
          MTRRphysMask6       : 0x0000020d
          MTRRphysBase7       : 0x0000020e
          MTRRphysMask7       : 0x0000020f
          MTRRfix64K_00000    : 0x00000250
          MTRRfix16K_80000    : 0x00000258
          MTRRfix16K_A0000    : 0x00000259
          MTRRfix4K_C0000     : 0x00000268
          MTRRfix4K_C8000     : 0x00000269
          MTRRfix4K_D0000     : 0x0000026a
          MTRRfix4K_D8000     : 0x0000026b
          MTRRfix4K_E0000     : 0x0000026c
          MTRRfix4K_E8000     : 0x0000026d
          MTRRfix4K_F0000     : 0x0000026e
          MTRRfix4K_F8000     : 0x0000026f
          MTRRdefType         : 0x000002ff


       Show 'MTRRcap MSR in verbose one-line mode

         # lsmsr -r MTRRcap -V 1
          MTRRcap = 0x0000000000000508 (MtrrCapVCnt=0x8,  MtrrCapFix=0x1,  MtrrCapWc=0x1)


       Show 'MTRRdefType' in verbose multi-line mode

         # lsmsr -r MTRRdefType -V 3
          MTRRdefType          = 0x0000000000000c00
            MtrrDefMemType=0
            MtrrDefTypeFixEn=0x1
            MtrrDefTypeEn=0x1


       Show definition of MSR 0x200 in verbose multi-line mode (including reserved fields)

         # lsmsr -r 0x200 -V 4 -l
          MTRRphysBase0: 0x00000200
            0-7:Type
            8-11:res
            12-39:PhyBase
            40-63:res


       List all known MSRs for family 0xf

         # lsmsr  -f 0xf -l -a
          TSC                 : 0x00000010; time-stamp counter
          APIC_BASE           : 0x0000001b; APIC base address

          ...

          MTRRphysBase0       : 0x00000200; base of variable MTRR (0)
          MTRRphysMask0       : 0x00000201; mask of variable MTRR (0)
          MTRRphysBase1       : 0x00000202; base of variable MTRR (1)
          MTRRphysMask1       : 0x00000203; mask of variable MTRR (1)

          ...

          MTRRfix4K_F0000     : 0x0000026e
          MTRRfix4K_F8000     : 0x0000026f
          PAT                 : 0x00000277; page attribute table
          MTRRdefType         : 0x000002ff



Author
       lsmsr and this manual page was written by Andreas Herrmann <andreas.herrman3@amd.com>.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License version 2.


REPORTING BUGS
       Please send bug reports to <andreas.herrmann3@amd.com>.



x86utils                                                                                          July 2008                                                                                          lsmsr(8)
