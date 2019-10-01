
opagetvf(1)                                                                                 IFSFFCLIRG (Man Page)                                                                                 opagetvf(1)



NAME
       opagetvf



       Used  for scripting application use of vFabrics, such as for mpirun parameters. You can query by VF Name, VF Index, Service ID, MGID, PKey, or SL. Fetches the Virtual Fabric info in a delimited for‐
       mat. Returns exactly one matching VF. When multiple VFs match the query, it prefers non-default VFs in which the calling server is a full member. If multiple choices remain, it returns the one  with
       the lowest VF Index. Uses the same algorithm as the Distributed SA Plug-in (DSAP).

       The  tool  can be used with additional scripts to help set PKey, SL, MTU, and Rate when running MPI jobs. Internally, this tool is based on the opasaquery -o vfinfocsv command. For more information,
       see opasaquery

Syntax
       opagetvf [-h hfi] [-p port] [-e] [-d vfname| -S serviceId| -m mcgid|
       -i vfIndex| -k pkey| -L sl]

Options
       --help    Produces full help text.

       -h hfi    Specifies the HFI to send by. Default is first HFI.

       -p port   Specifies the port to send by. Default is first active port.

       -e        Outputs MTU and rate as enum values.

       -d vfname Queries by VirtualFabric Name.

       -S serviceId
                 Queries by Application ServiceId.

       -m gid    Queries by Application Multicast GID.

       -i vfindex
                 Queries by VirtualFabric Index.

       -k pkey   Queries by VirtualFabric PKey.

       -L SL     Queries by VirtualFabric SL.

Examples
       opagetvf -d 'Compute'
       opagetvf -h 2 -p 2 -d 'Compute'

Sample Outputs
       The output is of the form: name:index:pkey:sl:mtu:rate:optionflag::mcastSl as shown in the following example.

       Option flag (bitmask) values include:

       ·      0x00 Indicates no bits are set. Specifically, no QoS, no Security, and no flow control disabled (which means flow control is enabled).

       ·      0x01 Security

       ·      0x02 QoS

       ·      0x04 Flow Control Disable

       # opagetvf -d Default
       Default:0:0xffff:0:unlimited:unlimited:0x0::




Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                   opagetvf(1)
