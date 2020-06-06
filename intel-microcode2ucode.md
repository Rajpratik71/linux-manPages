INTEL-MICROCODE2UCODE(8)                                                                   System Manager's Manual                                                                   INTEL-MICROCODE2UCODE(8)



NAME
       intel-microcode2ucode - convert Intel microcode.dat file into ucode files

SYNOPSIS
       intel-microcode2ucode [MICROCODE_FILE]

DESCRIPTION
       intel-microcode2ucode  parses Intel microcode combined text data file (which usually has name microcode.dat) and splits it into individual binary microcode files that can be loaded by the Linux ker‐
       nel.

       Generated microcode files are placed into intel-ucode directory, which is created in the current working directory, and have file name format of FF-MM-SS, where FF is the CPU family  number,  MM  is
       the model number, and SS is stepping.  All three values are zero-filled to two digits and are hexadecimal (letters are in the lower case).

       This tool is mostly of historic interest, as Intel ships separate microcode files now.

OPTIONS
       MICROCODE_FILE
              Path  to  the  microcode.dat  file.   If no path has been provided, the default path /lib/firmware/microcode.dat is used.  If - (single dash) is provided as an argument, data is read from the
              standard input.

EXIT STATUS
       0      Success.

       1      Error occurred: temporary buffer cannot be allocated, input microcode file cannot be opened, microcode version and/or format are unknown, cannot open output file, cannot write to  the  output
              file.

REPORTING BUGS
       Problems with intel-microcode2ucode should be reported to Red Hat Bugzilla ⟨https://bugzilla.redhat.com/⟩

AUTHORS
       intel-microcode2ucode  was written by Kay Sievers <kay.sievers@vrfy.org> and Anton Arapov <anton@redhat.com>.  This manpage was written for Red Hat Enterprise Linux and may be used, modified, and/or
       distributed freely by anyone.

SEE ALSO
       iucode-tool, a tool for manipulating Intel microcode files ⟨https://gitlab.com/iucode-tool/iucode-tool⟩,

       Intel microcode ⟨https://downloadcenter.intel.com/download/28727⟩



MICROCODE_CTL 2.1-53.el7                                                                          2019-05-09                                                                         INTEL-MICROCODE2UCODE(8)
