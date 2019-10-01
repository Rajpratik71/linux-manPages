VORBISCOMMENT(1)                                                                               Ogg Vorbis Tools                                                                              VORBISCOMMENT(1)



NAME
       vorbiscomment - List or edit comments in Ogg Vorbis files


SYNOPSIS
       vorbiscomment [-l] [-R] [-e] file.ogg
       vorbiscomment -a [ -c commentfile | -t “name=value” ] [-q] [-R] [-e] in.ogg [out.ogg]
       vorbiscomment -w [ -c commentfile | -t “name=value” ] [-q] [-R] [-e] in.ogg [out.ogg]


DESCRIPTION
       vorbiscomment Reads, modifies, and appends Ogg Vorbis audio file metadata tags.


OPTIONS
       -a, --append
              Append comments.

       -c file, --commentfile file
              Take comments from a file. The file is the same format as is output by the -l option or given to the -t option: one element per line in 'tag=value' format. If the file is /dev/null and -w was
              passed, the existing comments will be removed.

       -h, --help
              Show command help.

       -l, --list
              List the comments in the Ogg Vorbis file.

       -t 'name=value', --tag 'name=value'
              Specify a new tag on the command line. Each tag is given as a single string. The part before the '=' is treated as the tag name and the part after as the value.

       -w, --write
              Replace comments with the new set given either on the command line with -t or from a file with -c. If neither -c nor -t is given, the new set will be read from the standard input.

       -R, --raw
              Read and write comments in UTF-8, rather than converting to the user's character set.

       -e, --escapes
              Quote/unquote newlines and backslashes in the comments. This ensures every comment is exactly one line in the output (or input), allowing to filter and round-trip them. Without  it,  you  can
              only write multi-line comments by using -t and you can't reliably distinguish them from multiple one-line comments.

              Supported escapes are c-style "\n", "\r", "\\" and "\0". A backslash followed by anything else is an error.

              Note:  currently,  anything  after the first "\0" is thrown away while writing.  This is a bug -- the Vorbis format can safely store null characters, but most other tools wouldn't handle them
              anyway.

       -V, --version
              Display the version of vorbiscomment.


EXAMPLES
       To just see what comment tags are in a file:

           vorbiscomment -l file.ogg

       To edit those comments:

           vorbiscomment -l file.ogg > file.txt
           [edit the comments in file.txt to your satisfaction]
           vorbiscomment -w -c file.txt file.ogg newfile.ogg

       To simply add a comment:

           vorbiscomment -a -t 'ARTIST=No One You Know' file.ogg newfile.ogg

       To add a set of comments from the standard input:

           vorbiscomment -a file.ogg
           ARTIST=No One You Know
           ALBUM=The Famous Album
           <ctrl-d>


TAG FORMAT
       See http://xiph.org/vorbis/doc/v-comment.html for documentation on the Ogg Vorbis tag format, including a suggested list of canonical tag names.


AUTHORS
       Program Authors:
              Michael Smith <msmith@xiph.org>
              Ralph Giles <giles@xiph.org>


       Manpage Author:
              Christopher L Cheney <ccheney@debian.org>


SEE ALSO
       oggenc(1), oggdec(1), ogg123(1), ogginfo(1)



Xiph.Org Foundation                                                                           December 30, 2008                                                                              VORBISCOMMENT(1)
