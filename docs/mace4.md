MACE4(1)                                                      General Commands Manual                                                     MACE4(1)

NAME
       mace4 - searches for finite countermodels of first-order statements

SYNOPSIS
       mace4 [options] < input-file > output-file

DESCRIPTION
       This manual page documents briefly the mace4 command.

       The  program  mace4  searches  for  finite  structures  satisfying  first-order  and equational statements, the same kind of statement that
       prover9(1) accepts. If the statement is the denial of some conjecture, any structures found by mace4 are counterexamples to the conjecture.
       mace4  can  be  a valuable complement to prover9(1), looking for counterexamples before (or at the same time as) using prover9(1) to search
       for a proof. It can also be used to help debug input clauses and formulas for prover9(1).

OPTIONS
       A summary of options is included below.  Options override the equivalent settings given in the input file.  To set or  clear  a  flag,  you
       must give 1 or 0 as the value.

       -help  This tells mace4 to print a summary of these command-line options.

       -n n   This gives the starting domain size for the search. The default value is 2. If you also give an -N option, mace4 will iterate domain
              sizes up through the -N value, using an increment given by the -I value. Otherwise, mace4 will search only for the -n value.

       -N n   This gives the ending domain size for the search. The default is 10.

       -i n   This gives the domain size increment for the search. The default is 1.

       -q n   This flag overrides the parameter iterate. It says to try the sizes that are prime numbers, from -n up through -N.

       -m n   Stop searching when the nth structure has been found.  The default is 1.

       -t n   Stop searching after n seconds.

       -s n   Allow at most n seconds for each domain size. The parameter can be used (together with -t) to give an overall time limit.

       -b n   Stop searching when (about) n megabytes of memory have been used.

       -V n   A rule is needed for distinguishing variables from constants in clauses and formulas with free variables. If  this  flag  is  clear,
              variables start with (lower case) `u' through `z'. If this flag is set, variables in clauses start with (upper case) `A' through `Z'
              or `_'.

       -P n   If this flag is set, all structures that are found are printed in `standard' form, which means they are suitable as input  to  other
              LADR programs such as isofilter(1) and interpformat(1).

       -p n   If this flag is set, and if -P is clear, all structures that are found are printed in a tabular form.

       -R n   If  this  flag  is  set, a ring structure is is applied to the search. The operations {+,-,*} are assumed to be the ring of integers
              (mod domain_size). This method puts a tight constraint on the search, allowing much larger structures to be investigated.

       -v n   If this flag is set, the output file receives information about the search, including the initial partial model  (the  part  of  the
              model  that  can be determined before backtracking starts) and timing and other statistics for each domain size. (It does not give a
              trace of the backtracking, so it does not consume a lot of file space.)

       -T n   If the trace flag is set, detailed information about the search, including a trace of all assignments and backtracking,  is  printed
              to the standard output. This flag causes a lot of output, so it should be used only on small searches.

       There  also  exist  a number of advanced options, which are used for experimentation with search methods. They can be ignored by nearly all
       users. For descriptions of these options, see the original mace4 manual.

SEE ALSO
       prover9(1).
       Full  documentation  for  mace4  is  found  in  the  prover9  manual,  available  on  Debian  systems  in  the   prover9-doc   package   at
       /usr/share/doc/prover9-doc/manual/index.html.
       The original mace4 manual, which can be downloaded at http://www.cs.unm.edu/~mccune/prover9/mace4.pdf

AUTHOR
       mace4 was written by William McCune <mccune@cs.unm.edu>

       This manual page was written by Peter Collingbourne <peter@pcc.me.uk>, for the Debian project (but may be used by others).

                                                                  August 12, 2007                                                         MACE4(1)
