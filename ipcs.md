IPCS(1P)                   POSIX Programmer's Manual                  IPCS(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       ipcs — report XSI interprocess communication facilities status

SSYYNNOOPPSSIISS
       ipcs [[−qms]] [[−a|−bcopt]]

DDEESSCCRRIIPPTTIIOONN
       The _i_p_c_s utility shall write information about active interprocess
       communication facilities.

       Without options, information shall be written in short format for
       message queues, shared memory segments, and semaphore sets that are
       currently active in the system. Otherwise, the information that is
       displayed is controlled by the options specified.

OOPPTTIIOONNSS
       The _i_p_c_s utility shall conform to the Base Definitions volume of
       POSIX.1‐2008, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s.

       The _i_p_c_s utility accepts the following options:

       −−qq        Write information about active message queues.

       −−mm        Write information about active shared memory segments.

       −−ss        Write information about active semaphore sets.

       If −−qq, −−mm, or −−ss are specified, only information about those facilities
       shall be written. If none of these three are specified, information
       about all three shall be written subject to the following options:

       −−aa        Use all print options. (This is a shorthand notation for −−bb,
                 −−cc, −−oo, −−pp, and −−tt.)

       −−bb        Write information on maximum allowable size. (Maximum number
                 of bytes in messages on queue for message queues, size of
                 segments for shared memory, and number of semaphores in each
                 set for semaphores.)

       −−cc        Write creator's user name and group name; see below.

       −−oo        Write information on outstanding usage. (Number of messages
                 on queue and total number of bytes in messages on queue for
                 message queues, and number of processes attached to shared
                 memory segments.)

       −−pp        Write process number information. (Process ID of the last
                 process to send a message and process ID of the last process
                 to receive a message on message queues, process ID of the
                 creating process, and process ID of the last process to
                 attach or detach on shared memory segments.)

       −−tt        Write time information. (Time of the last control operation
                 that changed the access permissions for all facilities, time
                 of the last _m_s_g_s_n_d() and _m_s_g_r_c_v() operations on message
                 queues, time of the last _s_h_m_a_t() and _s_h_m_d_t() operations on
                 shared memory, and time of the last _s_e_m_o_p() operation on
                 semaphores.)

OOPPEERRAANNDDSS
       None.

SSTTDDIINN
       Not used.

IINNPPUUTT FFIILLEESS
        *  The group database

        *  The user database

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of _i_p_c_s:

       _L_A_N_G      Provide a default value for the internationalization
                 variables that are unset or null. (See the Base Definitions
                 volume of POSIX.1‐2008, _S_e_c_t_i_o_n _8_._2, _I_n_t_e_r_n_a_t_i_o_n_a_l_i_z_a_t_i_o_n
                 _V_a_r_i_a_b_l_e_s for the precedence of internationalization
                 variables used to determine the values of locale categories.)

       _L_C___A_L_L    If set to a non-empty string value, override the values of
                 all the other internationalization variables.

       _L_C___C_T_Y_P_E  Determine the locale for the interpretation of sequences of
                 bytes of text data as characters (for example, single-byte as
                 opposed to multi-byte characters in arguments).

       _L_C___M_E_S_S_A_G_E_S
                 Determine the locale that should be used to affect the format
                 and contents of diagnostic messages written to standard
                 error.

       _N_L_S_P_A_T_H   Determine the location of message catalogs for the processing
                 of _L_C___M_E_S_S_A_G_E_S.

       _T_Z        Determine the timezone for the date and time strings written
                 by _i_p_c_s.  If _T_Z is unset or null, an unspecified default
                 timezone shall be used.

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       An introductory line shall be written with the format:


           ""IIPPCC ssttaattuuss ffrroomm %%ss aass ooff %%ss\\nn"",, <<_s_o_u_r_c_e>>,, <<_d_a_t_e>>

       where <_s_o_u_r_c_e> indicates the source used to gather the statistics and
       <_d_a_t_e> is the information that would be produced by the _d_a_t_e command
       when invoked in the POSIX locale.

       The _i_p_c_s utility then shall create up to three reports depending upon
       the −−qq, −−mm, and −−ss options. The first report shall indicate the status
       of message queues, the second report shall indicate the status of
       shared memory segments, and the third report shall indicate the status
       of semaphore sets.

       If the corresponding facility is not installed or has not been used
       since the last reboot, then the report shall be written out in the
       format:


           ""%%ss ffaacciilliittyy nnoott iinn ssyysstteemm..\\nn"",, <<_f_a_c_i_l_i_t_y>>

       where <_f_a_c_i_l_i_t_y> is _M_e_s_s_a_g_e _Q_u_e_u_e, _S_h_a_r_e_d _M_e_m_o_r_y, or _S_e_m_a_p_h_o_r_e, as
       appropriate. If the facility has been installed and has been used since
       the last reboot, column headings separated by one or more <space>
       characters and followed by a <newline> shall be written as indicated
       below followed by the facility name written out using the format:


           ""%%ss::\\nn"",, <<_f_a_c_i_l_i_t_y>>

       where <_f_a_c_i_l_i_t_y> is _M_e_s_s_a_g_e _Q_u_e_u_e_s, _S_h_a_r_e_d _M_e_m_o_r_y, or _S_e_m_a_p_h_o_r_e_s, as
       appropriate. On the second and third reports the column headings need
       not be written if the last column headings written already provide
       column headings for all information in that report.

       The column headings provided in the first column below and the meaning
       of the information in those columns shall be given in order below; the
       letters in parentheses indicate the options that shall cause the
       corresponding column to appear; ``all'' means that the column shall
       always appear. Each column is separated by one or more <space>
       characters. Note that these options only determine what information is
       provided for each report; they do not determine which reports are
       written.

       T (all)     Type of facility:

                   q       Message queue.

                   m       Shared memory segment.

                   s       Semaphore.

                   This field is a single character written using the format
                   %%cc.

       ID (all)    The identifier for the facility entry. This field shall be
                   written using the format %%dd.

       KEY (all)   The key used as an argument to _m_s_g_g_e_t(), _s_e_m_g_e_t(), or
                   _s_h_m_g_e_t() to create the facility entry.

                   NNoottee::     The key of a shared memory segment is changed to
                             IPC_PRIVATE when the segment has been removed
                             until all processes attached to the segment
                             detach it.

                   This field shall be written using the format 0x%x.

       MODE (all)  The facility access modes and flags. The mode shall consist
                   of 11 characters that are interpreted as follows.

                   The first character shall be:

                   S       If a process is waiting on a _m_s_g_s_n_d() operation.

                   −       If the above is not true.

                   The second character shall be:

                   R       If a process is waiting on a _m_s_g_r_c_v() operation.

                   C or −  If the associated shared memory segment is to be
                           cleared when the first attach operation is
                           executed.

                   −       If none of the above is true.

                   The next nine characters shall be interpreted as three sets
                   of three bits each. The first set refers to the owner's
                   permissions; the next to permissions of others in the
                   usergroup of the facility entry; and the last to all
                   others. Within each set, the first character indicates
                   permission to read, the second character indicates
                   permission to write or alter the facility entry, and the
                   last character is a minus-sign (''−−'').

                   The permissions shall be indicated as follows:

                   _r       If read permission is granted.

                   _w       If write permission is granted.

                   _a       If alter permission is granted.

                   −       If the indicated permission is not granted.

                   The first character following the permissions specifies if
                   there is an alternate or additional access control method
                   associated with the facility. If there is no alternate or
                   additional access control method associated with the
                   facility, a single <space> shall be written; otherwise,
                   another printable character is written.

       OWNER (all) The user name of the owner of the facility entry. If the
                   user name of the owner is found in the user database, at
                   least the first eight column positions of the name shall be
                   written using the format %%ss.  Otherwise, the user ID of the
                   owner shall be written using the format %%dd.

       GROUP (all) The group name of the owner of the facility entry. If the
                   group name of the owner is found in the group database, at
                   least the first eight column positions of the name shall be
                   written using the format %%ss.  Otherwise, the group ID of
                   the owner shall be written using the format %%dd.

       The following nine columns shall be only written out for message
       queues:

       CREATOR (aa,cc)
                   The user name of the creator of the facility entry. If the
                   user name of the creator is found in the user database, at
                   least the first eight column positions of the name shall be
                   written using the format %%ss.  Otherwise, the user ID of the
                   creator shall be written using the format %%dd.

       CGROUP (aa,cc)
                   The group name of the creator of the facility entry. If the
                   group name of the creator is found in the group database,
                   at least the first eight column positions of the name shall
                   be written using the format %%ss.  Otherwise, the group ID of
                   the creator shall be written using the format %%dd.

       CBYTES (aa,oo)
                   The number of bytes in messages currently outstanding on
                   the associated message queue. This field shall be written
                   using the format %%dd.

       QNUM (aa,oo)  The number of messages currently outstanding on the
                   associated message queue. This field shall be written using
                   the format %%dd.

       QBYTES (aa,bb)
                   The maximum number of bytes allowed in messages outstanding
                   on the associated message queue. This field shall be
                   written using the format %%dd.

       LSPID (aa,pp) The process ID of the last process to send a message to the
                   associated queue. This field shall be written using the
                   format:


                       ""%%dd"",, <<_p_i_d>>

                   where <_p_i_d> is 0 if no message has been sent to the
                   corresponding message queue; otherwise, <_p_i_d> shall be the
                   process ID of the last process to send a message to the
                   queue.

       LRPID (aa,pp) The process ID of the last process to receive a message
                   from the associated queue. This field shall be written
                   using the format:


                       ""%%dd"",, <<_p_i_d>>

                   where <_p_i_d> is 0 if no message has been received from the
                   corresponding message queue; otherwise, <_p_i_d> shall be the
                   process ID of the last process to receive a message from
                   the queue.

       STIME (aa,tt) The time the last message was sent to the associated queue.
                   If a message has been sent to the corresponding message
                   queue, the hour, minute, and second of the last time a
                   message was sent to the queue shall be written using the
                   format %%dd:%%22..22dd:%%22..22dd.  Otherwise, the format ""  nnoo--eennttrryy""
                   shall be written.

       RTIME (aa,tt) The time the last message was received from the associated
                   queue.  If a message has been received from the
                   corresponding message queue, the hour, minute, and second
                   of the last time a message was received from the queue
                   shall be written using the format %%dd:%%22..22dd:%%22..22dd.
                   Otherwise, the format ""  nnoo--eennttrryy"" shall be written.

       The following eight columns shall be only written out for shared memory
       segments.

       CREATOR (aa,cc)
                   The user of the creator of the facility entry. If the user
                   name of the creator is found in the user database, at least
                   the first eight column positions of the name shall be
                   written using the format %%ss.  Otherwise, the user ID of the
                   creator shall be written using the format %%dd.

       CGROUP (aa,cc)
                   The group name of the creator of the facility entry. If the
                   group name of the creator is found in the group database,
                   at least the first eight column positions of the name shall
                   be written using the format %%ss.  Otherwise, the group ID of
                   the creator shall be written using the format %%dd.

       NATTCH (aa,oo)
                   The number of processes attached to the associated shared
                   memory segment. This field shall be written using the
                   format %%dd.

       SEGSZ (aa,bb) The size of the associated shared memory segment. This
                   field shall be written using the format %%dd.

       CPID (aa,pp)  The process ID of the creator of the shared memory entry.
                   This field shall be written using the format %%dd.

       LPID (aa,pp)  The process ID of the last process to attach or detach the
                   shared memory segment. This field shall be written using
                   the format:


                       ""%%dd"",, <<_p_i_d>>

                   where <_p_i_d> is 0 if no process has attached the
                   corresponding shared memory segment; otherwise, <_p_i_d> shall
                   be the process ID of the last process to attach or detach
                   the segment.

       ATIME (aa,tt) The time the last attach on the associated shared memory
                   segment was completed. If the corresponding shared memory
                   segment has ever been attached, the hour, minute, and
                   second of the last time the segment was attached shall be
                   written using the format %%dd:%%22..22dd:%%22..22dd.  Otherwise, the
                   format ""  nnoo--eennttrryy"" shall be written.

       DTIME (aa,tt) The time the last detach on the associated shared memory
                   segment was completed. If the corresponding shared memory
                   segment has ever been detached, the hour, minute, and
                   second of the last time the segment was detached shall be
                   written using the format %%dd:%%22..22dd:%%22..22dd.  Otherwise, the
                   format ""  nnoo--eennttrryy"" shall be written.

       The following four columns shall be only written out for semaphore
       sets:

       CREATOR (aa,cc)
                   The user of the creator of the facility entry. If the user
                   name of the creator is found in the user database, at least
                   the first eight column positions of the name shall be
                   written using the format %%ss.  Otherwise, the user ID of the
                   creator shall be written using the format %%dd.

       CGROUP     (aa,cc)
                   The group name of the creator of the facility entry. If the
                   group name of the creator is found in the group database,
                   at least the first eight column positions of the name shall
                   be written using the format %%ss.  Otherwise, the group ID of
                   the creator shall be written using the format %%dd.

       NSEMS (aa,bb) The number of semaphores in the set associated with the
                   semaphore entry. This field shall be written using the
                   format %%dd.

       OTIME (aa,tt) The time the last semaphore operation on the set associated
                   with the semaphore entry was completed. If a semaphore
                   operation has ever been performed on the corresponding
                   semaphore set, the hour, minute, and second of the last
                   semaphore operation on the semaphore set shall be written
                   using the format %%dd:%%22..22dd:%%22..22dd.  Otherwise, the format
                   ""  nnoo--eennttrryy"" shall be written.

       The following column shall be written for all three reports when it is
       requested:

       CTIME (aa,tt) The time the associated entry was created or changed. The
                   hour, minute, and second of the time when the associated
                   entry was created shall be written using the format
                   %%dd:%%22..22dd:%%22..22dd.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    Successful completion.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       Things can change while _i_p_c_s is running; the information it gives is
       guaranteed to be accurate only when it was retrieved.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       None.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       _i_p_c_r_m

       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s, _S_e_c_t_i_o_n _1_2_._2, _U_t_i_l_i_t_y _S_y_n_t_a_x _G_u_i_d_e_l_i_n_e_s

       The System Interfaces volume of POSIX.1‐2008, _m_s_g_r_c_v(), _m_s_g_s_n_d(),
       _s_e_m_g_e_t(), _s_e_m_o_p(), _s_h_m_a_t(), _s_h_m_d_t(), _s_h_m_g_e_t()

CCOOPPYYRRIIGGHHTT
       Portions of this text are reprinted and reproduced in electronic form
       from IEEE Std 1003.1, 2013 Edition, Standard for Information Technology
       -- Portable Operating System Interface (POSIX), The Open Group Base
       Specifications Issue 7, Copyright (C) 2013 by the Institute of
       Electrical and Electronics Engineers, Inc and The Open Group.  (This is
       POSIX.1-2008 with the 2013 Technical Corrigendum 1 applied.) In the
       event of any discrepancy between this version and the original IEEE and
       The Open Group Standard, the original IEEE and The Open Group Standard
       is the referee document. The original Standard can be obtained online
       at http://www.unix.org/online.html .

       Any typographical or formatting errors that appear in this page are
       most likely to have been introduced during the conversion of the source
       files to man page format. To report such errors, see
       https://www.kernel.org/doc/man-pages/reporting_bugs.html .



IEEE/The Open Group                  2013                             IPCS(1P)
