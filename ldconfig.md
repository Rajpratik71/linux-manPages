LDCONFIG(8)                Linux Programmer's Manual               LDCONFIG(8)



NNAAMMEE
       ldconfig - configure dynamic linker run-time bindings

SSYYNNOOPPSSIISS
       //ssbbiinn//llddccoonnffiigg [--nnNNvvXXVV] [--ff _c_o_n_f] [--CC _c_a_c_h_e] [--rr _r_o_o_t] _d_i_r_e_c_t_o_r_y...
       //ssbbiinn//llddccoonnffiigg --ll [--vv] _l_i_b_r_a_r_y...
       //ssbbiinn//llddccoonnffiigg --pp

DDEESSCCRRIIPPTTIIOONN
       llddccoonnffiigg creates the necessary links and cache to the most recent
       shared libraries found in the directories specified on the command
       line, in the file _/_e_t_c_/_l_d_._s_o_._c_o_n_f, and in the trusted directories, _/_l_i_b
       and _/_u_s_r_/_l_i_b (on some 64-bit architectures such as x86-64, _/_l_i_b and
       _/_u_s_r_/_l_i_b are the trusted directories for 32-bit libraries, while _/_l_i_b_6_4
       and _/_u_s_r_/_l_i_b_6_4 are used for 64-bit libraries).

       The cache is used by the run-time linker, _l_d_._s_o or _l_d_-_l_i_n_u_x_._s_o.
       llddccoonnffiigg checks the header and filenames of the libraries it encounters
       when determining which versions should have their links updated.

       llddccoonnffiigg will attempt to deduce the type of ELF libraries (i.e., libc5
       or libc6/glibc) based on what C libraries, if any, the library was
       linked against.

       Some existing libraries do not contain enough information to allow the
       deduction of their type.  Therefore, the _/_e_t_c_/_l_d_._s_o_._c_o_n_f file format
       allows the specification of an expected type.  This is used _o_n_l_y for
       those ELF libraries which we can not work out.  The format is
       "dirname=TYPE", where TYPE can be libc4, libc5, or libc6.  (This syntax
       also works on the command line.)  Spaces are _n_o_t allowed.  Also see the
       --pp option.  llddccoonnffiigg should normally be run by the superuser as it may
       require write permission on some root owned directories and files.

OOPPTTIIOONNSS
       --cc _f_m_t, ----ffoorrmmaatt==_f_m_t
              (Since glibc 2.2) Cache format to use: _o_l_d, _n_e_w, or _c_o_m_p_a_t
              (default).

       --CC _c_a_c_h_e
              Use _c_a_c_h_e instead of _/_e_t_c_/_l_d_._s_o_._c_a_c_h_e.

       --ff _c_o_n_f
              Use _c_o_n_f instead of _/_e_t_c_/_l_d_._s_o_._c_o_n_f.

       --ii, ----iiggnnoorree--aauuxx--ccaacchhee
              (Since glibc 2.7) Ignore auxiliary cache file.

       --ll     (Since glibc 2.2) Library mode.  Manually link individual
              libraries.  Intended for use by experts only.

       --nn     Process only the directories specified on the command line.
              Don't process the trusted directories, nor those specified in
              _/_e_t_c_/_l_d_._s_o_._c_o_n_f.  Implies --NN.

       --NN     Don't rebuild the cache.  Unless --XX is also specified, links are
              still updated.

       --pp, ----pprriinntt--ccaacchhee
              Print the lists of directories and candidate libraries stored in
              the current cache.

       --rr _r_o_o_t
              Change to and use _r_o_o_t as the root directory.

       --vv, ----vveerrbboossee
              Verbose mode.  Print current version number, the name of each
              directory as it is scanned, and any links that are created.
              Overrides quiet mode.

       --VV, ----vveerrssiioonn
              Print program version.

       --XX     Don't update links.  Unless --NN is also specified, the cache is
              still rebuilt.

FFIILLEESS
       _/_l_i_b_/_l_d_._s_o
              Run-time linker/loader.
       _/_e_t_c_/_l_d_._s_o_._c_o_n_f
              File containing a list of directories, one per line, in which to
              search for libraries.
       _/_e_t_c_/_l_d_._s_o_._c_a_c_h_e
              File containing an ordered list of libraries found in the
              directories specified in _/_e_t_c_/_l_d_._s_o_._c_o_n_f, as well as those found
              in the trusted directories.

SSEEEE AALLSSOO
       lldddd(1), lldd..ssoo(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



GNU                               2017-09-15                       LDCONFIG(8)
