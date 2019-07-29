REBOOT(2)                  Linux Programmer's Manual                 REBOOT(2)



NNAAMMEE
       reboot - reboot or enable/disable Ctrl-Alt-Del

SSYYNNOOPPSSIISS
       /* Since kernel version 2.1.30 there are symbolic names LINUX_REBOOT_*
          for the constants and a fourth argument to the call: */

       ##iinncclluuddee <<uunniissttdd..hh>>
       ##iinncclluuddee <<lliinnuuxx//rreebboooott..hh>>

       iinntt rreebboooott((iinntt _m_a_g_i_c,, iinntt _m_a_g_i_c_2,, iinntt _c_m_d,, vvooiidd **_a_r_g));;

       /* Under glibc and most alternative libc's (including uclibc, dietlibc,
          musl and a few others), some of the constants involved have gotten
          symbolic names RB_*, and the library call is a 1-argument
          wrapper around the system call: */

       ##iinncclluuddee <<uunniissttdd..hh>>
       ##iinncclluuddee <<ssyyss//rreebboooott..hh>>

       iinntt rreebboooott((iinntt _c_m_d));;

DDEESSCCRRIIPPTTIIOONN
       The rreebboooott() call reboots the system, or enables/disables the reboot
       keystroke (abbreviated CAD, since the default is Ctrl-Alt-Delete; it
       can be changed using llooaaddkkeeyyss(1)).

       This system call fail (with the error EEIINNVVAALL) unless _m_a_g_i_c equals
       LLIINNUUXX__RREEBBOOOOTT__MMAAGGIICC11 (that is, 0xfee1dead) and _m_a_g_i_c_2 equals
       LLIINNUUXX__RREEBBOOOOTT__MMAAGGIICC22 (that is, 672274793).  However, since 2.1.17 also
       LLIINNUUXX__RREEBBOOOOTT__MMAAGGIICC22AA (that is, 85072278) and since 2.1.97 also
       LLIINNUUXX__RREEBBOOOOTT__MMAAGGIICC22BB (that is, 369367448) and since 2.5.71 also
       LLIINNUUXX__RREEBBOOOOTT__MMAAGGIICC22CC (that is, 537993216) are permitted as values for
       _m_a_g_i_c_2.  (The hexadecimal values of these constants are meaningful.)

       The _c_m_d argument can have the following values:

       LLIINNUUXX__RREEBBOOOOTT__CCMMDD__CCAADD__OOFFFF
              (RRBB__DDIISSAABBLLEE__CCAADD, 0).  CAD is disabled.  This means that the CAD
              keystroke will cause a SSIIGGIINNTT signal to be sent to init (process
              1), whereupon this process may decide upon a proper action
              (maybe: kill all processes, sync, reboot).

       LLIINNUUXX__RREEBBOOOOTT__CCMMDD__CCAADD__OONN
              (RRBB__EENNAABBLLEE__CCAADD, 0x89abcdef).  CAD is enabled.  This means that
              the CAD keystroke will immediately cause the action associated
              with LLIINNUUXX__RREEBBOOOOTT__CCMMDD__RREESSTTAARRTT.

       LLIINNUUXX__RREEBBOOOOTT__CCMMDD__HHAALLTT
              (RRBB__HHAALLTT__SSYYSSTTEEMM, 0xcdef0123; since Linux 1.1.76).  The message
              "System halted." is printed, and the system is halted.  Control
              is given to the ROM monitor, if there is one.  If not preceded
              by a ssyynncc(2), data will be lost.

       LLIINNUUXX__RREEBBOOOOTT__CCMMDD__KKEEXXEECC
              (RRBB__KKEEXXEECC, 0x45584543, since Linux 2.6.13).  Execute a kernel
              that has been loaded earlier with kkeexxeecc__llooaadd(2).  This option is
              available only if the kernel was configured with CCOONNFFIIGG__KKEEXXEECC.

       LLIINNUUXX__RREEBBOOOOTT__CCMMDD__PPOOWWEERR__OOFFFF
              (RRBB__PPOOWWEERR__OOFFFF, 0x4321fedc; since Linux 2.1.30).  The message
              "Power down." is printed, the system is stopped, and all power
              is removed from the system, if possible.  If not preceded by a
              ssyynncc(2), data will be lost.

       LLIINNUUXX__RREEBBOOOOTT__CCMMDD__RREESSTTAARRTT
              (RRBB__AAUUTTOOBBOOOOTT, 0x1234567).  The message "Restarting system." is
              printed, and a default restart is performed immediately.  If not
              preceded by a ssyynncc(2), data will be lost.

       LLIINNUUXX__RREEBBOOOOTT__CCMMDD__RREESSTTAARRTT22
              (0xa1b2c3d4; since Linux 2.1.30).  The message "Restarting
              system with command '%s'" is printed, and a restart (using the
              command string given in _a_r_g) is performed immediately.  If not
              preceded by a ssyynncc(2), data will be lost.

       LLIINNUUXX__RREEBBOOOOTT__CCMMDD__SSWW__SSUUSSPPEENNDD
              (RRBB__SSWW__SSUUSSPPEENNDD, 0xd000fce1; since Linux 2.5.18).  The system is
              suspended (hibernated) to disk.  This option is available only
              if the kernel was configured with CCOONNFFIIGG__HHIIBBEERRNNAATTIIOONN.

       Only the superuser may call rreebboooott().

       The precise effect of the above actions depends on the architecture.
       For the i386 architecture, the additional argument does not do anything
       at present (2.1.122), but the type of reboot can be determined by
       kernel command-line arguments ("reboot=...") to be either warm or cold,
       and either hard or through the BIOS.

   BBeehhaavviioorr iinnssiiddee PPIIDD nnaammeessppaacceess
       Since Linux 3.4, if rreebboooott() is called from a PID namespace other than
       the initial PID namespace with one of the _c_m_d values listed below, it
       performs a "reboot" of that namespace: the "init" process of the PID
       namespace is immediately terminated, with the effects described in
       ppiidd__nnaammeessppaacceess(7).

       The values that can be supplied in _c_m_d when calling rreebboooott() in this
       case are as follows:

       LLIINNUUXX__RREEBBOOOOTT__CCMMDD__RREESSTTAARRTT, LLIINNUUXX__RREEBBOOOOTT__CCMMDD__RREESSTTAARRTT22
              The "init" process is terminated, and wwaaiitt(2) in the parent
              process reports that the child was killed with a SSIIGGHHUUPP signal.

       LLIINNUUXX__RREEBBOOOOTT__CCMMDD__PPOOWWEERR__OOFFFF, LLIINNUUXX__RREEBBOOOOTT__CCMMDD__HHAALLTT
              The "init" process is terminated, and wwaaiitt(2) in the parent
              process reports that the child was killed with a SSIIGGIINNTT signal.

       For the other _c_m_d values, rreebboooott() returns -1 and _e_r_r_n_o is set to
       EEIINNVVAALL.

RREETTUURRNN VVAALLUUEE
       For the values of _c_m_d that stop or restart the system, a successful
       call to rreebboooott() does not return.  For the other _c_m_d values, zero is
       returned on success.  In all cases, -1 is returned on failure, and
       _e_r_r_n_o is set appropriately.

EERRRROORRSS
       EEFFAAUULLTT Problem with getting user-space data under
              LLIINNUUXX__RREEBBOOOOTT__CCMMDD__RREESSTTAARRTT22.

       EEIINNVVAALL Bad magic numbers or _c_m_d.

       EEPPEERRMM  The calling process has insufficient privilege to call rreebboooott();
              the caller must have the CCAAPP__SSYYSS__BBOOOOTT inside its user namespace.

CCOONNFFOORRMMIINNGG TTOO
       rreebboooott() is Linux-specific, and should not be used in programs intended
       to be portable.

SSEEEE AALLSSOO
       ssyysstteemmccttll(1), ssyysstteemmdd(1), kkeexxeecc__llooaadd(2), ssyynncc(2), bboooottppaarraamm(7),
       ccaappaabbiilliittiieess(7), ccttrrllaallttddeell(8), hhaalltt(8), sshhuuttddoowwnn(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                         REBOOT(2)
