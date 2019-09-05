QEMU-NBD.8(8)                                                                                                                        QEMU-NBD.8(8)

NAME
       qemu-nbd - QEMU Disk Network Block Device Server

SYNOPSIS
       qemu-nbd [OPTION]... filename

       qemu-nbd -d dev

DESCRIPTION
       Export a QEMU disk image using the NBD protocol.

OPTIONS
       filename is a disk image filename, or a set of block driver options if --image-opts is specified.

       dev is an NBD device.

       --object type,id=id,...props...
           Define a new instance of the type object class identified by id.  See the qemu(1) manual page for full details of the properties
           supported. The common object types that it makes sense to define are the "secret" object, which is used to supply passwords and/or
           encryption keys, and the "tls-creds" object, which is used to supply TLS credentials for the qemu-nbd server.

       -p, --port=port
           The TCP port to listen on (default 10809)

       -o, --offset=offset
           The offset into the image

       -b, --bind=iface
           The interface to bind to (default 0.0.0.0)

       -k, --socket=path
           Use a unix socket with path path

       --image-opts
           Treat filename as a set of image options, instead of a plain filename. If this flag is specified, the -f flag should not be used,
           instead the '"format="' option should be set.

       -f, --format=fmt
           Force the use of the block driver for format fmt instead of auto-detecting

       -r, --read-only
           Export the disk as read-only

       -P, --partition=num
           Only expose partition num

       -s, --snapshot
           Use filename as an external snapshot, create a temporary file with backing_file=filename, redirect the write to the temporary one

       -l, --load-snapshot=snapshot_param
           Load an internal snapshot inside filename and export it as an read-only device, snapshot_param format is
           'snapshot.id=[ID],snapshot.name=[NAME]' or '[ID_OR_NAME]'

       -n, --nocache
       --cache=cache
           The cache mode to be used with the file.  See the documentation of the emulator's "-drive cache=..." option for allowed values.

       --aio=aio
           Set the asynchronous I/O mode between threads (the default) and native (Linux only).

       --discard=discard
           Control whether discard (also known as trim or unmap) requests are ignored or passed to the filesystem.  discard is one of ignore (or
           off), unmap (or on).  The default is ignore.

       --detect-zeroes=detect-zeroes
           Control the automatic conversion of plain zero writes by the OS to driver-specific optimized zero write commands.  detect-zeroes is one
           of off, on or unmap.  unmap converts a zero write to an unmap operation and can only be used if discard is set to unmap.  The default
           is off.

       -c, --connect=dev
           Connect filename to NBD device dev

       -d, --disconnect
           Disconnect the device dev

       -e, --shared=num
           Allow up to num clients to share the device (default 1)

       -t, --persistent
           Don't exit on the last connection

       -x, --export-name=name
           Set the NBD volume export name. This switches the server to use the new style NBD protocol negotiation

       -D, --description=description
           Set the NBD volume export description, as a human-readable string. Requires the use of -x

       --tls-creds=ID
           Enable mandatory TLS encryption for the server by setting the ID of the TLS credentials object previously created with the --object
           option.

       --fork
           Fork off the server process and exit the parent once the server is running.

       -v, --verbose
           Display extra debugging information

       -h, --help
           Display this help and exit

       -V, --version
           Display version information and exit

       -T, --trace [[enable=]pattern][,events=file][,file=file]
           Specify tracing options.

           [enable=]pattern
               Immediately enable events matching pattern.  The file must contain one event name (as listed in the trace-events-all file) per
               line; globbing patterns are accepted too.  This option is only available if QEMU has been compiled with the simple, log or ftrace
               tracing backend.  To specify multiple events or patterns, specify the -trace option multiple times.

               Use "-trace help" to print a list of names of trace points.

           events=file
               Immediately enable events listed in file.  The file must contain one event name (as listed in the trace-events-all file) per line;
               globbing patterns are accepted too.  This option is only available if QEMU has been compiled with the simple, log or ftrace tracing
               backend.

           file=file
               Log output traces to file.  This option is only available if QEMU has been compiled with the simple tracing backend.

SEE ALSO
       qemu(1), qemu-img(1)

AUTHOR
       Copyright (C) 2006 Anthony Liguori <anthony@codemonkey.ws>.  This is free software; see the source for copying conditions.  There is NO
       warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

                                                                    2018-08-08                                                       QEMU-NBD.8(8)
