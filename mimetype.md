MIMETYPE(1p)                      User Contributed Perl Documentation                     MIMETYPE(1p)

NAME
       mimetype - Determine file type

SYNOPSIS
       mimetype [options] [-] files

DESCRIPTION
       This script tries to determine the mime type of a file using the Shared MIME-info database. It
       is intended as a kind of file(1) work-alike, but uses mimetypes instead of descriptions.

       If one symlinks the file command to mimetype it will behave a little more compatible, see
       "--file-compat".  Commandline options to specify alternative magic files are not implemented
       the same because of the conflicting data formats.  Also the wording of the descriptions will
       differ.

       For naming switches I followed the manpage of file(1) version 4.02 when possible. They seem to
       differ completely from the spec in the 'utilities' chapter of IEEE Std 1003.1-2001 (POSIX).

OPTIONS
       -a, --all
           Show output of all rules that match the file.

           TODO: this method now just returns one match for each method (globs, magic, etc.).

       -b, --brief
           Do not prepend filenames to output lines (brief mode).

       --database=mimedir:mimedir:...
           Force the program to look in these directories for the shared mime-info database. The
           directories specified by the basedir specification are ignored.

       -d, --describe
           Print file descriptions instead of mime types, this is the default when using
           "--file-compat".

       -D, --debug
           Print debug information about how the mimetype was determined.

       -f namefile, --namefile=namefile
           Read the names of the files to be examined from the file 'namefile' (one per line) before
           the argument list.

       --file-compat
           Make mimetype behave a little more file(1) compatible. This is turned on automatically when
           you call mimetype by a link called 'file'.

           A single '-' won't be considered a separator between options and filenames anymore, but
           becomes identical to "--stdin".  ( You can still use '--' as separator, but that is not
           backward compatible with the original file command. ) Also the default becomes to print
           descriptions instead of mimetypes.

       -F string, --separator=string
           Use string as custom separator between the file name and its mimetype or description,
           defaults to ':' .

       -h, --help
       -u, --usage
           Print a help message and exits.

       -i, --mimetype
           Use mime types, opposite to "--describe", this is the default when _not_ using
           "--file-compat".

       -L, --dereference
           Follow symbolic links.

       -l code, --language=code
           The language attribute specifies a two letter language code, this makes descriptions being
           outputted in the specified language.

       -M, --magic-only
           Do not check for extensions, globs or inode type, only look at the content of the file.
           This is particularly useful if for some reason you don't trust the name or the extension a
           file has.

       -N, --noalign
           Do not align output fields.

       --output-format
           If you want an alternative output format, you can specify a format string containing the
           following escapes:

                   %f for the filename
                   %d description
                   %m mime type

           Alignment is not available when using this, you need to post-process the output to do that.

       --stdin
           Determine type of content from STDIN, less powerful then normal file checking because it
           only uses magic typing. This will happen also if the STDIN filehandle is a pipe.

           To use this option IO::Scalar needs to be installed.

       -v, --version
           Print the version of the program and exit.

ENVIRONMENT
       XDG_DATA_HOME
       XDG_DATA_DIRS
           These variables can list base directories to search for data files. The shared mime-info
           will be expected in the "mime" sub directory of one of these directories. If these are not
           set, there will be searched for the following directories:

                   $HOME/.local/share/mime
                   /usr/local/share/mime
                   /usr/share/mime

           See also the "XDG Base Directory Specification"
           <http://freedesktop.org/Standards/basedir-spec>

FILES
       The base dir for all data files is determined by two environment variables, see "ENVIRONMENT".

       BASE/mime/packages/SOURCE.xml
           All other files are compiled from these source files. To re-compile them use
           update-mime-database(1).

       BASE/mime/globs
           Compiled information about globs.

       BASE/mime/magic
           Compiled information about magic numbers.

       BASE/mime/MEDIA/SUBTYPE.xml
           Descriptions of a mimetype in multiple languages, used for the "--describe" switch.

DIAGNOSTICS
       If a file has an empty mimetype or an empty description, most probably the file doesn't exist
       and the given name doesn't match any globs. An empty description can also mean that there is no
       description available in the language you specified.

       The program exits with a non-zero exit value if either the commandline arguments failed, a
       module it depends on wasn't found or the shared mime-info database wasn't accessible. See
       File::MimeInfo for more details.

TODO
       The '--all' switch doesn't really show all matches, but only one per mime-typing method. This
       needs to be implemented in the modules first.

BUGS
       If you find bugs, please file them in our Github issue tracker at
       <https://github.com/mbeijen/File-MimeInfo/issues>.

       mimetype doesn't provide a switch for looking inside compressed files because it seems to me
       that this can only be done by un-compressing the file, something that defeats the purpose. On
       the other hand the option should exist for strict compatibility with file(1). Possibly a
       subclass should be made for this one day.

AUTHOR
       Jaap Karssenberg <pardus@cpan.org> Maintained by Michiel Beijen <michiel.beijen@gmail.com>

COPYRIGHT
       Copyright (c) 2003, 2012 Jaap G Karssenberg. All rights reserved.  This program is free
       software; you can redistribute it and/or modify it under the same terms as Perl.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
       without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       file(1), update-mime-database(1), File::MimeInfo(3),
       <http://freedesktop.org/Software/shared-mime-info>

perl v5.26.2                                  2018-08-06                                  MIMETYPE(1p)
