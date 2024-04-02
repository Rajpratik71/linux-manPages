OPANNOTATE(1)                                                                              General Commands Manual                                                                              OPANNOTATE(1)



NAME
       opannotate - produce source or assembly annotated with profile data

SYNOPSIS
       opannotate [ options ] [profile specification]

DESCRIPTION
       opannotate outputs annotated source and/or assembly from profile data of an OProfile session. See oprofile(1) for how to write profile specifications.


OPTIONS
       --assembly / -a
              Output annotated assembly. The binary file to be annotated does not need full debugging information to use this option, but symbol information is required. Without symbol information, opanno‐
              tate will silently refuse to annotate the binary.  If this option is combined with --source, then mixed source / assembly annotations are output.

       --demangle / -D none|smart|normal
              none: no demangling. normal: use default demangler (default) smart: use pattern-matching to make C++ symbol demangling more readable.

       --exclude-dependent / -x
              Do not include application-specific images for libraries, kernel modules and the kernel. This option only makes sense if the profile session used --separate.

       --exclude-file [files]
              Exclude all files in the given comma-separated list of glob patterns.

       --exclude-symbols / -e [symbols]
              Exclude all the symbols in the given comma-separated list.

       --help / -? / --usage
              Show help message.

       --image-path / -p [paths]
              Comma-separated list of additional paths to search for binaries.  This is needed to find modules in kernels 2.6 and upwards.

       --root / -R [path]
              A path to a filesystem to search for additional binaries.

       --include-file [files]
              Only include files in the given comma-separated list of glob patterns.

       --merge / -m [lib,cpu,tid,tgid,unitmask,all]
              Merge any profiles separated in a --separate session.

       --include-symbols / -i [symbols]
              Only include symbols in the given comma-separated list.

       --objdump-params [params]
              Pass the given parameters as extra values when calling objdump.  If more than one option is to be passed to objdump, the parameters must be enclosed in a quoted string.

              An example of where this option is useful is when your toolchain does not automatically recognize instructions that are specific to your processor.  For example, on IBM POWER7/RHEL 6, objdump
              must be told that a binary file may have POWER7-specific instructions. The opannotate option to show the POWER7-specific instructions is:
                 --objdump-params=-Mpower7

              The opannotate option to show the POWER7-specific instructions, the source code (--source) and the line numbers (-l) would be:
                 --objdump-params="-Mpower7 -l --source"


       --output-dir / -o [dir]
              Output directory. This makes opannotate output one annotated file for each source file. This option can't be used in conjunction with --assembly.

       --search-dirs / -d [paths]
              Comma-separated list of paths to search for source files. You may need to use this option when the debug information for an image contains relative paths.

       --base-dirs / -b [paths]
              Comma-separated list of paths to strip from debug source files, prior to looking for them in --search-dirs.

       --session-dir=dir_path
              Use  sample  database from the specified directory dir_path instead of the default locations. If --session-dir is not specified, then opannotate will search for samples in <current_dir>/opro‐
              file_data first. If that directory does not exist, the standard session-dir of /var/lib/oprofile is used.

       --source / -s
              Output annotated source. This requires debugging information to be available for the binaries.

       --threshold / -t [percentage]
              Only output data for symbols that have more than the given percentage of total samples.

       --verbose / -V [options]
              Give verbose debugging output.

       --version / -v
              Show version.


ENVIRONMENT
       No special environment variables are recognised by opannotate.


FILES
       <current_dir>/oprofile_data/samples
              Or
       /var/lib/oprofile/samples/

              The location of the generated sample files.


VERSION
       This man page is current for oprofile-0.9.9.


SEE ALSO
       /usr/share/doc/oprofile/, oprofile(1)



4th Berkeley Distribution                                                                    Fri 02 November 2018                                                                               OPANNOTATE(1)
