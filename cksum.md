CKSUM(1P)                  POSIX Programmer's Manual                 CKSUM(1P)



PPRROOLLOOGG
       This manual page is part of the POSIX Programmer's Manual.  The Linux
       implementation of this interface may differ (consult the corresponding
       Linux manual page for details of Linux behavior), or the interface may
       not be implemented on Linux.


NNAAMMEE
       cksum — write file checksums and sizes

SSYYNNOOPPSSIISS
       cksum [[_f_i_l_e...]]

DDEESSCCRRIIPPTTIIOONN
       The _c_k_s_u_m utility shall calculate and write to standard output a cyclic
       redundancy check (CRC) for each input file, and also write to standard
       output the number of octets in each file. The CRC used is based on the
       polynomial used for CRC error checking in the ISO/IEC 8802‐3:1996
       standard (Ethernet).

       The encoding for the CRC checksum is defined by the generating
       polynomial:


           _G(_x)=_x32+_x26+_x23+_x22+_x16+_x12+_x11+_x10+_x8+_x7+_x5+_x4+_x2+_x+1

       Mathematically, the CRC value corresponding to a given file shall be
       defined by the following procedure:

        1. The _n bits to be evaluated are considered to be the coefficients of
           a mod 2 polynomial _M(_x) of degree _n−1.  These _n bits are the bits
           from the file, with the most significant bit being the most
           significant bit of the first octet of the file and the last bit
           being the least significant bit of the last octet, padded with zero
           bits (if necessary) to achieve an integral number of octets,
           followed by one or more octets representing the length of the file
           as a binary value, least significant octet first. The smallest
           number of octets capable of representing this integer shall be
           used.

        2. _M(_x) is multiplied by _x32 (that is, shifted left 32 bits) and
           divided by _G(_x) using mod 2 division, producing a remainder _R(_x) of
           degree ≤ 31.

        3. The coefficients of _R(_x) are considered to be a 32-bit sequence.

        4. The bit sequence is complemented and the result is the CRC.

OOPPTTIIOONNSS
       None.

OOPPEERRAANNDDSS
       The following operand shall be supported:

       _f_i_l_e      A pathname of a file to be checked. If no _f_i_l_e operands are
                 specified, the standard input shall be used.

SSTTDDIINN
       The standard input shall be used if no _f_i_l_e operands are specified, and
       shall be used if a _f_i_l_e operand is ''−−'' and the implementation treats
       the ''−−'' as meaning standard input.  Otherwise, the standard input shall
       not be used.  See the INPUT FILES section.

IINNPPUUTT FFIILLEESS
       The input files can be any file type.

EENNVVIIRROONNMMEENNTT VVAARRIIAABBLLEESS
       The following environment variables shall affect the execution of
       _c_k_s_u_m:

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

AASSYYNNCCHHRROONNOOUUSS EEVVEENNTTSS
       Default.

SSTTDDOOUUTT
       For each file processed successfully, the _c_k_s_u_m utility shall write in
       the following format:


           ""%%uu %%dd %%ss\\nn"",, <<_c_h_e_c_k_s_u_m>, <_# _o_f _o_c_t_e_t_s>, <_p_a_t_h_n_a_m_e>

       If no _f_i_l_e operand was specified, the pathname and its leading <space>
       shall be omitted.

SSTTDDEERRRR
       The standard error shall be used only for diagnostic messages.

OOUUTTPPUUTT FFIILLEESS
       None.

EEXXTTEENNDDEEDD DDEESSCCRRIIPPTTIIOONN
       None.

EEXXIITT SSTTAATTUUSS
       The following exit values shall be returned:

        0    All files were processed successfully.

       >0    An error occurred.

CCOONNSSEEQQUUEENNCCEESS OOFF EERRRROORRSS
       Default.

       _T_h_e _f_o_l_l_o_w_i_n_g _s_e_c_t_i_o_n_s _a_r_e _i_n_f_o_r_m_a_t_i_v_e_.

AAPPPPLLIICCAATTIIOONN UUSSAAGGEE
       The _c_k_s_u_m utility is typically used to quickly compare a suspect file
       against a trusted version of the same, such as to ensure that files
       transmitted over noisy media arrive intact. However, this comparison
       cannot be considered cryptographically secure. The chances of a damaged
       file producing the same CRC as the original are small; deliberate
       deception is difficult, but probably not impossible.

       Although input files to _c_k_s_u_m can be any type, the results need not be
       what would be expected on character special device files or on file
       types not described by the System Interfaces volume of POSIX.1‐2008.
       Since this volume of POSIX.1‐2008 does not specify the block size used
       when doing input, checksums of character special files need not process
       all of the data in those files.

       The algorithm is expressed in terms of a bitstream divided into octets.
       If a file is transmitted between two systems and undergoes any data
       transformation (such as changing little-endian byte ordering to big-
       endian), identical CRC values cannot be expected. Implementations
       performing such transformations may extend _c_k_s_u_m to handle such
       situations.

EEXXAAMMPPLLEESS
       None.

RRAATTIIOONNAALLEE
       The following C-language program can be used as a model to describe the
       algorithm. It assumes that a cchhaarr is one octet. It also assumes that
       the entire file is available for one pass through the function. This
       was done for simplicity in demonstrating the algorithm, rather than as
       an implementation model.


           ssttaattiicc uunnssiiggnneedd lloonngg ccrrccttaabb[[]] == {{
           00xx0000000000000000,,
           00xx0044cc1111ddbb77,, 00xx0099882233bb66ee,, 00xx00dd44332266dd99,, 00xx113300447766ddcc,, 00xx1177cc5566bb66bb,,
           00xx11aa886644ddbb22,, 00xx11ee447755000055,, 00xx22660088eeddbb88,, 00xx2222cc99ff0000ff,, 00xx22ff88aadd66dd66,,
           00xx22bb44bbccbb6611,, 00xx335500cc99bb6644,, 00xx3311ccdd8866dd33,, 00xx33cc88eeaa0000aa,, 00xx338844ffbbddbbdd,,
           00xx44cc1111ddbb7700,, 00xx4488dd00cc66cc77,, 00xx44559933ee0011ee,, 00xx44115522ffddaa99,, 00xx55ff1155aaddaacc,,
           00xx55bbdd44bb0011bb,, 00xx556699779966cc22,, 00xx5522556688bb7755,, 00xx66aa11993366cc88,, 00xx66eedd8822bb77ff,,
           00xx663399bb00ddaa66,, 00xx667755aa11001111,, 00xx779911dd44001144,, 00xx77ddddcc55ddaa33,, 00xx770099ff77bb77aa,,
           00xx774455ee6666ccdd,, 00xx99882233bb66ee00,, 00xx99ccee22aabb5577,, 00xx9911aa1188dd88ee,, 00xx9955660099003399,,
           00xx88bb2277cc0033cc,, 00xx88ffee66dddd88bb,, 00xx8822aa55ffbb5522,, 00xx88666644ee66ee55,, 00xxbbee22bb55bb5588,,
           00xxbbaaeeaa4466eeff,, 00xxbb77aa9966003366,, 00xxbb33668877dd8811,, 00xxaadd22ff22dd8844,, 00xxaa99eeee33003333,,
           00xxaa44aadd1166eeaa,, 00xxaa0066cc00bb55dd,, 00xxdd44332266dd9900,, 00xxdd00ff3377002277,, 00xxddddbb005566ffee,,
           00xxdd99771144bb4499,, 00xxcc77336611bb44cc,, 00xxcc33ff770066ffbb,, 00xxcceebb4422002222,, 00xxccaa775533dd9955,,
           00xxff2233aa88002288,, 00xxff66ffbb99dd99ff,, 00xxffbbbb88bbbb4466,, 00xxffff7799aa66ff11,, 00xxee1133eeff66ff44,,
           00xxee55ffffeebb4433,, 00xxee88bbccccdd99aa,, 00xxeecc77dddd0022dd,, 00xx3344886677007777,, 00xx3300447766ddcc00,,
           00xx33dd004444bb1199,, 00xx3399cc555566aaee,, 00xx227788220066aabb,, 00xx2233443311bb11cc,, 00xx22ee000033ddcc55,,
           00xx22aacc1122007722,, 00xx112288ee99ddccff,, 00xx116644ff88007788,, 00xx11bb00ccaa66aa11,, 00xx11ffccddbbbb1166,,
           00xx001188aaeebb1133,, 00xx005544bbff66aa44,, 00xx00880088dd0077dd,, 00xx00cccc99ccddccaa,, 00xx77889977aabb0077,,
           00xx77cc5566bb66bb00,, 00xx7711115599006699,, 00xx7755dd4488ddddee,, 00xx66bb9933ddddddbb,, 00xx66ff5522cc0066cc,,
           00xx66221111ee66bb55,, 00xx6666dd00ffbb0022,, 00xx55ee99ff4466bbff,, 00xx55aa55ee55bb0088,, 00xx557711dd77dddd11,,
           00xx5533ddcc66006666,, 00xx44dd99bb33006633,, 00xx449955aa22dddd44,, 00xx4444119900bb00dd,, 00xx4400dd881166bbaa,,
           00xxaaccaa55cc669977,, 00xxaa886644ddbb2200,, 00xxaa552277ffddff99,, 00xxaa11ee66ee0044ee,, 00xxbbffaa11bb0044bb,,
           00xxbbbb6600aaddffcc,, 00xxbb66223388bb2255,, 00xxbb22ee2299669922,, 00xx88aaaadd22bb22ff,, 00xx88ee66cc33669988,,
           00xx883322ff11004411,, 00xx8877eeee00ddff66,, 00xx9999aa9955ddff33,, 00xx99dd668844004444,, 00xx990022bb666699dd,,
           00xx9944eeaa77bb22aa,, 00xxee00bb4411ddee77,, 00xxee44775500005500,, 00xxee99336622668899,, 00xxeeddff7733bb33ee,,
           00xxff33bb0066bb33bb,, 00xxff777711776688cc,, 00xxffaa332255005555,, 00xxffeeff3344ddee22,, 00xxcc66bbccff0055ff,,
           00xxcc2277ddeeddee88,, 00xxccff33eeccbb3311,, 00xxccbbffffdd668866,, 00xxdd55bb8888668833,, 00xxdd11779999bb3344,,
           00xxddcc33aabbddeedd,, 00xxdd88ffbbaa0055aa,, 00xx669900ccee00eeee,, 00xx66ddccddffdd5599,, 00xx660088eeddbb8800,,
           00xx664444ffcc663377,, 00xx77aa008899663322,, 00xx77eecc9988bb8855,, 00xx773388aaaadd55cc,, 00xx777744bbbb00eebb,,
           00xx44ff004400dd5566,, 00xx44bbcc551100ee11,, 00xx4466886633663388,, 00xx4422447722bb88ff,, 00xx55cc000077bb88aa,,
           00xx5588cc11666633dd,, 00xx555588224400ee44,, 00xx5511443355dd5533,, 00xx225511dd33bb99ee,, 00xx2211ddcc22662299,,
           00xx22cc99ff0000ff00,, 00xx228855ee11dd4477,, 00xx3366119944dd4422,, 00xx3322dd885500ff55,, 00xx33ff99bb776622cc,,
           00xx33bb55aa66bb99bb,, 00xx00331155dd662266,, 00xx0077dd44ccbb9911,, 00xx00aa9977eedd4488,, 00xx00ee5566ff00ffff,,
           00xx11001111aa00ffaa,, 00xx1144dd00bbdd44dd,, 00xx1199993399bb9944,, 00xx11dd552288662233,, 00xxff1122ff556600ee,,
           00xxff55eeee44bbbb99,, 00xxff88aadd66dd6600,, 00xxffcc66cc7700dd77,, 00xxee2222bb2200dd22,, 00xxee66eeaa33dd6655,,
           00xxeebbaa9911bbbbcc,, 00xxeeff6688006600bb,, 00xxdd772277bbbbbb66,, 00xxdd33ee66aa660011,, 00xxddeeaa558800dd88,,
           00xxddaa664499dd66ff,, 00xxcc442233ccdd66aa,, 00xxcc00ee22dd00dddd,, 00xxccddaa11ff660044,, 00xxcc996600eebbbb33,,
           00xxbbdd33ee88dd77ee,, 00xxbb99ffff9900cc99,, 00xxbb44bbccbb661100,, 00xxbb0077ddaabbaa77,, 00xxaaee33aaffbbaa22,,
           00xxaaaaffbbee661155,, 00xxaa77bb88cc00cccc,, 00xxaa337799dddd77bb,, 00xx99bb33666600cc66,, 00xx99ffff7777dd7711,,
           00xx9922bb4455bbaa88,, 00xx99667755446611ff,, 00xx88883322116611aa,, 00xx88ccff3300bbaadd,, 00xx8811bb0022dd7744,,
           00xx885577113300cc33,, 00xx55dd88aa99009999,, 00xx559944bb88dd22ee,, 00xx55440088aabbff77,, 00xx5500cc99bb664400,,
           00xx44ee88eeee664455,, 00xx44aa44ffffbbff22,, 00xx447700ccdddd22bb,, 00xx4433ccddcc0099cc,, 00xx77bb882277dd2211,,
           00xx77ff443366009966,, 00xx77220000446644ff,, 00xx7766cc1155bbff88,, 00xx6688886600bbffdd,, 00xx66cc4477116644aa,,
           00xx6611004433009933,, 00xx6655cc5522dd2244,, 00xx111199bb44bbee99,, 00xx115555aa556655ee,, 00xx1188119977008877,,
           00xx11ccdd8866dd3300,, 00xx002299ff33dd3355,, 00xx006655ee22008822,, 00xx00bb11dd006655bb,, 00xx00ffddcc11bbeecc,,
           00xx33779933aa665511,, 00xx33335522bbbbee66,, 00xx33ee111199dd33ff,, 00xx33aadd0088008888,, 00xx22449977dd0088dd,,
           00xx22005566ccdd33aa,, 00xx22dd1155eebbee33,, 00xx2299dd44ff665544,, 00xxcc55aa9922667799,, 00xxcc11668833bbccee,,
           00xxcccc22bb11dd1177,, 00xxcc88eeaa0000aa00,, 00xxdd66aadd5500aa55,, 00xxdd2266cc44dd1122,, 00xxddff22ff66bbccbb,,
           00xxddbbeeee776677cc,, 00xxee33aa11ccbbcc11,, 00xxee776600dd667766,, 00xxeeaa2233ff00aaff,, 00xxeeeeee22eedd1188,,
           00xxff00aa55bbdd11dd,, 00xxff446644aa00aaaa,, 00xxff99227788667733,, 00xxffddee6699bbcc44,, 00xx8899bb88ffdd0099,,
           00xx88dd7799ee00bbee,, 00xx880033aacc666677,, 00xx8844ffbbddbbdd00,, 00xx99aabbcc88bbdd55,, 00xx99ee77dd99666622,,
           00xx993333eebb00bbbb,, 00xx9977ffffaadd00cc,, 00xxaaffbb001100bb11,, 00xxaabb771100dd0066,, 00xxaa66332222bbddff,,
           00xxaa22ff3333666688,, 00xxbbccbb44666666dd,, 00xxbb88775577bbddaa,, 00xxbb55336655dd0033,, 00xxbb11ff774400bb44
           }};;

           unsigned long memcrc(const unsigned char *b, size_t n)
           {
           /*  Input arguments:
            *  const unsigned char*   b == byte sequence to checksum
            *  size_t                 n == length of sequence
            */

               register size_t i;
               register unsigned c, s = 0;

               for (i = n; i > 0; −−i) {
                   c = *b++;
                   s = (s << 8) ^ crctab[(s >> 24) ^ c];
               }

               /* Extend with the length of the string. */
               while (n != 0) {
                   c = n & 0377;
                   n >>= 8;
                   s = (s << 8) ^ crctab[(s >> 24) ^ c];
               }

               return ~s;
           }

       The historical practice of writing the number of ``blocks'' has been
       changed to writing the number of octets, since the latter is not only
       more useful, but also since historical implementations have not been
       consistent in defining what a ``block'' meant.

       The algorithm used was selected to increase the operational robustness
       of _c_k_s_u_m.  Neither the System V nor BSD _s_u_m algorithm was selected.
       Since each of these was different and each was the default behavior on
       those systems, no realistic compromise was available if either were
       selected—some set of historical applications would break. Therefore,
       the name was changed to _c_k_s_u_m.  Although the historical _s_u_m commands
       will probably continue to be provided for many years, programs designed
       for portability across systems should use the new name.

       The algorithm selected is based on that used by the ISO/IEC 8802‐3:1996
       standard (Ethernet) for the frame check sequence field. The algorithm
       used does not match the technical definition of a _c_h_e_c_k_s_u_m; the term is
       used for historical reasons. The length of the file is included in the
       CRC calculation because this parallels inclusion of a length field by
       Ethernet in its CRC, but also because it guards against inadvertent
       collisions between files that begin with different series of zero
       octets. The chance that two different files produce identical CRCs is
       much greater when their lengths are not considered. Keeping the length
       and the checksum of the file itself separate would yield a slightly
       more robust algorithm, but historical usage has always been that a
       single number (the checksum as printed) represents the signature of the
       file. It was decided that historical usage was the more important
       consideration.

       Early proposals contained modifications to the Ethernet algorithm that
       involved extracting table values whenever an intermediate result became
       zero. This was demonstrated to be less robust than the current method
       and mathematically difficult to describe or justify.

       The calculation used is identical to that given in pseudo-code in the
       referenced Sarwate article. The pseudo-code rendition is:


           XX <<−− 00;; YY <<−− 00;;
           ffoorr ii <<−− mm −−11 sstteepp −−11 uunnttiill 00 ddoo
               bbeeggiinn
               TT <<−− XX((11)) ^^ AA[[ii]];;
               XX((11)) <<−− XX((00));; XX((00)) <<−− YY((11));; YY((11)) <<−− YY((00));; YY((00)) <<−− 00;;
               ccoommmmeenntt:: ff[[TT]] aanndd ff''[[TT]] ddeennoottee tthhee TT--tthh wwoorrddss iinn tthhee
                   ttaabbllee ff aanndd ff'' ;;
               XX <<−− XX ^^ ff[[TT]];; YY <<−− YY ^^ ff''[[TT]];;
               eenndd

       The pseudo-code is reproduced exactly as given; however, note that in
       the case of _c_k_s_u_m, AA[[ii]] represents a byte of the file, the words XX and
       YY are treated as a single 32-bit value, and the tables ff and ff'' are a
       single table containing 32-bit values.

       The referenced Sarwate article also discusses generating the table.

FFUUTTUURREE DDIIRREECCTTIIOONNSS
       None.

SSEEEE AALLSSOO
       The Base Definitions volume of POSIX.1‐2008, _C_h_a_p_t_e_r _8, _E_n_v_i_r_o_n_m_e_n_t
       _V_a_r_i_a_b_l_e_s

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



IEEE/The Open Group                  2013                            CKSUM(1P)
