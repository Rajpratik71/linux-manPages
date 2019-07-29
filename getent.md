GETENT(1)                        User Commands                       GETENT(1)



NNAAMMEE
       getent - get entries from Name Service Switch libraries

SSYYNNOOPPSSIISS
       ggeetteenntt  [[_o_p_t_i_o_n]]......  _d_a_t_a_b_a_s_e  _k_e_y......

DDEESSCCRRIIPPTTIIOONN
       The ggeetteenntt command displays entries from databases supported by the
       Name Service Switch libraries, which are configured in
       _/_e_t_c_/_n_s_s_w_i_t_c_h_._c_o_n_f.  If one or more _k_e_y arguments are provided, then
       only the entries that match the supplied keys will be displayed.
       Otherwise, if no _k_e_y is provided, all entries will be displayed (unless
       the database does not support enumeration).

       The _d_a_t_a_b_a_s_e may be any of those supported by the GNU C Library, listed
       below:

          aahhoossttss    When no _k_e_y is provided, use sseetthhoosstteenntt(3), ggeetthhoosstteenntt(3),
                    and eennddhhoosstteenntt(3) to enumerate the hosts database.  This
                    is identical to using hhoossttss.  When one or more _k_e_y
                    arguments are provided, pass each _k_e_y in succession to
                    ggeettaaddddrriinnffoo(3) with the address family AAFF__UUNNSSPPEECC,
                    enumerating each socket address structure returned.

          aahhoossttssvv44  Same as aahhoossttss, but use the address family AAFF__IINNEETT.

          aahhoossttssvv66  Same as aahhoossttss, but use the address family AAFF__IINNEETT66.  The
                    call to ggeettaaddddrriinnffoo(3) in this case includes the
                    AAII__VV44MMAAPPPPEEDD flag.

          aalliiaasseess   When no _k_e_y is provided, use sseettaalliiaasseenntt(3),
                    ggeettaalliiaasseenntt(3), and eennddaalliiaasseenntt(3) to enumerate the
                    aliases database.  When one or more _k_e_y arguments are
                    provided, pass each _k_e_y in succession to ggeettaalliiaassbbyynnaammee(3)
                    and display the result.

          eetthheerrss    When one or more _k_e_y arguments are provided, pass each _k_e_y
                    in succession to eetthheerr__aattoonn(3) and eetthheerr__hhoossttttoonn(3) until
                    a result is obtained, and display the result.  Enumeration
                    is not supported on eetthheerrss, so a _k_e_y must be provided.

          ggrroouupp     When no _k_e_y is provided, use sseettggrreenntt(3), ggeettggrreenntt(3), and
                    eennddggrreenntt(3) to enumerate the group database.  When one or
                    more _k_e_y arguments are provided, pass each numeric _k_e_y to
                    ggeettggrrggiidd(3) and each nonnumeric _k_e_y to ggeettggrrnnaamm(3) and
                    display the result.

          ggsshhaaddooww   When no _k_e_y is provided, use sseettssggeenntt(3), ggeettssggeenntt(3), and
                    eennddssggeenntt(3) to enumerate the gshadow database.  When one
                    or more _k_e_y arguments are provided, pass each _k_e_y in
                    succession to ggeettssggnnaamm(3) and display the result.

          hhoossttss     When no _k_e_y is provided, use sseetthhoosstteenntt(3), ggeetthhoosstteenntt(3),
                    and eennddhhoosstteenntt(3) to enumerate the hosts database.  When
                    one or more _k_e_y arguments are provided, pass each _k_e_y to
                    ggeetthhoossttbbyyaaddddrr(3) or ggeetthhoossttbbyynnaammee22(3), depending on
                    whether a call to iinneett__ppttoonn(3) indicates that the _k_e_y is
                    an IPv6 or IPv4 address or not, and display the result.

          iinniittggrroouuppss
                    When one or more _k_e_y arguments are provided, pass each _k_e_y
                    in succession to ggeettggrroouupplliisstt(3) and display the result.
                    Enumeration is not supported on iinniittggrroouuppss, so a _k_e_y must
                    be provided.

          nneettggrroouupp  When one _k_e_y is provided, pass the _k_e_y to sseettnneettggrreenntt(3)
                    and, using ggeettnneettggrreenntt(3) display the resulting string
                    triple (_h_o_s_t_n_a_m_e, _u_s_e_r_n_a_m_e, _d_o_m_a_i_n_n_a_m_e).  Alternatively,
                    three _k_e_y_s may be provided, which are interpreted as the
                    _h_o_s_t_n_a_m_e, _u_s_e_r_n_a_m_e and _d_o_m_a_i_n_n_a_m_e to match to a netgroup
                    name via iinnnneettggrr(3).  Enumeration is not supported on
                    nneettggrroouupp, so either one or three _k_e_y_s must be provided.

          nneettwwoorrkkss  When no _k_e_y is provided, use sseettnneetteenntt(3), ggeettnneetteenntt(3),
                    and eennddnneetteenntt(3) to enumerate the networks database.  When
                    one or more _k_e_y arguments are provided, pass each numeric
                    _k_e_y to ggeettnneettbbyyaaddddrr(3) and each nonnumeric _k_e_y to
                    ggeettnneettbbyynnaammee(3) and display the result.

          ppaasssswwdd    When no _k_e_y is provided, use sseettppwweenntt(3), ggeettppwweenntt(3), and
                    eennddppwweenntt(3) to enumerate the passwd database.  When one or
                    more _k_e_y arguments are provided, pass each numeric _k_e_y to
                    ggeettppwwuuiidd(3) and each nonnumeric _k_e_y to ggeettppwwnnaamm(3) and
                    display the result.

          pprroottooccoollss When no _k_e_y is provided, use sseettpprroottooeenntt(3),
                    ggeettpprroottooeenntt(3), and eennddpprroottooeenntt(3) to enumerate the
                    protocols database.  When one or more _k_e_y arguments are
                    provided, pass each numeric _k_e_y to ggeettpprroottoobbyynnuummbbeerr(3) and
                    each nonnumeric _k_e_y to ggeettpprroottoobbyynnaammee(3) and display the
                    result.

          rrppcc       When no _k_e_y is provided, use sseettrrppcceenntt(3), ggeettrrppcceenntt(3),
                    and eennddrrppcceenntt(3) to enumerate the rpc database.  When one
                    or more _k_e_y arguments are provided, pass each numeric _k_e_y
                    to ggeettrrppccbbyynnuummbbeerr(3) and each nonnumeric _k_e_y to
                    ggeettrrppccbbyynnaammee(3) and display the result.

          sseerrvviicceess  When no _k_e_y is provided, use sseettsseerrvveenntt(3), ggeettsseerrvveenntt(3),
                    and eennddsseerrvveenntt(3) to enumerate the services database.
                    When one or more _k_e_y arguments are provided, pass each
                    numeric _k_e_y to ggeettsseerrvvbbyynnuummbbeerr(3) and each nonnumeric _k_e_y
                    to ggeettsseerrvvbbyynnaammee(3) and display the result.

          sshhaaddooww    When no _k_e_y is provided, use sseettssppeenntt(3), ggeettssppeenntt(3), and
                    eennddssppeenntt(3) to enumerate the shadow database.  When one or
                    more _k_e_y arguments are provided, pass each _k_e_y in
                    succession to ggeettssppnnaamm(3) and display the result.

OOPPTTIIOONNSS
       --ss  _s_e_r_v_i_c_e, ----sseerrvviiccee  _s_e_r_v_i_c_e
              Override all databases with the specified service.  (Since glibc
              2.2.5.)

       --ss  _d_a_t_a_b_a_s_e::_s_e_r_v_i_c_e, ----sseerrvviiccee  _d_a_t_a_b_a_s_e::_s_e_r_v_i_c_e
              Override only specified databases with the specified service.
              The option may be used multiple times, but only the last service
              for each database will be used.  (Since glibc 2.4.)

       --ii, ----nnoo--iiddnn
              Disables IDN encoding in lookups for aahhoossttss/ggeettaaddddrriinnffoo(3)
              (Since glibc-2.13.)

       --??, ----hheellpp
              Print a usage summary and exit.

       ----uussaaggee
              Print a short usage summary and exit.

       --VV, ----vveerrssiioonn
              Print the version number, license, and disclaimer of warranty
              for ggeetteenntt.

EEXXIITT SSTTAATTUUSS
       One of the following exit values can be returned by ggeetteenntt:

          00         Command completed successfully.

          11         Missing arguments, or _d_a_t_a_b_a_s_e unknown.

          22         One or more supplied _k_e_y could not be found in the
                    _d_a_t_a_b_a_s_e.

          33         Enumeration not supported on this _d_a_t_a_b_a_s_e.

SSEEEE AALLSSOO
       nnsssswwiittcchh..ccoonnff(5)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2015-04-19                         GETENT(1)
