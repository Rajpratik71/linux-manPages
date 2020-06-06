IBSRPDM(1)                                                                                      USER COMMANDS                                                                                      IBSRPDM(1)



NAME
       ibsrpdm - Discover SRP targets on an InfiniBand Fabric


SYNOPSIS
       ibsrpdm [OPTIONS]


DESCRIPTION
       List InfiniBand SCSI RDMA Protocol (SRP) targets on an IB fabric.


OPTIONS
       -c     Generate output suitable for piping directly to a /sys/class/infiniband_srp/srp-<device>-<port>/add_target file

       -d DEVICE
              Use device file DEVICE (default /dev/infiniband/umad0)

       -k P_KEY
              Use InfiniBand partition key P_KEY (default 0xffff)

       -v     Print more verbose output


SEE ALSO
       srp_daemon(1)


AUTHORS
       Roland Dreier
              <roland@kernel.org>




OpenFabrics                                                                                    August 30, 2005                                                                                     IBSRPDM(1)
