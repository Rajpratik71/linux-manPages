LDD(1)                     Linux Programmer's Manual                    LDD(1)



NNAAMMEE
       ldd - print shared object dependencies

SSYYNNOOPPSSIISS
       lldddd [_o_p_t_i_o_n]... _f_i_l_e...

DDEESSCCRRIIPPTTIIOONN
       lldddd prints the shared objects (shared libraries) required by each
       program or shared object specified on the command line.  An example of
       its use and output is the following:

         $ lldddd //bbiinn//llss
                 linux-vdso.so.1 (0x00007ffcc3563000)
                 libselinux.so.1 => /lib64/libselinux.so.1 (0x00007f87e5459000)
                 libcap.so.2 => /lib64/libcap.so.2 (0x00007f87e5254000)
                 libc.so.6 => /lib64/libc.so.6 (0x00007f87e4e92000)
                 libpcre.so.1 => /lib64/libpcre.so.1 (0x00007f87e4c22000)
                 libdl.so.2 => /lib64/libdl.so.2 (0x00007f87e4a1e000)
                 /lib64/ld-linux-x86-64.so.2 (0x00005574bf12e000)
                 libattr.so.1 => /lib64/libattr.so.1 (0x00007f87e4817000)
                 libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f87e45fa000)

       In the usual case, lldddd invokes the standard dynamic linker (see
       lldd..ssoo(8)) with the LLDD__TTRRAACCEE__LLOOAADDEEDD__OOBBJJEECCTTSS environment variable set to
       1.  This causes the dynamic linker to inspect the program's dynamic
       dependencies, and find (according to the rules described in lldd..ssoo(8))
       and load the objects that satisfy those dependencies.  For each
       dependency, lldddd displays the location of the matching object and the
       (hexadecimal) address at which it is loaded.  (The _l_i_n_u_x_-_v_d_s_o and
       _l_d_-_l_i_n_u_x shared dependencies are special; see vvddssoo(7) and lldd..ssoo(8).)

   SSeeccuurriittyy
       Be aware that in some circumstances (e.g., where the program specifies
       an ELF interpreter other than _l_d_-_l_i_n_u_x_._s_o), some versions of lldddd may
       attempt to obtain the dependency information by attempting to directly
       execute the program, which may lead to the execution of whatever code
       is defined in the program's ELF interpreter, and perhaps to execution
       of the program itself.  (In glibc versions before 2.27, the upstream
       lldddd implementation did this for example, although most distributions
       provided a modified version that did not.)

       Thus, you should _n_e_v_e_r employ lldddd on an untrusted executable, since
       this may result in the execution of arbitrary code.  A safer
       alternative when dealing with untrusted executables is:

           $ oobbjjdduummpp --pp //ppaatthh//ttoo//pprrooggrraamm || ggrreepp NNEEEEDDEEDD

       Note, however, that this alternative shows only the direct dependencies
       of the executable, while lldddd shows the entire dependency tree of the
       executable.

OOPPTTIIOONNSS
       ----vveerrssiioonn
              Print the version number of lldddd.

       --vv, ----vveerrbboossee
              Print all information, including, for example, symbol versioning
              information.

       --uu, ----uunnuusseedd
              Print unused direct dependencies.  (Since glibc 2.3.4.)

       --dd, ----ddaattaa--rreellooccss
              Perform relocations and report any missing objects (ELF only).

       --rr, ----ffuunnccttiioonn--rreellooccss
              Perform relocations for both data objects and functions, and
              report any missing objects or functions (ELF only).

       ----hheellpp Usage information.

BBUUGGSS
       lldddd does not work on a.out shared libraries.

       lldddd does not work with some extremely old a.out programs which were
       built before lldddd support was added to the compiler releases.  If you
       use lldddd on one of these programs, the program will attempt to run with
       _a_r_g_c = 0 and the results will be unpredictable.

SSEEEE AALLSSOO
       pplldddd(1), sspprrooff(1), lldd..ssoo(8), llddccoonnffiigg(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



                                  2017-09-15                            LDD(1)
