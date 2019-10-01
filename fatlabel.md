FATLABEL(8)                                                                                       dosfstools                                                                                      FATLABEL(8)



NAME
       fatlabel - set or get MS-DOS filesystem label


SYNOPSIS
       fatlabel DEVICE [LABEL]


DESCRIPTION
       fatlabel set or gets a MS-DOS filesystem label from a given device.

       If the label is omitted, then the label name of the specified device is written on the standard output. A label can't be longer than 11 bytes.


OPTIONS
       -h, --help
           Displays a help message.

       -V, --version
           Shows version.


SEE ALSO
       fsck.fat(8)
       mkfs.fat(8)


HOMEPAGE
       More information about fatlabel and dosfstools can be found at <http://daniel-baumann.ch/software/dosfstools/>.


AUTHORS
       dosfstools  were  written  by  Werner  Almesberger  <werner.almesberger@lrc.di.epfl.ch>,  Roman  Hodek  <Roman.Hodek@informatik.uni-erlangen.de>, and others. The current maintainer is Daniel Baumann
       <mail@daniel-baumann.ch>.



3.0.19                                                                                            2013-06-11                                                                                      FATLABEL(8)
