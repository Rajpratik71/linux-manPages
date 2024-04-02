PERLTEX(1)                                                                                                                                                                     PERLTEX(1)

NAME
       perltex - enable LaTeX macros to be defined in terms of Perl code

SYNOPSIS
       perltex [--help] [--latex=program] [--[no]safe] [--permit=feature] [--makesty] [latex options]

DESCRIPTION
       LaTeX -- through the underlying TeX typesetting system -- produces beautifully typeset documents but has a macro language that is difficult to program.  In particular, support
       for complex string manipulation is largely lacking.  Perl is a popular general-purpose programming language whose forte is string manipulation.  However, it has no typesetting
       capabilities whatsoever.

       Clearly, Perl's programmability could complement LaTeX's typesetting strengths.  perltex is the tool that enables a symbiosis between the two systems.  All a user needs to do is
       compile a LaTeX document using perltex instead of latex.  (perltex is actually a wrapper for latex, so no latex functionality is lost.)  If the document includes a
       "\usepackage{perltex}" in its preamble, then "\perlnewcommand" and "\perlrenewcommand" macros will be made available.  These behave just like LaTeX's "\newcommand" and
       "\renewcommand" except that the macro body contains Perl code instead of LaTeX code.

OPTIONS
       perltex accepts the following command-line options:

       --help
           Display basic usage information.

       --latex=program
           Specify a program to use instead of latex.  For example, "--latex=pdflatex" would typeset the given document using pdflatex instead of ordinary latex.

       --[no]safe
           Enable or disable sandboxing.  With the default of --safe, perltex executes the code from a "\perlnewcommand" or "\perlrenewcommand" macro within a protected environment that
           prohibits ``unsafe'' operations such as accessing files or executing external programs.  Specifying --nosafe gives the LaTeX document carte blanche to execute any arbitrary
           Perl code, including that which can harm the user's files.  See Safe for more information.

       --permit=feature
           Permit particular Perl operations to be performed.  The --permit option, which can be specified more than once on the command line, enables finer-grained control over the
           perltex sandbox.  See Opcode for more information.

       --makesty
           Generate a LaTeX style file called noperltex.sty.  Replacing the document's "\usepackage{perltex}" line with "\usepackage{noperltex}" produces the same output but does not
           require PerlTeX, making the document suitable for distribution to people who do not have PerlTeX installed.  The disadvantage is that noperltex.sty is specific to the
           document that produced it.  Any changes to the document's PerlTeX macro definitions or macro invocations necessitates rerunning perltex with the --makesty option.

       These options are then followed by whatever options are normally passed to latex (or whatever program was specified with "--latex"), including, for instance, the name of the .tex
       file to compile.

EXAMPLES
       In its simplest form, perltex is run just like latex:

           perltex myfile.tex

       To use pdflatex instead of regular latex, use the --latex option:

           perltex --latex=pdflatex myfile.tex

       If LaTeX gives a ``"trapped by operation mask"'' error and you trust the .tex file you're trying to compile not to execute malicious Perl code (e.g., because you wrote it
       yourself), you can disable perltex's safety mechansisms with --nosafe:

           perltex --nosafe myfile.tex

       The following command gives documents only perltex's default permissions (":browse") plus the ability to open files and invoke the "time" command:

           perltex --permit=:browse --permit=:filesys_open
             --permit=time myfile.tex

ENVIRONMENT
       perltex honors the following environment variables:

       PERLTEX
           Specify the filename of the LaTeX compiler.  The LaTeX compiler defaults to ``"latex"''.  The "PERLTEX" environment variable overrides this default, and the --latex command-
           line option (see "OPTIONS") overrides that.

FILES
       While compiling jobname.tex, perltex makes use of the following files:

       jobname.lgpl
           log file written by Perl; helpful for debugging Perl macros

       jobname.topl
           information sent from LaTeX to Perl

       jobname.frpl
           information sent from Perl to LaTeX

       jobname.tfpl
           ``flag'' file whose existence indicates that jobname.topl contains valid data

       jobname.ffpl
           ``flag'' file whose existence indicates that jobname.frpl contains valid data

       jobname.dfpl
           ``flag'' file whose existence indicates that jobname.ffpl has been deleted

       noperltex-#.tex
           file generated by noperltex.sty for each PerlTeX macro invocation

NOTES
       perltex's sandbox defaults to what Opcode calls ``":browse"''.

SEE ALSO
       latex(1), pdflatex(1), perl(1), Safe(3pm), Opcode(3pm)

AUTHOR
       Scott Pakin, scott+pt@pakin.org

v2.1                                                                                    2010-07-10                                                                             PERLTEX(1)
