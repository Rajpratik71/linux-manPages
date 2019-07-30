BUNDLEDOC(1)                                                                          User Commands                                                                          BUNDLEDOC(1)

NAME
       bundledoc - bundle all the files needed by a LaTeX document

SYNOPSIS
       bundledoc [--version] [--help] [--[no]verbose] [--texfile=file] [--directory=directory] [--[no]localonly] [--exclude=string] [--include=filespec] [--manifest=file]
       [--listdeps=[yes|no|only|rel]...]  [--[no]keepdirs] [--config=file] .dep file

DESCRIPTION
       bundledoc is a post-processor for the snapshot package that bundles together all the classes, packages, and files needed to build a given LaTeX document.  It reads the .dep file
       that snapshot produces, finds each of the files mentioned therein, and packages them into a single archive file (e.g., a .tar.gz file), suitable for moving across systems,
       transmitting to a colleague, etc.

       As the simplest example possible, consider a LaTeX file called, say, hello.tex:

           \RequirePackage{snapshot}       % Needed by bundledoc
           \documentclass[11pt]{article}

           \begin{document}
           Hello, world!
           \end{document}

       The "\RequirePackage{snapshot}" causes a hello.dep file to be produced.  When bundledoc is then given "hello.dep" as an argument, it locates the dependent files -- snapshot.sty,
       article.cls, and size11.clo -- and bundles them into a single archive file, along with hello.tex and a MANIFEST file (described in "OPTIONS", below).

OPTIONS
       In the following descriptions, somefile refers to the name of your main LaTeX document (no extension).

       bundledoc requires the name of the dependency file produced by snapshot (normally somefile.dep).  The following options may also be given:

       --version
           Output the bundledoc script's version number.  This overrides all of the remaining options.

       --help
           Give a brief usage message.  This overrides all of the remaining options.

       --[no]verbose                    (default: "noverbose")
           bundledoc normally does not output anything except error messages.  With "--verbose", it outputs copious status messages.

       --texfile=main .tex file            (default: somefile.tex)
           snapshot's dependency file does not list the main LaTeX file (the one that gets passed to latex).  In order for bundledoc to find and bundle that file, bundledoc assumes it
           has the same name as the snapshot dependency file but with a .tex extension.  If this is not the case, then use "--texfile" to specify the correct filename.

       --directory=archive directory       (default: somefile)
           When bundledoc creates an archive (e.g., a .tar or .zip file) containing the document's files, it puts all of them in a directory to avoid cluttering the current directory
           with files.  If the given dependency file is called somefile.dep then the resulting archive will, by default, store all the dependent files in a somefile directory.  To
           change the directory name use the "--directory" option.

       --[no]localonly                  (default: "nolocalonly")
           Although bundledoc normally archives all of the files named in the .dep file, the "--localonly" option tells bundledoc to exclude all files located in a directory other than
           the .tex file's directory or one of its subdirectories.

       --exclude=string                    (default: none)
           While "--localonly" causes files outside of the .tex file's directory tree to be omitted from the archive, "--exclude" provides finer-grained control over files to omit from
           the archive.  The "--exclude" option, which can be specified repeatedly on the command line, causes all files whose name contains string to be omitted from the archive.

       --include=filespec                  (default: none)
           The "--include" option, which can be specified repeatedly on the command line, instructs bundledoc to include in the archive all of the files matching filespec, even if
           they're not referenced in the .dep file.

       --manifest=manifest file            (default: MANIFEST)
           In addition to the dependent files, bundledoc includes in the archive file one extra file called, by default, ``MANIFEST''.  MANIFEST is a text file that lists the original
           filenames of all the dependencies.  To change the filename from ``MANIFEST'' to something else, use the "--manifest" option.  As a special case, "--manifest=""" tells
           bundledoc not to include a manifest file at all.

       --listdeps=[yes|no|only|rel]...]       (default: "no")
           "--listdeps" accepts one or more of "yes", "no", "only", or "rel" as a comma-separated list.  As long as "no" does not appear in this list, bundledoc outputs all of the main
           LaTeX file's dependencies.  If the list contains "rel", then bundledoc outputs the list of dependencies with relative pathnames.  If the list contains "only", then bundledoc
           exits after displaying the list, without producing an archive.

       --[no]keepdirs                   (default: "nokeepdirs")
           Normally, the archive file that bundledoc produces contains a single directory -- and subdirectories, if the document refers explicitly to them -- in which all the dependent
           files lie.  If "--keepdirs" is specified, all the dependent files are stored with their original pathnames.  For example, if somefile.tex depends on figures/somefigure.eps,
           article.cls, and snapshot.sty, then the somefile archive will normally contain the following files:

           ·   somefile/somefile.tex

           ·   somefile/figures/somefigure.eps

           ·   somefile/article.cls

           ·   somefile/snapshot.sty

           ·   somefile/MANIFEST

           However, "--keepdirs" will cause the somefile archive to contain the following sorts of filenames instead:

           ·   home/me/mydocs/somefile.tex

           ·   home/me/mydocs/figures/somefigure.eps

           ·   usr/share/texmf/tex/latex/base/article.cls

           ·   usr/share/texmf/tex/latex/snapshot/snapshot.sty

           "--directory" is not used when "--keepdirs" is in effect.  In addition, no manifest file is written to the archive file as it contains redundant information.

       --config=configuration file         (default: <none>)
           The "--config" option is used to point bundledoc to the appropriate configuration (.cfg) file for your TeX distribution and operating system.  bundledoc comes with a few
           configuration files and it's easy to write more.  See "CONFIGURATION FILES" (below) for a description of the configuration file format.

CONFIGURATION FILES
   Format
       Configuration files follow a fairly simple format.  Lines beginning with "#" are comments.  Blank lines are ignored.  All other lines are of the form:

           variable: value

       The current version of bundledoc recognizes the following variables:

       bundle
           The command to use to bundle a set of files into a single archive file

       sink
           The affix to a command to discard its output

       find
           The command to find a file within the TeX tree(s).

       Values that are too long for one line can be split across multiple lines by using "\" as the line-continuation symbol.

       There are two environment variables that bundledoc makes available for use by configuration-file commands: "BDBASE", which is set to somefile (as in "OPTIONS"), and "BDINPUTS",
       which is set to a space-separated list of files that a command is to operate upon.  That is, when the command associated with "bundle" is running, "BDINPUTS" contains the list of
       all the files that are to be archived.  In contrast, when the command associated with "find" is running, "BDINPUTS" contains the name of the file to search for.

   Examples
       The following configuration file parallels bundledoc's default values of the various configuration-file variables, which represents a kpathsea-based TeX distribution running on a
       generic Unix system, which doesn't necessarily have any of the GNU tools, such as gzip or GNU tar:

           # "Default" configuration file
           # By Scott Pakin <scott+bdoc@pakin.org>

           bundle: (tar -cvf - $BDINPUTS | compress > $BDBASE.tar.Z)
           sink:   > /dev/null 2>&1
           find:   kpsewhich -progname=latex $BDINPUTS

       The parentheses in the "bundle:" line tell the Unix shell to run the command in a subshell.  This is to make the "sink:" affix work properly (i.e., so there aren't two ">"'s in
       the same command).

       Notice how the commands treat "BDBASE" and "BDINPUTS" like any other environment variables in a Unix shell, using "$" to take their value.  Other operating systems use different
       conventions for referring to environment variables.  For instance, a configuration file for a Windows-based TeX distribution would use "%BDBASE%" and "%BDINPUTS%" instead.

       The value for "sink:" is specific to an operating system.  The value for "find:" is specific to a TeX distribution.  "bundle:" is where the most opportunity for customization
       lies.  You can use "bundle:" to specify your favorite archive format.  For example, you can produce a shar file on Unix with something like:

           bundle: (shar --archive-name="$BDBASE" $BDINPUTS > $BDBASE.sh)

       or a CAB file on Microsoft Windows with something like:

           bundle: cabarc -r -p N %BDBASE%.cab %BDINPUTS%

EXAMPLES
       Assume that myfile.dep was produced from myfile.tex by following the instructions in the Description section.  The following command produces a .zip file with the MikTeX TeX
       distribution running on Microsoft Windows:

           bundledoc --config=miktex.cfg myfile.dep

       (In practice, it's probably necessary to specify to "--config" the complete path to bundledoc's miktex.cfg configuration file.)

       The following builds a .tar.gz archive with the TeX Live distribution running on a Unix-like operating system.  bundledoc will produce verbose output describing its operations.
       All files not in the same directory tree as myfile.tex and all files containing ".fd" or ".sty" in their names are omitted.  However, all .bib files in the current directory will
       be included in the archive even though none of them are referenced by myfile.dep.  Finally, no MANIFEST file will be produced.

           bundledoc --config=texlive-unix.cfg --verbose --localonly \
             --exclude=.fd --exclude=.cfg --include="*.bib" --manifest="" \
             myfile.dep

FILES
       The user must have previously installed snapshot.sty and used it to produce a dependency file for his document.  Besides that, the set of external files needed by bundledoc is
       system-specific and depends on the configuration file used.  (See "CONFIGURATION FILES", above.)

       bundledoc currently comes with two configuration files:

       texlive-unix.cfg
           Configuration file for TeX Live installations on Unix or Linux.  TeX Live is a kpathsea-based TeX distribution that runs on various flavors of Unix and Microsoft Windows.
           texlive-unix.cfg assumes you have gzip and uses it to produce a .tar.gz archive file.  The configuration file has bundledoc use kpsewhich to find LaTeX files.

       miktex.cfg
           Configuration file for MikTeX installations.  MikTeX is a popular TeX distribution for Microsoft Windows.  miktex.cfg assumes you have zip and uses it to produce a .zip
           archive file.  The configuration file now has bundledoc use kpsewhich to find LaTeX files; older version of MikTeX required the rather nonstandard initexmf for this purpose.

       texlive-unix-arlatex.cfg
           This is a variant of texlive-unix.cfg that uses arlatex instead of gzip to archive files.  arlatex is a script included in the bundledoc distribution that generates a self-
           extracting .tex file based on LaTeX's "filecontents" environment.

NOTES
   Including and excluding files
       The "--localonly", "--exclude", and "--include" options provide control over the archive's contents.  "--exclude" and "--include" can be specified repeatedly on the command line.
       The order in which these options are specified is immaterial; bundledoc processes file inclusions and exclusions in the following order:

       1.  All files referenced by the .dep file are added to the list of files to archive.

       2.  If "--localonly" is specified, all files not found in the .tex file's directory are removed from the list.

       3.  For each "--exclude" string specified, all files containing that string are removed from the list.

       4.  For each "--include" file specification, the set of files designated by its expansion are added to the list.

   Issues When Running Under Microsoft Windows
       First, because bundledoc is a Perl script, you should do one of the following to run it under Windows:

       ·   "perl bundledoc"

       ·   Rename bundledoc to bundledoc.pl and run "bundledoc.pl".  (This is assuming you have a file association set up for .pl.)

       ·   Run the pl2bat script (if you have it) to convert bundledoc to bundledoc.bat, then run "bundledoc".

       Second, Windows uses a multi-rooted filesystem (i.e., multiple drive letters).  I wouldn't be surprised if bad things were to happen if the files to be bundled are scattered
       across drives.  In addition, Windows supports ``UNC'' filenames, which have no drive letter at all, just a machine and share name.  UNC filenames are also untested waters for
       bundledoc.  Be careful!

   Testing Status
       I have tested bundledoc only with Perl v5.6.0 and later and only on the following platforms:

       ·   Linux + TeX Live

       ·   Linux + teTeX

       ·   Windows NT + MiKTeX

       ·   Solaris + ??? (something kpathsea-based)

       It is my hope that bundledoc works on many more platforms than those.  I tried to make the program itself fairly independent of the operating system; only the configuration files
       should have to change to run bundledoc on a different system.

   Future Work
       I'd like bundledoc to work on as wide a variety of TeX distributions as possible.  If your platform is significantly different from the ones listed in "Testing Status" (e.g., if
       you're running OS X) and you need to create a substantially different configuration file from texlive-unix.cfg and miktex.cfg, please send it to me at the address listed in
       "AUTHOR" so I can include it in a future version of bundledoc.  (I make no promises, though).

       Once bundledoc works on all the major operating systems and TeX distributions it would be really convenient if I could get bundledoc to detect the platform it's running on and
       automatically select an appropriate configuration file.

       Finally, it would be handy for bundledoc to include fonts in the archive file.  At a minimum, it should include .tfm files, but it would be even better if it included .mf, .pfb,
       .ttf, and other common font formats, as well.

   Acknowledgments
       Thanks to Fabien Vignes-Tourneret for suggesting what became the "--localonly" option and for a discussion that led to the "--exclude" and "--include" options; and to Marius
       Kleiner for updating bundledoc to properly handle document subdirectories.

SEE ALSO
       arlatex(1), gzip(1), kpsewhich(1), latex(1), perl(1), zip(1), the snapshot documentation

AUTHOR
       Scott Pakin, scott+bdoc@pakin.org

v3.3                                                                                    2018-05-23                                                                           BUNDLEDOC(1)
