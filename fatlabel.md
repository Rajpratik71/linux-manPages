FATLABEL(8)                System Manager's Manual                FATLABEL(8)

NAME
       fatlabel - set or get MS-DOS filesystem label

SYNOPSIS
       fatlabel DEVICE [LABEL]

DESCRIPTION
       fatlabel set or gets a MS-DOS filesystem label from a given device.

       If  LABEL  is  omitted, then the label name of the specified device is
       written on the standard output.  A  label  can't  be  longer  than  11
       bytes.

OPTIONS
       -h, --help
           Displays a help message.

       -V, --version
           Shows version.

SEE ALSO
       fsck.fat(8)
       mkfs.fat(8)

HOMEPAGE
       The  home  for  the  dosfstools  project  is  its  GitHub project page
       ⟨https://github.com/dosfstools/dosfstools⟩.

AUTHORS
       dosfstools were written  by  Werner  Almesberger  ⟨werner.almesberger@
       lrc.di.epfl.ch⟩, Roman Hodek ⟨Roman.Hodek@informatik.uni-erlangen.de⟩,
       and others.  The current maintainer is Andreas Bombe ⟨aeb@debian.org⟩.

dosfstools 4.1                    2015-04-16                      FATLABEL(8)
