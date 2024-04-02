GROWISOFS(1m)                                                                                                                                                                                   GROWISOFS(1m)



NAME
       growisofs - combined mkisofs frontend/DVD recording program.

SYNOPSIS
       growisofs [-dry-run] [-dvd-compat] [-overburn] [-speed=1] -[Z|M] /dev/dvd <mkisofs-options>


DESCRIPTION
       growisofs  was  originally designed as a frontend to mkisofs to facilitate appending of data to ISO9660 volumes residing on random-access media such as DVD+RW, DVD-RAM, plain files, hard disk parti‐
       tions. In the course of development general purpose DVD recording support was implemented, and as of now growisofs supports not only random-access media, but even mastering of multisession DVD media
       such as DVD+R and DVD-R/-RW, as well as Blu-ray Disc. In addition growisofs supports first-/single-session recording of arbitrary pre-mastered image (formatted as UDF, ISO9660 or any other file sys‐
       tem, if formatted at all) to all supported DVD media types.


OPTIONS
       -Z /dev/dvd
              Burn an initial session to the selected device. A special form of this option is recognized to support burning of pre-mastered images. See EXAMPLES section for further details.

       -M /dev/dvd
              Merge a new session to an existing one.

       -version
              Print version information and invoke mkisofs, also with -version option.

       -dvd-compat
              Provide maximum media compatibility with DVD-ROM/-Video. In write-once DVD+R or DVD-R context this results in unappendable recording (closed disk). In DVD+RW context it instructs the  logical
              unit to explicitly burn [otherwise optional] lead-out.

       -dry-run
              At  dry-run growisofs performs all the steps till, but not including the first write operation. Most notably check for "overburn" condition is performed, which implies that mkisofs is invoked
              and terminated prematurely.

       -overburn
              Normally single layer DVD media can accommodate up to approximately 4.700.000.000 bytes (in marketing speech 4.7GB). In other words a DVD can contain about 4.377 GiB or 4482 MiB. Same kind of
              arithmetics applies to Blu-ray Disc capacity of 25.000.000.000 bytes. Anyway, growisofs won't start without this option, if "overburn" condition appears to be unavoidable.

       -speed=N
              An  option  to  control recording velocity. Most commonly you'll use -speed=1 with "no-name" media, if default speed setting messes up the media. Keep in mind that N essentially denotes speed
              closest to N*1385KBps in DVD or N*4496KBps in Blu-ray Disc case among those offered by unit for currently mounted media. The list can be found in dvd+rw-mediainfo output.  Note  that  Blu-ray
              Disc recordings are commonly performed at ~1/2 of advertised speed, because of defect management being in effect.

       <mkisofs-options>
              More options can be found in the manpage for mkisofs.


       There are several undocumented options commonly denoted with -use-the-force-luke prefix. Some of them serve debugging purposes. Some require certain knowledge about recording process or even OS ker‐
       nel internals and as being such can induce confusing behaviour. Some are to be used in very specific situations better recognized by front-ends or automated scripts. Rationale behind  leaving  these
       options undocumented is that those few users who would actually need to use them directly can as well consult the source code or obtain specific instructions elsewhere.


DIFFERENCES WITH RUNNING MKISOFS DIRECTLY
       When using growisofs you may not use the -o option for an output file.  growisofs dumps the image directly to the media;

       You don't have to specify the -C option to create a higher level session on a multisession disk, growisofs will construct one for you;

       Otherwise  everything  that  applies  to  [multisession] mastering with mkisofs applies to growisofs as well.  growisofs needs at least mkisofs version 1.14, version 2.0 is required for multisession
       write-once recordings.


EXAMPLES
       Actual device names vary from one operating system to another. We use /dev/dvd as a collective name or as symbolic link to the actual device if you wish. Under  Linux  it  will  most  likely  be  an
       ide-scsi device  such as "/dev/sr0." Under NetBSD/OpenBSD it has to be a character SCSI CD-ROM device such as "/dev/rcd0c." Under Solaris it also has to be a character SCSI/ATAPI CD-ROM device, e.g.
       "/dev/rdsk/c0t1d0s2" or "/vol/dev/aliases/cdrom0." And likewise in HP-UX, IRIX and Mac OS X...

       To master and burn an ISO9660 volume with Joliet and Rock-Ridge extensions on a DVD or Blu-ray Disc:

            growisofs -Z /dev/dvd -R -J /some/files

       To append more data to same media:

            growisofs -M /dev/dvd -R -J /more/files

       Make sure to use the same options for both initial burning and when appending data.

       To finalize the multisession DVD maintaining maximum compatibility:

            growisofs -M /dev/dvd=/dev/zero

       To use growisofs to write a pre-mastered ISO-image to a DVD:

            growisofs -dvd-compat -Z /dev/dvd=image.iso

       where image.iso represents an arbitrary object in the filesystem, such as file, named pipe or device entry. Nothing is growing here and command name is not intuitive in this context.


NOTES
       If executed under sudo(8) growisofs refuses to start. This is done for the following reason. Naturally growisofs has to access the data set to be recorded to optical media, either indirectly by let‐
       ting  mkisofs  generate ISO9660 layout on-the-fly or directly if a pre-mastered image is to be recorded. Being executed under sudo(8), growisofs effectively grants sudoers read access to any file in
       the file system. The situation is intensified by the fact that growisofs parses MKISOFS environment variable in order to determine alternative path to mkisofs executable image. This means that being
       executed  under sudo(8), growisofs effectively grants sudoers right to execute program of their choice with elevated privileges. If you for any reason still find the above acceptable and are willing
       to take the consequences, then consider running following wrapper script under sudo(8) in place for real growisofs binary.

            #!/bin/ksh
            unset SUDO_COMMAND
            export MKISOFS=/path/to/trusted/mkisofs
            exec growisofs "$@"

       But note that the recommended alternative to the above "workaround" is actually to install growisofs set-root-uid, in which case it will drop privileges prior accessing data or executing mkisofs  in
       order to preclude unauthorized access to the data.

       If the media already carries isofs and growisofs is invoked with -Z option non-interactively, e.g. through cron, it shall fail with "FATAL: /dev/dvd already carries isofs!" Note that only ISO9660 is
       recognized, you can perfectly zap e.g. an UDF filesystem non-interactively. Recommendation is to prepare media for unattended usage by re-formatting or nullifying first 64KB in advance.

       "Overburn" protection in pre-mastered image context works only with plain files and ISO9660 formatted volumes. E.g. [given that /dev/root  is  an  ext2  formatted  file  system  larger  than  4.7GB]
       /dev/dvd=/dev/root is bound to produce corrupted recording.

       Note that DVD+RW re-formatting procedure does not substitute for blanking. If you want to nullify the media, e.g. for privacy reasons, do it explicitly with 'growisofs -Z /dev/dvd=/dev/zero'.

       Playback of re-writable DVD media, both DVD+RW and DVD-RW, might be limited in legacy DVD-ROM/-Video units. In most cases this is due to lower reflectivity of such media.

       Even though growisofs supports it, playback of multisession write-once DVD might be limited to the first session for two reasons:


       ·      not  all  DVD-ROM  players  are  capable  of multi-border DVD-R playback, even less are aware of DVD+R multisessioning, burner unit therefore might be the only one in your vicinity capable of
              accessing files written at different occasions;

       ·      OS might fail to mount multisession DVD for various reasons;

       The above is not applicable to DVD+RW, DVD-RW Restricted Overwrite, DVD-RAM or Blu-ray Disc, as volumes are grown within a single session.

       When growisofs "runs into" blank Blu-ray Disc media, BD-RE or BD-R, it gets pre-formatted with minimal spare area size of 256MB.

       A DVD-RW accepts two disc modes: the Sequential Recording and the Restricted Overwrite. If a DVD-RW medium is in the later one, it will behave much like DVD+RW.   By  default  DVD-RW  discs  are  in
       Sequential Recording mode, but can be put into Restricted Overwrite mode using dvd+rw-format.  See dvd+rw-format (1) for more info.


SEE ALSO
       Most up-to-date information on dvd+rw-tools is available at http://fy.chalmers.se/~appro/linux/DVD+RW/.

       mkisofs(1), dvd+rw-format(1)


AUTHORS
       Andy Polyakov <appro@fy.chalmers.se> stands for programming and on-line information.

       This manpage is currently maintained by Huub Reuver <h_reuver@mantell.xs4all.nl>.


LICENSE
       growisofs is distributed under GNU GPL.




growisofs 7.1                                                                                     1 Mar 2008                                                                                    GROWISOFS(1m)
