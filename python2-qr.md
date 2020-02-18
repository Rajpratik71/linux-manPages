QR(1)                        Python QR tool                        QR(1)

NAME
       qr - script to create QR codes at the command line

SYNOPSIS
       qr     [--help]     [--factory=FACTORY]     [--optimize=OPTIMIZE]
       [--error-correction=LEVEL] [data]

DESCRIPTION
       This script uses the python qrcode module. It can take data  from
       stdin  or  from the commandline and generate a QR code.  Normally
       it will output the QR code as ascii art to the terminal.  If  the
       output is piped to a file, it will output the image (default type
       of PNG).

OPTIONS
        -h, --help
           Show a help message.

        --factory=FACTORY
           Full python path to the image factory  class  to  create  the
           image with. You can use the following shortcuts to the built-
           in image factory classes: pil (default), pymaging, svg,  svg-
           fragment, svg-path.

        --optimize=OPTIMIZE
           Optimize the data by looking for chunks of at least this many
           characters that could use a more efficient  encoding  method.
           Use 0 to turn off chunk optimization.

        --error-correction=LEVEL
           The  error  correction  level  to  use. Choices are L (7%), M
           (15%, default), Q (25%), and H (30%).

        data
           The data from which the QR code will be generated.

SEE ALSO
       https://github.com/lincolnloop/python-qrcode/

5.3                            25 Jun 2013                         QR(1)
