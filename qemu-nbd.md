QEMU-NBD(8)                                                                                                                                                                                   QEMU-NBD(8)

NAME
       qemu-nbd - QEMU Disk Network Block Device Server

SYNOPSIS
       usage: qemu-nbd [OPTION]...  filename

DESCRIPTION
       Export QEMU disk image using NBD protocol.

OPTIONS
       filename
            is a disk image filename

       -p, --port=port
             port to listen on (default B<10809>)

       -o, --offset=offset
             offset into the image

       -b, --bind=iface
             interface to bind to (default B<0.0.0.0>)

       -k, --socket=path
             Use a unix socket with path I<path>

       -f, --format=format
             Set image format as I<format>

       -r, --read-only
             export read-only

       -P, --partition=num
             only expose partition I<num>

       -s, --snapshot
             use I<filename> as an external snapshot, create a temporary
             file with backing_file=I<filename>, redirect the write to
             the temporary one

       -l, --load-snapshot=snapshot_param
             load an internal snapshot inside I<filename> and export it
             as an read-only device, I<snapshot_param> format is
             'snapshot.id=[ID],snapshot.name=[NAME]' or '[ID_OR_NAME]'

       -n, --nocache
       --cache=cache
             set cache mode to be used with the file.  See the documentation of
             the emulator's C<-drive cache=...> option for allowed values.

       --aio=aio
             choose asynchronous I/O mode between B<threads> (the default)
             and B<native> (Linux only).

       --discard=discard
             toggles whether I<discard> (also known as I<trim> or I<unmap>)
             requests are ignored or passed to the filesystem.  The default is no
             (B<--discard=ignore>).

       -c, --connect=dev
             connect I<filename> to NBD device I<dev>

       -d, --disconnect
             disconnect the specified device

       -e, --shared=num
             device can be shared by I<num> clients (default B<1>)

       -f, --format=fmt
             force block driver for format I<fmt> instead of auto-detecting

       -t, --persistent
             don't exit on the last connection

       -v, --verbose
             display extra debugging information

       -h, --help
             display this help and exit

       -V, --version
             output version information and exit

SEE ALSO
       qemu-img(1)

AUTHOR
       Copyright (C) 2006 Anthony Liguori <anthony@codemonkey.ws>.  This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
       PARTICULAR PURPOSE.

                                                                                                2019-11-05                                                                                    QEMU-NBD(8)
