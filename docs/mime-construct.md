MIME-CONSTRUCT(1p)                                      User Contributed Perl Documentation                                     MIME-CONSTRUCT(1p)

NAME
       mime-construct - construct and optionally mail MIME messages

SYNOPSIS
       mime-construct switch...

       Sorry, it's hard to provide a meaningful synopsis.  See the examples.

DESCRIPTION
       mime-construct constructs and (by default) mails MIME messages.  It is entirely driven from the command line, it is designed to be used by
       other programs, or people who act like programs.

OPTIONS
   Global Settings
       --debug
           Turn debugging on.

       --help
           Show the usage message and die.

       --output
           Don't mail the generated message, print it to stdout instead.  This loses --bcc info.

       --subpart
           Generate a subpart which can be used in another MIME message, rather than a top-level MIME message itself.  This turns on --output and
           changes some internal semantics a bit.  See the examples.

       --version
           Print the version and exit successfully, if this is the only arg.  Otherwise, print the version and die.

   Main Header
       These arguments add text to the top-level header of the message, or control who it gets sent to.

       --bcc address
           Add address to the recipient list.  This doesn't actually add anything to the header, of course.  If you're not actually mailing the
           message (if you use --output or --subpart) --bcc will have no effect.

       --cc address
           Add an address to the Cc: list.

       --embedded-to
           Send the message to the recipients already listed in the header, in addition to those given with --to, --cc, and --bcc.  This makes
           sense if you use the --header switch to add your own To: or Cc:.  In this case you probably don't want to use --to or --cc because they
           would create new headers rather than adding to the ones already in the message.

           This switch passes the -t switch to sendmail (mime-construct doesn't try to parse the headers you provide), so it doesn't really do
           anything if you're not mailing the message.

       --header str
           Add arbitrary text to the header.  The str can be anything you like, including multiple lines.  You can create invalid messages this
           way.  If you include a blank line in the str you'll really screw up the message.

       --multipart str
           This specifies the multipart content type and options.  The default is "multipart/mixed".  Don't include a "boundary" setting, that's
           supplied by mime-construct.

           It's okay if you specify the --multipart type but the message turns out to be a single part, the type you supply will just be ignored.

       --prelude str
           This adds str to the multipart prelude text.  If you specify --prelude multiple times the strs will all be concatenated.

           There isn't any default for this text.  It seems to me that nowadays adding an explanation of MIME to the beginning of a message is
           like explaining how to use a seat buckle to people who are riding in an airplane.

           It's okay if you specify the --prelude but the message turns out to be a single part, the prelude you supply will just be ignored.

       --subject str
           Specify the subject for the message.

       --to address
           Add an address to the To: list.

   Per-part Header
       These switches control the per-part headers.  If the message turns out not to be multipart they actually add data to the top level header.

       Each of these applies only to the next part output.  After each part is output they are reset to their default values.  It doesn't make
       sense to use them without a following part, so mime-construct will sputter and die if you try to do that.

       --attachment name
           This adds a "Content-Disposition: attachment" header with the given name as the value of the "filename" attribute.  It's just a
           convenience, since mime-construct is often used to send files as attachments.

           Using --attachment name does not cause mime-construct to read any data from the file called name!  It just uses that name in the
           header.  The actual data which will go into this part of the message comes from one of the regular part output switches (given below).

           You might prefer to use the --file-attach switch, which does read from the named file.

       --encoding type
           This specifies the type of encoding you want this part to use.  You normally shouldn't use this switch, though.  If this switch isn't
           used mime-construct will choose an appropriate encoding.

           The data you supply mustn't be encoded already, mime-construct will encode it according to the type you specify here.  Valid encodings
           are 7bit, 8bit, binary, quoted-printable, and base64.  It's easy to generate an illegal MIME message by specifying the encoding
           yourself.

       --part-header str
           Add arbitrary text to the per-part header.  The str can be anything you like, including multiple lines.  You can create invalid
           messages this way.  If you include a blank line in the str you'll really screw up the message.

       --type type
           Specify the content type for this part.  If you don't specify a --type it defaults to "text/plain".  The type you supply can contain
           not only the type proper but also options.  The whole thing will just be plopped onto the end of "Content-Type:" and stuck into the
           header.

           You might prefer to use the --file-auto or --file-attach switches, which set the --type automatically based on a file's name.

   Part Output
       These switches add data to the body of the message.  You use one of these for each for each part of a multipart message (or just one of
       them if the message isn't to be multipart).

       --file path
       --file-auto path
       --file-attach path
       --attach path
       --string str
       --body str
           Use the contents of the file path or the literal string str as the body of this part.

           --file-auto causes the Content-Type to be set based on the file's name, if possible.

           --file-attach does that and sets the --attachment name as well.

           Be sure to include the trailing newline on str unless there really isn't supposed to be one.  If you leave the trailing newline off the
           part will have to be encoded in "base64" (because "quoted-printable" has an artificial limitation which prevents it from being able to
           encode such a data stream).

           --attach is an alias for --file-attach, and --body is an alias for --string.

       --subpart-file path
       --subpart-string str
           Use either the contents of path or str itself as the body of this part, but treat it as a subpart.  This means that the data contains
           both some headers and some text.  It also means that you can't use --type or --encoding for this part.

           Normally the path or str will have been generated by a different invocation of mime-construct which was given the --subpart switch.

       Arguments to switches which take a file name (such as --file and --subpart-file) can have some magic.  If there is no file with the path
       supplied a regular Perl open() is done on it.  See "EXAMPLES".

EXAMPLES
       The examples assume that $nl contains a newline.  The other variables used are I hope self-explanatory.

       Send a simple message.

           mime-construct --to "$recip" --subject 'hi there' --string "$body"

       Send a message which is read from stdin.

           fortune | mime-construct --to "$recip" --subject fortune --file -

       Send a plain text part and attach a file, setting the file's content type and --attachment name automatically.

           mime-construct --to "$recip" --subject "$file" \
               --string "Here's the file I told you about.$nl" \
               --file-attach "$file"

       Most people think of attachments as multipart messages, but they don't have to be.  This generates a zip of all the files in the current
       directory and sends them as an attachment but as a single part message.

           zip -q - * |
               mime-construct --to "$recip" --subject 'zipped directory' \
                   --attachment dir.zip --type application/zip --file -

       You can use the full expressiveness of Perl's open() when constructing file names.  Eg, you can run processes XXX bad examples, there's no
       file names

           mime-construct --to "$recip" --subject "$subject" \
            --string "Here are those two files you wanted.$nl" \
            --type application/x-gzip --attachment file1.gz --file 'gzip -c file1 |' \
            --type application/x-gzip --attachment file1.gz --file 'gzip -c file2 |'

       or read from alternate file descriptors ("<&=4" to read from file descriptor 4) or whatever.  See perlopentut for a tutorial.

       Here's an example of using a separate invocation of mime-construct to create a subpart.  This creates a message which has two parts at the
       top level.  The first part is some text, the second part is a digest.  The digest itself is a multipart message which contains a number of
       message/rfc822 parts.

           msg_args=
           for msg in $msg_list
           do
               msg_args="$msg_args --type message/rfc822 --file $msg"
           done

           set fnord
           for recip in $recip_list
           do
               set "$@" --bcc $recip
           done
           shift

           mime-construct --subpart --multipart multipart/digest $msg_args |
               mime-construct \
                   --header "To: Digest recipients:;$nl" \
                   --subject 'Foo digest' \
                   "$@" \
                   --file "$introduction" \
                   --subpart-file -

       Here is how to send an encrypted messages (multipart/encrypted, as defined in RFC 1847).  You use mime-construct "--subpart" to generate
       the real message you want to send (which can be kind of MIME message -- non-text, multi-part, what have you), then encrypt that and use
       another mime-construct to contruct and send the multipart/encrypted message which contains it.

           enc_type=application/pgp-encrypted
           enc_params="Version: 1$nl"

           mime-construct --subpart --file body --file-auto image.jpg |
             gpg --encrypt --armor -r "$recip" |
             mime-construct --output \
               --to "$recip" \
               --subject "$subject" \
               --multipart "multipart/encrypted; protocol=\"$enc_type\"" \
               --type "$enc_type" \
               --string "$enc_params" \
               --type application/octet-stream \
               --file -

BUGS
       The body of the message is always held in memory, so you can expect problems if you work with bodies which are large compared to the amount
       of memory you've got.

AVAILABILITY
       The code is licensed under the GNU GPL.  Check http://www.argon.org/~roderick/ for updated versions.

AUTHOR
       Roderick Schertler <roderick@argon.org>

perl v5.22.1                                                        2016-02-13                                                  MIME-CONSTRUCT(1p)
