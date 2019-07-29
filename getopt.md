GETOPT(3)                  Linux Programmer's Manual                 GETOPT(3)



NNAAMMEE
       getopt, getopt_long, getopt_long_only, optarg, optind, opterr, optopt -
       Parse command-line options

SSYYNNOOPPSSIISS
       ##iinncclluuddee <<uunniissttdd..hh>>

       iinntt ggeettoopptt((iinntt _a_r_g_c,, cchhaarr ** ccoonnsstt _a_r_g_v_[_],,
                  ccoonnsstt cchhaarr **_o_p_t_s_t_r_i_n_g));;

       eexxtteerrnn cchhaarr **_o_p_t_a_r_g;;
       eexxtteerrnn iinntt _o_p_t_i_n_d,, _o_p_t_e_r_r,, _o_p_t_o_p_t;;

       ##iinncclluuddee <<ggeettoopptt..hh>>

       iinntt ggeettoopptt__lloonngg((iinntt _a_r_g_c,, cchhaarr ** ccoonnsstt _a_r_g_v_[_],,
                  ccoonnsstt cchhaarr **_o_p_t_s_t_r_i_n_g,,
                  ccoonnsstt ssttrruucctt ooppttiioonn **_l_o_n_g_o_p_t_s,, iinntt **_l_o_n_g_i_n_d_e_x));;

       iinntt ggeettoopptt__lloonngg__oonnllyy((iinntt _a_r_g_c,, cchhaarr ** ccoonnsstt _a_r_g_v_[_],,
                  ccoonnsstt cchhaarr **_o_p_t_s_t_r_i_n_g,,
                  ccoonnsstt ssttrruucctt ooppttiioonn **_l_o_n_g_o_p_t_s,, iinntt **_l_o_n_g_i_n_d_e_x));;

   Feature Test Macro Requirements for glibc (see ffeeaattuurree__tteesstt__mmaaccrrooss(7)):

       ggeettoopptt(): _POSIX_C_SOURCE >= 2 || _XOPEN_SOURCE
       ggeettoopptt__lloonngg(), ggeettoopptt__lloonngg__oonnllyy(): _GNU_SOURCE

DDEESSCCRRIIPPTTIIOONN
       The ggeettoopptt() function parses the command-line arguments.  Its arguments
       _a_r_g_c and _a_r_g_v are the argument count and array as passed to the _m_a_i_n()
       function on program invocation.  An element of _a_r_g_v that starts with
       '-' (and is not exactly "-" or "--") is an option element.  The
       characters of this element (aside from the initial '-') are option
       characters.  If ggeettoopptt() is called repeatedly, it returns successively
       each of the option characters from each of the option elements.

       The variable _o_p_t_i_n_d is the index of the next element to be processed in
       _a_r_g_v.  The system initializes this value to 1.  The caller can reset it
       to 1 to restart scanning of the same _a_r_g_v, or when scanning a new
       argument vector.

       If ggeettoopptt() finds another option character, it returns that character,
       updating the external variable _o_p_t_i_n_d and a static variable _n_e_x_t_c_h_a_r so
       that the next call to ggeettoopptt() can resume the scan with the following
       option character or _a_r_g_v-element.

       If there are no more option characters, ggeettoopptt() returns -1.  Then
       _o_p_t_i_n_d is the index in _a_r_g_v of the first _a_r_g_v-element that is not an
       option.

       _o_p_t_s_t_r_i_n_g is a string containing the legitimate option characters.  If
       such a character is followed by a colon, the option requires an
       argument, so ggeettoopptt() places a pointer to the following text in the
       same _a_r_g_v-element, or the text of the following _a_r_g_v-element, in
       _o_p_t_a_r_g.  Two colons mean an option takes an optional arg; if there is
       text in the current _a_r_g_v-element (i.e., in the same word as the option
       name itself, for example, "-oarg"), then it is returned in _o_p_t_a_r_g,
       otherwise _o_p_t_a_r_g is set to zero.  This is a GNU extension.  If
       _o_p_t_s_t_r_i_n_g contains WW followed by a semicolon, then --WW ffoooo is treated as
       the long option ----ffoooo.  (The --WW option is reserved by POSIX.2 for
       implementation extensions.)  This behavior is a GNU extension, not
       available with libraries before glibc 2.

       By default, ggeettoopptt() permutes the contents of _a_r_g_v as it scans, so that
       eventually all the nonoptions are at the end.  Two other modes are also
       implemented.  If the first character of _o_p_t_s_t_r_i_n_g is '+' or the
       environment variable PPOOSSIIXXLLYY__CCOORRRREECCTT is set, then option processing
       stops as soon as a nonoption argument is encountered.  If the first
       character of _o_p_t_s_t_r_i_n_g is '-', then each nonoption _a_r_g_v-element is
       handled as if it were the argument of an option with character code 1.
       (This is used by programs that were written to expect options and other
       _a_r_g_v-elements in any order and that care about the ordering of the
       two.)  The special argument "--" forces an end of option-scanning
       regardless of the scanning mode.

       While processing the option list, ggeettoopptt() can detect two kinds of
       errors: (1) an option character that was not specified in _o_p_t_s_t_r_i_n_g and
       (2) a missing option argument (i.e., an option at the end of the
       command line without an expected argument).  Such errors are handled
       and reported as follows:

       *  By default, ggeettoopptt() prints an error message on standard error,
          places the erroneous option character in _o_p_t_o_p_t, and returns '?' as
          the function result.

       *  If the caller has set the global variable _o_p_t_e_r_r to zero, then
          ggeettoopptt() does not print an error message.  The caller can determine
          that there was an error by testing whether the function return value
          is '?'.  (By default, _o_p_t_e_r_r has a nonzero value.)

       *  If the first character (following any optional '+' or '-' described
          above) of _o_p_t_s_t_r_i_n_g is a colon (':'), then ggeettoopptt() likewise does
          not print an error message.  In addition, it returns ':' instead of
          '?' to indicate a missing option argument.  This allows the caller
          to distinguish the two different types of errors.

   ggeettoopptt__lloonngg(()) aanndd ggeettoopptt__lloonngg__oonnllyy(())
       The ggeettoopptt__lloonngg() function works like ggeettoopptt() except that it also
       accepts long options, started with two dashes.  (If the program accepts
       only long options, then _o_p_t_s_t_r_i_n_g should be specified as an empty
       string (""), not NULL.)  Long option names may be abbreviated if the
       abbreviation is unique or is an exact match for some defined option.  A
       long option may take a parameter, of the form ----aarrgg==ppaarraamm or ----aarrgg
       ppaarraamm.

       _l_o_n_g_o_p_t_s is a pointer to the first element of an array of _s_t_r_u_c_t _o_p_t_i_o_n
       declared in _<_g_e_t_o_p_t_._h_> as

           struct option {
               const char *name;
               int         has_arg;
               int        *flag;
               int         val;
           };

       The meanings of the different fields are:

       _n_a_m_e   is the name of the long option.

       _h_a_s___a_r_g
              is: nnoo__aarrgguummeenntt (or 0) if the option does not take an argument;
              rreeqquuiirreedd__aarrgguummeenntt (or 1) if the option requires an argument; or
              ooppttiioonnaall__aarrgguummeenntt (or 2) if the option takes an optional
              argument.

       _f_l_a_g   specifies how results are returned for a long option.  If _f_l_a_g
              is NULL, then ggeettoopptt__lloonngg() returns _v_a_l.  (For example, the
              calling program may set _v_a_l to the equivalent short option
              character.)  Otherwise, ggeettoopptt__lloonngg() returns 0, and _f_l_a_g points
              to a variable which is set to _v_a_l if the option is found, but
              left unchanged if the option is not found.

       _v_a_l    is the value to return, or to load into the variable pointed to
              by _f_l_a_g.

       The last element of the array has to be filled with zeros.

       If _l_o_n_g_i_n_d_e_x is not NULL, it points to a variable which is set to the
       index of the long option relative to _l_o_n_g_o_p_t_s.

       ggeettoopptt__lloonngg__oonnllyy() is like ggeettoopptt__lloonngg(), but '-' as well as "--" can
       indicate a long option.  If an option that starts with '-' (not "--")
       doesn't match a long option, but does match a short option, it is
       parsed as a short option instead.

RREETTUURRNN VVAALLUUEE
       If an option was successfully found, then ggeettoopptt() returns the option
       character.  If all command-line options have been parsed, then ggeettoopptt()
       returns -1.  If ggeettoopptt() encounters an option character that was not in
       _o_p_t_s_t_r_i_n_g, then '?' is returned.  If ggeettoopptt() encounters an option with
       a missing argument, then the return value depends on the first
       character in _o_p_t_s_t_r_i_n_g: if it is ':', then ':' is returned; otherwise
       '?' is returned.

       ggeettoopptt__lloonngg() and ggeettoopptt__lloonngg__oonnllyy() also return the option character
       when a short option is recognized.  For a long option, they return _v_a_l
       if _f_l_a_g is NULL, and 0 otherwise.  Error and -1 returns are the same as
       for ggeettoopptt(), plus '?' for an ambiguous match or an extraneous
       parameter.

EENNVVIIRROONNMMEENNTT
       PPOOSSIIXXLLYY__CCOORRRREECCTT
              If this is set, then option processing stops as soon as a
              nonoption argument is encountered.

       __<<PPIIDD>>__GGNNUU__nnoonnooppttiioonn__aarrggvv__ffllaaggss__
              This variable was used by bbaasshh(1) 2.0 to communicate to glibc
              which arguments are the results of wildcard expansion and so
              should not be considered as options.  This behavior was removed
              in bbaasshh(1) version 2.01, but the support remains in glibc.

AATTTTRRIIBBUUTTEESS
       For an explanation of the terms used in this section, see
       aattttrriibbuutteess(7).

       +-------------------------+---------------+---------------------------+
       |IInntteerrffaaccee                | AAttttrriibbuuttee     | VVaalluuee                     |
       +-------------------------+---------------+---------------------------+
       |getopt (), getopt_long   | Thread safety | MT-Unsafe race:getopt env |
       |(), getopt_long_only ()  |               |                           |
       +-------------------------+---------------+---------------------------+
CCOONNFFOORRMMIINNGG TTOO
       ggeettoopptt():
              POSIX.1-2001, POSIX.1-2008, and POSIX.2, provided the
              environment variable PPOOSSIIXXLLYY__CCOORRRREECCTT is set.  Otherwise, the
              elements of _a_r_g_v aren't really _c_o_n_s_t, because we permute them.
              We pretend they're _c_o_n_s_t in the prototype to be compatible with
              other systems.

              The use of '+' and '-' in _o_p_t_s_t_r_i_n_g is a GNU extension.

              On some older implementations, ggeettoopptt() was declared in
              _<_s_t_d_i_o_._h_>.  SUSv1 permitted the declaration to appear in either
              _<_u_n_i_s_t_d_._h_> or _<_s_t_d_i_o_._h_>.  POSIX.1-1996 marked the use of
              _<_s_t_d_i_o_._h_> for this purpose as LEGACY.  POSIX.1-2001 does not
              require the declaration to appear in _<_s_t_d_i_o_._h_>.

       ggeettoopptt__lloonngg() and ggeettoopptt__lloonngg__oonnllyy():
              These functions are GNU extensions.

NNOOTTEESS
       A program that scans multiple argument vectors, or rescans the same
       vector more than once, and wants to make use of GNU extensions such as
       '+' and '-' at the start of _o_p_t_s_t_r_i_n_g, or changes the value of
       PPOOSSIIXXLLYY__CCOORRRREECCTT between scans, must reinitialize ggeettoopptt() by resetting
       _o_p_t_i_n_d to 0, rather than the traditional value of 1.  (Resetting to 0
       forces the invocation of an internal initialization routine that
       rechecks PPOOSSIIXXLLYY__CCOORRRREECCTT and checks for GNU extensions in _o_p_t_s_t_r_i_n_g.)

EEXXAAMMPPLLEE
   ggeettoopptt(())
       The following trivial example program uses ggeettoopptt() to handle two
       program options: _-_n, with no associated value; and _-_t _v_a_l, which
       expects an associated value.

       #include <unistd.h>
       #include <stdlib.h>
       #include <stdio.h>

       int
       main(int argc, char *argv[])
       {
           int flags, opt;
           int nsecs, tfnd;

           nsecs = 0;
           tfnd = 0;
           flags = 0;
           while ((opt = getopt(argc, argv, "nt:")) != -1) {
               switch (opt) {
               case 'n':
                   flags = 1;
                   break;
               case 't':
                   nsecs = atoi(optarg);
                   tfnd = 1;
                   break;
               default: /* '?' */
                   fprintf(stderr, "Usage: %s [-t nsecs] [-n] name\n",
                           argv[0]);
                   exit(EXIT_FAILURE);
               }
           }

           printf("flags=%d; tfnd=%d; nsecs=%d; optind=%d\n",
                   flags, tfnd, nsecs, optind);

           if (optind >= argc) {
               fprintf(stderr, "Expected argument after options\n");
               exit(EXIT_FAILURE);
           }

           printf("name argument = %s\n", argv[optind]);

           /* Other code omitted */

           exit(EXIT_SUCCESS);
       }

   ggeettoopptt__lloonngg(())
       The following example program illustrates the use of ggeettoopptt__lloonngg() with
       most of its features.

       #include <stdio.h>     /* for printf */ #include <stdlib.h>    /* for
       exit */ #include <getopt.h>

       int main(int argc, char **argv) {
           int c;
           int digit_optind = 0;

           while (1) {
               int this_option_optind = optind ? optind : 1;
               int option_index = 0;
               static struct option long_options[] = {
                   {"add",     required_argument, 0,  0 },
                   {"append",  no_argument,       0,  0 },
                   {"delete",  required_argument, 0,  0 },
                   {"verbose", no_argument,       0,  0 },
                   {"create",  required_argument, 0, 'c'},
                   {"file",    required_argument, 0,  0 },
                   {0,         0,                 0,  0 }
               };

               c = getopt_long(argc, argv, "abc:d:012",
                        long_options, &option_index);
               if (c == -1)
                   break;

               switch (c) {
               case 0:
                   printf("option %s", long_options[option_index].name);
                   if (optarg)
                       printf(" with arg %s", optarg);
                   printf("\n");
                   break;

               case '0':
               case '1':
               case '2':
                   if (digit_optind != 0 && digit_optind !=
       this_option_optind)
                     printf("digits occur in two different argv-elements.\n");
                   digit_optind = this_option_optind;
                   printf("option %c\n", c);
                   break;

               case 'a':
                   printf("option a\n");
                   break;

               case 'b':
                   printf("option b\n");
                   break;

               case 'c':
                   printf("option c with value '%s'\n", optarg);
                   break;

               case 'd':
                   printf("option d with value '%s'\n", optarg);
                   break;

               case '?':
                   break;

               default:
                   printf("?? getopt returned character code 0%o ??\n", c);
               }
           }

           if (optind < argc) {
               printf("non-option ARGV-elements: ");
               while (optind < argc)
                   printf("%s ", argv[optind++]);
               printf("\n");
           }

           exit(EXIT_SUCCESS); }

SSEEEE AALLSSOO
       ggeettoopptt(1), ggeettssuubboopptt(3)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



GNU                               2017-09-15                         GETOPT(3)
