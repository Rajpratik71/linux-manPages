ICONV(1)                       Linux User Manual                      ICONV(1)



NNAAMMEE
       iconv - convert text from one character encoding to another

SSYYNNOOPPSSIISS
       iiccoonnvv [_o_p_t_i_o_n_s] [-f _f_r_o_m_-_e_n_c_o_d_i_n_g] [-t _t_o_-_e_n_c_o_d_i_n_g] [_i_n_p_u_t_f_i_l_e]...

DDEESSCCRRIIPPTTIIOONN
       The iiccoonnvv program reads in text in one encoding and outputs the text in
       another encoding.  If no input files are given, or if it is given as a
       dash (-), iiccoonnvv reads from standard input.  If no output file is given,
       iiccoonnvv writes to standard output.

       If no _f_r_o_m_-_e_n_c_o_d_i_n_g is given, the default is derived from the current
       locale's character encoding.  If no _t_o_-_e_n_c_o_d_i_n_g is given, the default
       is derived from the current locale's character encoding.

OOPPTTIIOONNSS
       --ff _f_r_o_m_-_e_n_c_o_d_i_n_g, ----ffrroomm--ccooddee==_f_r_o_m_-_e_n_c_o_d_i_n_g
              Use _f_r_o_m_-_e_n_c_o_d_i_n_g for input characters.

       --tt _t_o_-_e_n_c_o_d_i_n_g, ----ttoo--ccooddee==_t_o_-_e_n_c_o_d_i_n_g
              Use _t_o_-_e_n_c_o_d_i_n_g for output characters.

              If the string ////IIGGNNOORREE is appended to _t_o_-_e_n_c_o_d_i_n_g, characters
              that cannot be converted are discarded and an error is printed
              after conversion.

              If the string ////TTRRAANNSSLLIITT is appended to _t_o_-_e_n_c_o_d_i_n_g, characters
              being converted are transliterated when needed and possible.
              This means that when a character cannot be represented in the
              target character set, it can be approximated through one or
              several similar looking characters.  Characters that are outside
              of the target character set and cannot be transliterated are
              replaced with a question mark (?) in the output.

       --ll, ----lliisstt
              List all known character set encodings.

       --cc     Silently discard characters that cannot be converted instead of
              terminating when encountering such characters.

       --oo _o_u_t_p_u_t_f_i_l_e, ----oouuttppuutt==_o_u_t_p_u_t_f_i_l_e
              Use _o_u_t_p_u_t_f_i_l_e for output.

       --ss, ----ssiilleenntt
              This option is ignored; it is provided only for compatibility.

       ----vveerrbboossee
              Print progress information on standard error when processing
              multiple files.

       --??, ----hheellpp
              Print a usage summary and exit.

       ----uussaaggee
              Print a short usage summary and exit.

       --VV, ----vveerrssiioonn
              Print the version number, license, and disclaimer of warranty
              for iiccoonnvv.

EEXXIITT SSTTAATTUUSS
       Zero on success, nonzero on errors.

EENNVVIIRROONNMMEENNTT
       Internally, the iiccoonnvv program uses the iiccoonnvv(3) function which in turn
       uses _g_c_o_n_v modules (dynamically loaded shared libraries) to convert to
       and from a character set.  Before calling iiccoonnvv(3), the iiccoonnvv program
       must first allocate a conversion descriptor using iiccoonnvv__ooppeenn(3).  The
       operation of the latter function is influenced by the setting of the
       GGCCOONNVV__PPAATTHH environment variable:

       *  If GGCCOONNVV__PPAATTHH is not set, iiccoonnvv__ooppeenn(3) loads the system gconv
          module configuration cache file created by iiccoonnvvccoonnffiigg(8) and then,
          based on the configuration, loads the gconv modules needed to
          perform the conversion.  If the system gconv module configuration
          cache file is not available then the system gconv module
          configuration file is used.

       *  If GGCCOONNVV__PPAATTHH is defined (as a colon-separated list of pathnames),
          the system gconv module configuration cache is not used.  Instead,
          iiccoonnvv__ooppeenn(3) first tries to load the configuration files by
          searching the directories in GGCCOONNVV__PPAATTHH in order, followed by the
          system default gconv module configuration file.  If a directory does
          not contain a gconv module configuration file, any gconv modules
          that it may contain are ignored.  If a directory contains a gconv
          module configuration file and it is determined that a module needed
          for this conversion is available in the directory, then the needed
          module is loaded from that directory, the order being such that the
          first suitable module found in GGCCOONNVV__PPAATTHH is used.  This allows
          users to use custom modules and even replace system-provided modules
          by providing such modules in GGCCOONNVV__PPAATTHH directories.

FFIILLEESS
       _/_u_s_r_/_l_i_b_/_g_c_o_n_v
              Usual default gconv module path.

       _/_u_s_r_/_l_i_b_/_g_c_o_n_v_/_g_c_o_n_v_-_m_o_d_u_l_e_s
              Usual system default gconv module configuration file.

       _/_u_s_r_/_l_i_b_/_g_c_o_n_v_/_g_c_o_n_v_-_m_o_d_u_l_e_s_._c_a_c_h_e
              Usual system gconv module configuration cache.

CCOONNFFOORRMMIINNGG TTOO
       POSIX.1-2001.

EEXXAAMMPPLLEE
       Convert text from the ISO 8859-15 character encoding to UTF-8:

           $ iiccoonnvv --ff IISSOO--88885599--1155 --tt UUTTFF--88 << iinnppuutt..ttxxtt >> oouuttppuutt..ttxxtt

       The next example converts from UTF-8 to ASCII, transliterating when
       possible:

           $ eecchhoo aabbcc ßß αα €€ ààḃḃçç || iiccoonnvv --ff UUTTFF--88 --tt AASSCCIIII////TTRRAANNSSLLIITT
           abc ss ? EUR abc

SSEEEE AALLSSOO
       llooccaallee(1), iiccoonnvv(3), nnll__llaannggiinnffoo(3), cchhaarrsseettss(7), iiccoonnvvccoonnffiigg(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



GNU                               2018-02-02                          ICONV(1)
