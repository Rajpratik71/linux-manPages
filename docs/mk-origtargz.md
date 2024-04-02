MK-ORIGTARGZ(1)                                                                                                                    MK-ORIGTARGZ(1)

NAME
       mk-origtargz - rename upstream tarball, optionally changing the compression and removing unwanted files

SYNOPSIS
       mk-origtargz [options] foo-1.0.tar.gz
       mk-origtargz --help

DESCRIPTION
       mk-origtargz renames the given file to match what is expected by dpkg-buildpackage, based on the source package name and version in
       debian/changelog. It can convert zip to tar, optionally change the compression scheme and remove files according to Files-Excluded and
       Files-Excluded-component in debian/copyright. The resulting file is placed in debian/../... (In debian/copyright, the Files-Excluded and
       Files-Excluded-component stanzas are a part of the first paragraph and there is a blank line before the following paragraphs which contain
       Files and other stanzas.  See uscan(1) "COPYRIGHT FILE EXAMPLE".)

       The archive type for zip is detected by "file --dereference --brief --mime-type" command.  So any zip type archives such as jar are treated
       in the same way.  The xpi archive is detected by its extension and is handled properly using the xpi-unpack command.

       If the package name is given via the --package option, no information is read from debian/, and the result file is placed in the current
       directory.

       mk-origtargz is commonly called via uscan, which first obtains the upstream tarball.

OPTIONS
   Metadata options
       The following options extend or replace information taken from debian/.

       --package package
           Use package as the name of the Debian source package, and do not require or use a debian/ directory. This option can only be used
           together with --version.

           The default is to use the package name of the first entry in debian/changelog.

       -v, --version version
           Use version as the version of the package. This needs to be the upstream version portion of a full Debian version, i.e. no Debian
           revision, no epoch.

           The default is to use the upstream portion of the version of the first entry in debian/changelog.

       --exclude-file glob
           Remove files matching the given glob from the tarball, as if it was listed in Files-Excluded.

       --copyright-file filename
           Remove files matching the patterns found in filename, which should have the format of a Debian copyright file (Format:
           https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/ to be precise). Errors parsing that file are silently ignored,
           exactly as is the case with debian/copyright.

           Unmatched patterns will emit a warning so the user can verify whether it is correct.  If there are multiple patterns which match a
           file, only the last one will count as being matched.

           Both the --exclude-file and --copyright-file options amend the list of patterns found in debian/copyright. If you do not want to read
           that file, you will have to use --package.

   Action options
       These options specify what exactly mk-origtargz should do. The options --copy, --rename and --symlink are mutually exclusive.

       --symlink
           Make the resulting file a symlink to the given original file. (This is the default behaviour.)

           If the file has to be modified (because it is a zip, or xpi file, because of --repack or Files-Excluded), this option behaves like
           --copy.

       --copy
           Make the resulting file a copy of the original file (unless it has to be modified, of course).

       --rename
           Rename the original file.

           If the file has to be modified (because it is a zip, or xpi file, because of --repack or Files-Excluded), this implies that the
           original file is deleted afterwards.

       --repack
           If the given file is not compressed using the desired format (see --compression), recompress it.

       -S, --repack-suffix suffix
           If the file has to be modified, because of Files-Excluded, append suffix to the upstream version.

       -c, --component componentname
           Use <componentname> as the component name for the secondary upstream tarball.  Set componentname as the component name.  This is used
           only for the secondary upstream tarball of the Debian source package.  Then packagename_version.orig-componentname.tar.gz is created.

       --compression [ gzip | bzip2 | lzma | xz ]
           If --repack is used, or if the given file is a zip or xpi file, ensure that the resulting file is compressed using the given scheme.
           The default is gzip.

       -C, --directory directory
           Put the resulting file in the given directory.

       --unzipopt options
           Add the extra options to use with the unzip command such as -a, -aa, and -b.

SEE ALSO
       uscan(1), uupdate(1)

AUTHOR
       mk-origtargz and this manpage have been written by Joachim Breitner <nomeata@debian.org>.

Debian Utilities                                                    2016-03-23                                                     MK-ORIGTARGZ(1)
