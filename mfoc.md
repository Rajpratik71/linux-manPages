MFOC(1)                                                       General Commands Manual                                                      MFOC(1)

NAME
       mfoc - MIFARE Classic offline cracker

SYNOPSIS
       mfoc [ -h ] [ -k KEY ]...  [ -O FILE ] [ -P NUM ] [ -T NUM ]

DESCRIPTION
       This manual page documents briefly the mfoc command.

       mfoc  is  a  program that cracks the encryption of a MIFARE Classic chip and dumps the chip's keys and decrypted memory contents to a file.
       To run it you need to have access to an NFC reader and, of course, a card equipped with a MIFARE Classic chip.

OPTIONS
       A summary of options is included below.

       -h     Show summary of options.

       -k KEY Initially try KEY in addition to the default keys.

       -O FILE
              Dump card contents to FILE.

       -P NUM Probe each sector up to NUM times.  Default is 20.

       -T NUM Set half the range for a possible distance tolerance to NUM.  Default is 20 (for a total range of 40).

AUTHOR
       mfoc was written by Norbert Szetei and Pavol Luptak with contributions by others.

       This manual page was written by Thomas Hood <jdthood@gmail.com>.  MIFARE is a trade mark of NXP bv, Netherlands.

                                                                   May 13, 2011                                                            MFOC(1)
