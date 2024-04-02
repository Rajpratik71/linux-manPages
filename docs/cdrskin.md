CDRSKIN(1)                                                                                 General Commands Manual                                                                                 CDRSKIN(1)



NAME
       cdrskin - burns preformatted data to CD, DVD, and BD via libburn.

SYNOPSIS
       cdrskin [options|track_source_addresses]

DESCRIPTION
       cdrskin is a program that provides some of cdrecord's options in a compatible way for CD media. With DVD and BD it has its own ways.  You do not need to be superuser for its daily usage.

   Overview of features:
       Blanking of CD-RW and DVD-RW.
       Formatting of DVD-RW, DVD+RW, DVD-RAM, BD.
       Burning of data tracks or audio tracks with CD-TEXT to CD,
       either in versatile Track at Once mode (TAO)
       or in Session at Once mode for seamless tracks.
       Multi session on CD (follow-up sessions in TAO only)
       or on DVD-R[W] (in Incremental mode) or DVD+R[/DL] or BD-R.
       Single session Disk-at-once on DVD-RW, DVD-R, DVD-R DL.
       Single session or emulated ISO-9660 multi-session
       on overwriteable DVD+RW, DVD-RW, DVD-RAM, BD-RE
       or on data file or block device.
       Extraction of audio tracks and CD-TEXT to hard disk files.
       Bus scan, burnfree, speed options, retrieving media info, padding, fifo.
       See section EXAMPLES at the end of this text.

   General information paragraphs:
       Track recording model
       Write mode selection
       Recordable CD Media
       Sequentially Recordable DVD or BD Media
       Overwriteable DVD or BD Media
       Drive preparation and addressing
       Emulated drives

   Track recording model:
       The input-output entities which get processed are called tracks.  A track stores a stream of bytes.
       More than one track can be burned by a single run of cdrskin.  In the terms of the MMC standard all tracks written by the same run constitute a session.
       Normally,  each  track is initiated by one track source address argument, which may either be "-" for standard input or the address of a readable file.  Alternatively, option cuefile= may be used to
       read a session description from a text file and to read the session content from a single data file.
       If no write mode is given explicitly then one will be chosen which matches the peculiarities of track sources and the state of the output media.

       Some media types can be kept appendable so that further tracks can be written to them in subsequent runs of cdrskin (see option -multi).  Info about the addresses of burned tracks is kept in a table
       of content (TOC) on media and can be retrieved via cdrskin option -toc.  This information is also used by the operating systems' CD-ROM read drivers.

       In  general  there are two types of tracks: data and audio. They differ in sector size, throughput and readability via the systems' CD-ROM drivers resp. by music CD players. With DVD and BD there is
       only type data.
       If not explicitly option -audio is given, then any track is burned as type data, unless the track source is a file with suffix ".wav" or ".au" and has a header part which identifies  it  as  MS-WAVE
       resp. SUN Audio with suitable parameters. Such files are burned as audio tracks by default.

       While audio tracks just contain a given time span of acoustic vibrations, data tracks may have an arbitray meaning. Nevertheless, ISO-9660 filesystems are established as a format which can represent
       a tree of directories and files on all major operating systems. Such filesystem images can be produced by programs mkisofs or genisoimage or xorriso.  They can also be extended by  follow-up  tracks
       if prepared properly.  See the man pages of said programs.  cdrskin is able to fulfill the needs about their option -C.
       Another  type  of  data  track  content  are  archive formats which originally have been developed for magnetic tapes. Only formats which mark a detectable end-of-archive in their data are suitable,
       though. Well tested are the archivers afio and star. Not suitable seems GNU tar.

   Write mode selection:
       In general there are two approaches for writing media:
       A permissive mode depicted by option -tao which needs no predicted track size and allows to make use of eventual multi-session capabilities.
       A more restrictive mode -sao (alias -dao) which usually demands a predictable track size and is not necessarily capable of multi-session. It can be used to write CD-TEXT and it is the only one  that
       works with option cuefile=.
       If  none  of  the  options  -dao,  -tao  or -sao is given then the program will try to choose a write mode which matches the defined recording job, the capabilities of the drive and the state of the
       present media.
       So the mentioning of write modes in the following paragraphs and in the examples is not so much a demand that the user shall choose one explicitly, but rather an illustration of what to expect  with
       particular media types.

   Recordable CD Media:
       CD-R  can  be  initially  written  only once and eventually extended until they get closed (or are spoiled because they are overly full). After that they are read-only. Closing is done automatically
       unless option -multi is given which keeps the media appendable.
       Write mode -tao allows to use track sources of unpredictable length (like stdin) and allows to write further sessions to appendable media.  -sao produces audio  sessions  with  seamless  tracks  but
       needs predicted track sizes and cannot append sessions to media.
       CD-RW  media  can  be  blanked to make them re-usable for another round of overwriting. Usually blank=fast is the appropriate option.  Blanking damages the previous content but does not make it com-
       pletely unreadable. It is no effective privacy precaution.  Multiple cycles of blanking and overwriting with random numbers might be needed.

   Sequentially Recordable DVD or BD Media:
       Currently DVD-RW, DVD-R[DL], DVD+R[DL], and BD-R can be used for the Sequential recording model. It resembles the model of CD media. Only DVD-RW can be blanked and re-used from scratch.
       DVD-RW are sequential media if they are in state "Sequential Recording".  The media must be either blank or appendable.  Newly purchased DVD-RW and DVD-R media are in this state.   Used  DVD-RW  get
       into blank sequential state by option blank=deformat_sequential .
       With DVD-R[W] two write modes may be available:
       Mode DAO has many restrictions. It does not work with appendable media, allows no -multi and only a single track. The size of the track needs to be known in advance. So either its source has to be a
       disk file of recognizable size or the size has to be announced explicitly by options tsize= or tao_to_sao_tsize= .
       DAO is the only mode for DVD-R media which do not offer feature 21h Incremental Streaming (e.g. DVD-R DL). DAO may also be selected explicitly by option -sao .  Program growisofs uses DAO on sequen-
       tial DVD-R[W] media for maximum DVD-ROM/-Video compatibility.
       The  other mode, Incremental Streaming, is the default write mode if it is available and if the restrictions of DAO would prevent the job.  Incremental Streaming may be selected explicitly by option
       -tao as it resembles much CD TAO by allowing track sources of unpredicted length and to keep media appendable by option -multi . It does not work with DVD-R DL and  minimally  blanked  DVD-RW.   The
       only restriction towards CD-R[W] is the lack of support for -audio tracks.  Multiple tracks per session are permissible.
       The write modes for DVD+R[/DL] and BD-R resemble those with DVD-R except that each track gets wrapped in an own session. There is no -dummy writing with DVD+R[/DL] or BD-R.
       Quite deliberately write mode -sao insists in the tradition of a predicted track size and blank media, whereas -tao writes the tracks open ended and allows appendable media.
       BD-R may be formatted before first use to enable the Defect Management which might catch and repair some bad spots at the expense of slow speed even with flawless media.
       Note: Option -multi might make DVD media unreadable in some DVD-ROM drives.  Best reader compatibility is achieved without it (i.e. by single session media).

   Overwriteable DVD or BD Media:
       Currently types DVD+RW, DVD-RW, DVD-RAM and BD-RE can be overwritten via cdrskin.
       Option  -audio is not allowed. Only one track is allowed.  Option -multi cannot mark a recognizable end of overwriteable media.  Therefore -multi is banned unless ISO-9660 images shall be expandable
       by help of option --grow_overwriteable_iso .  Without this option or without an ISO-9660 filesystem image present on media, -toc does not return information about the media  content  and  media  get
       treated as blank regardless wether they hold data or not.
       Currently there is no difference between -sao and -tao. If ever, then -tao will be the mode which preserves the current behavior.

       DVD+RW  and  DVD-RAM media need no special initial formatting. They offer a single continuous data area for blockwise random access. BD-RE need explicit formatting before use. See blank=as_needed or
       blank=format_defectmgt .
       DVD-RW are sold in state "Sequential Recording". To become suitable for the Overwriteable DVD recording model they need to get formatted to state "Restricted Overwrite". Then they behave  much  like
       DVD+RW. This formatting can be done by option blank=format_overwrite .
       Several programs like dvd+rw-format, cdrecord, wodim, or cdrskin can bring a DVD-RW out of overwriteable state so that it has to be formatted again. If in doubt, just give it a try.

   Drive preparation and addressing:
       The  drives,  CD,  DVD,  or  BD  burners,  are  accessed  via  addresses  which  are specific to libburn and the operating system. Those addresses get listed by a run of cdrskin --devices or cdrskin
       --device_links.
       On Linux, they are device files which traditionally do not offer w-permissions for normal users. Because libburn needs rw-permission, it might be only the superuser who is  able  to  get  this  list
       without further precautions.
       It  is  consensus  that chmod a+rw /dev/sr0 or chmod a+rw /dev/hdc is less security sensitive than chmod u+s,a+x /usr/bin/cdrskin. The risk for the drive is somewhat higher but the overall system is
       much less at stake.  Consider to restrict rw-access to a single group which bundles the users who are allowed to use the burner drive (like group "floppy").
       For drive permission examples on Linux, FreeBSD, and Solaris, see cdrskin/README.

       If you only got one CD capable drive then you may leave out cdrskin option dev=. Else you should use this option to address the drive you want.
       cdrskin option dev= not only accepts the listed addresses but also traditional cdrecord SCSI addresses which consist of three numbers: Bus,Target,Lun. On Linux there is also a related address family
       "ATA" which accesses IDE drives not under control of Linux SCSI drivers: ATA:Bus,Target,Lun.
       See option -scanbus for getting a list of cdrecord style addresses.
       Further  are  accepted:  links  to  libburn-suitable  device files, device files which have the same major and minor device number, and device files which have the same SCSI address parameters (e.g.
       /dev/sg0).

   Emulated drives:
       Option --allow_emulated_drives enables addressing of pseudo-drives which get emulated on top of filesystem objects. Regular data files and block devices result in  pseudo-drives  which  behave  much
       like DVD-RAM.  If the given address does not exist yet but its directory exists, then it gets created as regular file.  Other file types like character devices or pipes result in pseudo-drives which
       behave much like blank DVD-R.  The target file address is given after prefix "stdio:".
       E.g.: dev=stdio:/tmp/my_pseudo_drive
       Addresses of the form "stdio:/dev/fd/<number>" are treated special. The number is read literally and used as open file descriptor. With dev="stdio:/dev/fd/1" the normal standard output of  the  pro-
       gram is redirected to stderr and the stream data of a burn run will appear on stdout.
       Not good for terminals ! Redirect it.
       Pseudo-drives allow -dummy. Their reply with --tell_media_space can be utopic.  -dummy burn runs touch the file but do not modify its data content.
       Note:  --allow_emulated_drives  is  restricted  to stdio:/dev/null if cdrskin is run by the superuser or if it has changed user identity via the setuid bit of its access permissions. The ban for the
       superuser can be lifted by a skillfully created file. See section FILES below.

OPTIONS
       --help Show non-cdrecord compatible options.

       -help  Show cdrecord compatible options.
              Note that some of the help texts are quite wrong - for cdrecord as well as for cdrskin (e.g. -format, blank=, -load). They are, nevertheless, traditional indicators for  the  availability  of
              the listed options. Some frontend programs make decisions after reading them.

       -version
              Print cdrskin id line, compatibility lure line, libburn version, cdrskin version, version timestamp, build timestamp (if available), and then exit.

       Alphabetical list of options which are intended to be compatible with original cdrecord by Joerg Schilling:

       -atip  Retrieve some info about media state. With CD-RW print "Is erasable".  With DVD media print "book type:" and a media type text. With BD media print "Mounted Media:" and media type text.

       -audio Announces  that  the  subsequent  tracks are to be burned as audio.  The source is supposed to be uncompressed headerless PCM, 44100 Hz, 16 bit, stereo. For little-endian byte order (which is
              usual on PCs) use option -swab. Unless marked explicitly by option -data, input files with suffix ".wav" are examined wether they have a header in MS-WAVE format confirming  those  parameters
              and eventually raw audio data get extracted and burned as audio track. Same is done for suffix ".au" and SUN Audio.
              Option -audio may be used only with CD media and not with DVD or BD.

       blank=type
              Blank a CD-RW, DVD-RW, or format a DVD-RW, DVD+RW, DVD-RAM, BD.  This is combinable with burning in the same run of cdrskin.  The type given with blank= selects the particular behavior:

              as_needed
                     Try  to  make  the media ready for writing from scratch. If it needs formatting, then format it. If it is not blank, then try to apply blank=fast.  It is a reason to abort if the media
                     cannot assume thoroughly writeable state, e.g. if it is non-blank write-once.
                     This leaves unformatted DVD-RW in unformatted blank state. To format DVD-RW use blank=format_overwriteable. Blank unformatted BD-R stay unformatted.
                     (Note: blank=as_needed is not an original cdrecord option.)

              The following blank types are specific to particular media familes. Use them if special features are desired.

              all    Blank an entire CD-RW or an unformatted DVD-RW.  (See also --prodvd_cli_compatible, --grow_overwriteable_iso)

              fast   Minimally blank an entire CD-RW or blank an unformatted DVD-RW.  (See also --prodvd_cli_compatible, --grow_overwriteable_iso)

              deformat_sequential
                     Like blank=all but with the additional ability to blank overwriteable DVD-RW.  This will destroy their formatting and make them sequentially recordable.   Another  peculiarity  is  the
                     ability to blank media which appear already blank.  This is similar to option -force but does not try to blank media other than recognizable CD-RW and DVD-RW.
                     (Note: blank=deformat_* are not original cdrecord options.)

              deformat_sequential_quickest
                     Like blank=deformat_sequential but blanking DVD-RW only minimally.  This is faster than full blanking but may yield media incapable of Incremental Streaming (-tao).

              format_if_needed
                     Format  a media if it is not formatted yet, and if cdrskin supports formatting for the media type, and if formatting will not happen automatically during write.  This currently applies
                     to unformatted DVD-RW, DVD-RAM, BD-RE, and blank unformatted BD-R.  Eventually the appropriate default formatting is chosen.  If other media or states are encountered then nothing hap-
                     pens.
                     The following formatting types are more specialized to particular media families.

              format_overwrite
                     Format a DVD-RW to "Restricted Overwrite". The user should bring some patience.
                     (Note: blank=format_* are not original cdrecord options.)

              format_overwrite_quickest
                     Like  format_overwrite  without  creating a 128 MiB trailblazer session.  Leads to "intermediate" state which only allows sequential write beginning from address 0.  The "intermediate"
                     state ends after the first session of writing data.

              format_overwrite_full
                     For DVD-RW this is like format_overwrite but claims full media size rather than just 128 MiB.  Most traditional formatting  is  attempted.  No  data  get  written.   Much  patience  is
                     required.
                     This option treats already formatted media even if not option -force is given.
                     For DVD+RW this is the only supported explicit formatting type. It provides complete "de-icing" so no reader slips on unwritten data areas.

              format_defectmgt
                     Format DVD-RAM or BD to reserve the default amount of spare blocks for defect management.
                     The  following  format_defectmgt_* allow to submit user wishes which nevertheless have to match one of the available formats. These formats are offered by the drive after examining the
                     media.

              format_defectmgt_cert_off
                     Disable the usual media quality certification in order to save time and format to default size.  The certification setting persists even if subsequent blank= options override the  size
                     of the format selection.
                     Whether formatting without certification works properly depends much on the drive. One should check the "Format status:" from --list_formats afterwards.

              format_defectmgt_cert_on
                     Re-enable the usual media quality certification and format to default size.  The certification setting persists like with format_defectmgt_cert_off.
                     Whether there happens certification at all depends much on the media state and the actually selected format descriptor.

              format_defectmgt_max
                     Format DVD-RAM or BD to reserve a maximum number of spare blocks.

              format_defectmgt_min
                     Format  DVD-RAM  or  BD  to  reserve a minimum number of spare blocks.  It might be necessary to format format_defectmgt_none first in order to get offered the most minmal spare blocks
                     sizes for format_defectmgt_min.

              format_defectmgt_none
                     Format DVD-RAM or BD-RE to the largest available payload in the hope to disable defect management at all. This may or may not have a speed increasing effect.   Unformatted  blank  BD-R
                     will be left unformatted.

              format_defectmgt_payload_<size>
                     Format  DVD-RAM  or  BD.  The  text after "format_defectmgt_payload_" gives a number of bytes, eventually with suffixes "s", "k", "m". The largest number of spare blocks will be chosen
                     which allows at least the given payload size.

              format_by_index_<number>
                     Format DVD-RW, DVD+RW, DVD-RAM or BD.  The number after "format_by_index_" is used as index to the list of available format descriptors. This list can be obtained by option --list_for-
                     mats.   The numbers after text "Format idx" are the ones to be used with format_by_index_. Format descriptor lists are volatile. Do neither eject nor write the media between the run of
                     --list_formats and the run of blank=format_by_index_ or else you may get a different format than desired.

              help   Print this list of blanking types.

       -checkdrive
              Retrieve some info about the addressed drive and then exit.  Exits with non-zero value if the drive cannot be found and opened.

       -copy  Create the subsequent tracks with permission for an unlimited number of copies.

       cuefile=path
              Read a session description from a cue sheet file in CDRWIN format.  Base the tracks on a single file which is given in the sheet by command FILE.  To enable CD-TEXT from the cue  sheet  file,
              cdrskin option -text has to be present.
              cdrskin currently supports TRACK datatypes AUDIO and MODE1/2048 which may not be mixed.  Data source may be of FILE type BINARY, MOTOROLA, or WAVE.
              Non-CDRWIN commands ARRANGER, COMPOSER, MESSAGE are supported.
              Cue  sheet  file  commands  CATALOG and ISRC may be overridden by option mcn= and by input_sheet_v07t= purpose specifiers "UPC / EAN" and "ISRC".  This does not affect their appearance in CD-
              TEXT, but only on Q sub-channel.
              The track numbers may be overridden by option cd_start_tno=.

       -dao   Alias for option -sao. Write CD in Session at Once mode or DVD-R[W] in Disc-at-once mode.

       -data  Subsequent tracks are data tracks. This option is default and only needed to mark the end of the range of an eventual option -audio or -xa1.
              Options -mode2, -xa, and -xa2 get mapped to -data, not using the desired CD sector formats and thus not taking advantage of eventual higher payload.  -xa1 Subsequent tracks  are  data  tracks
              with  input suitable for CD-ROM XA mode 2 form 1. This differs from -data input by 8 additional header bytes per block.  cdrskin will not write CD-ROM XA but rather strip the header bytes and
              write as -data tracks.

       dev=target
              Set the address of the drive to use. Valid are at least the addresses listed with options --devices or --device_links, X,Y,Z addresses listed with option -scanbus, ATA:X,Y,Z addresses  listed
              with options dev=ATA -scanbus, and volatile libburn drive numbers (numbering starts at "0").  Other device file addresses which lead to the same drive might work too.
              If no dev= is given, volatile address "dev=0" is assumed. That is the first drive found being available. Better avoid this ambiguity on systems with more than one drive.
              The special target "help" lists hints about available addressing formats.  Be aware that deprecated option --old_pseudo_scsi_adr may change the meaning of Bus,Target,Lun addresses.

       driveropts=opt
              Set  "driveropts=noburnfree"  to  disable  the drive's eventual protection mechanism against temporary lack of source data (i.e. buffer underrun).  A drive that announces no such capabilities
              will not get them enabled anyway, even if attempted explicitly via "driveropts=burnfree".

       -dummy Try to perform the drive operations without actually affecting the inserted media. There is no warranty that this will work with a particular combination of  drive,  media,  and  write  mode.
              Blanking is prevented reliably, though.  To avoid inadverted real burning, -dummy refuses burn runs on anything but CD-R[W], DVD-R[W], or emulated stdio-drives.

       -eject Eject the disc after work is done.

       -force Assume  that  the  user knows better in situations when cdrskin or libburn are insecure about drive or media state. This includes the attempt to blank media which are classified as unknown or
              unsuitable, and the attempt to use write modes which libburn believes they are not supported by the drive.
              Another application is to enforce blanking or re-formatting of media which appear to be in the desired blank or format state already.
              This option enables a burn run with option -dummy even if libburn believes that drive and media will not simulate the write mode but will write for real.
              It enables a burn run where cdrskin expects to exceed the available media capacity.
              Caution: Use this only when in urgent need.

       -format
              Same as blank=format_overwrite_full -force but restricted to DVD+RW.

       fs=size
              Set the fifo size to the given value. The value may have appended letters which multiply the preceding number:
              "k" or "K" = 1024 , "m" or "M" = 1024k , "g" or "G" = 1024m , "s" or "S" = 2048
              Set size to 0 in order to disable the fifo (default is "4m").
              The fifo buffers an eventual temporary surplus of track source data in order to provide the drive with a steady stream during times of temporary lack of track source supply.  The  larger  the
              fifo, the longer periods of poor source supply can be compensated.  But a large fifo needs substantial time to fill up if not curbed via option fifo_start_at=size.

       gracetime=seconds
              Set the grace time before starting to write. (Default is 0)

       -immed Equivalent to:
              modesty_on_drive=1:min_percent=75:max_percent=95
              The  name  of this cdrecord option stems from the "Immed" bit which can make some long running drive commands asynchronous and thus eases the load on some wiring hardware types. Regardless of
              option -immed, cdrskin uses asynchronous commands where possible and appropriate.

       index=list
              Set a comma separated list of index start address numbers for the next track.  This applies to CD SAO sessions only.
              The addresses count sectors from the start of the next track. The first number is for index 1 and must be 0. The following numbers have to be larger than their respective predecessors. Up  to
              99 numbers are allowed.
              Sector numbers are computed from Min:Sec:Frame addresses by
               Sector = ((Min*60)+Sec)*75+Frame
              E.g.: "0,7512,20408" sets index 2 to 01:40:12 and index 3 to 04:32:08.

       -inq   Print the identification of the drive and then exit.

       -isosize
              The  next  track  following  this  option  will try to obtain its source size from the header information out of the first few blocks of the source data.  If these blocks indicate an ISO-9660
              filesystem then its declared size will be used under the assumption that it is a single session filesystem.
              If not, then the burn run will be aborted.
              The range of -isosize is exactly one track. Further tracks may be preceded by further -isosize options, though. At least 15 blocks of padding will be added to  each  -isosize  track.  But  be
              advised to rather use padsize=300k.
              This  option  can be performed on track sources which are regular files or block devices. For the first track of the session it can be performed on any type of source if there is a fifo of at
              least 64 kiB. See option fs= .

       isrc=text
              Set the ISRC for the next track source to the given text, which must be exactly 13 characters long. It must comply to the format CCOOOYYSSSSS.
              CC is the country code. OOO is the owner code. Both may consist of capital letters A to Z and of decimal digits 0 to 9. YY depicts the year (00 to 99).  SSSSS is the serial number  (00000  to
              99999).
              This option does not affect CD-TEXT but only the Q sub-channel.

       -load  Load the media and exit. Exit value is 0 if any kind of media was found, non zero else. Note: Option -eject will unload the media even if -load is given.

       -lock  Like option -load but leave the drive's eject button disabled if there is any media found and not option -eject is given.
              Use  program  "eject" or cdrskin -eject to get the tray out of the drive.  Runs of programs like cdrecord, growisofs, wodim, cdrskin will not be hampered and normally enable the drive's eject
              button when they are done.

       mcn=text
              Set the CD Media Catalog Number to text, which must be exactly 13 characters long and should consist of decimal digits.
              This option does not affect CD-TEXT but only the Q sub-channel.

       minbuf=percentage
              Equivalent to:
              modesty_on_drive=1:min_percent=<percentage>:max_percent=95
              Percentage is permissible between 25 and 95.

       -minfo Print information about the loaded media. This includes media type, writability state, and a quite readable table of content.

       msifile=path
              Run option -msinfo and copy the result line into the file given by path.  Unlike -msinfo this option does not redirect all normal output away from standard output. But it may be combined with
              -msinfo to achieve this.
              Note: msifile=path is actually an option of wodim and not of cdrecord.

       -msinfo
              Retrieve  multi-session  info for preparing a follow-up session by option -C of programs mkisofs, genisoimage, or xorriso -as mkisofs.  Print result to standard output.  This option redirects
              to stderr all message output except the one of option --tell_media_space and its own result string, which consists of two numbers.  The result string shall be used as argument  of  option  -C
              with  said  programs.  It gives the start address of the most recent session and the predicted start address of the next session to be appended. The string is empty if the most recent session
              was not written with option -multi.
              To have a chance for working on overwriteable media, this option has to be accompanied by option --grow_overwriteable_iso.

       -multi This option keeps CD, unformatted DVD-R[W], DVD+R, or BD-R appendable after the current session has been written.  Without it the disc gets closed and may not be written any more  - unless it
              is a -RW and gets blanked which causes loss of its content.
              The  following sessions can only be written in -tao mode. -multi is prohibited with DVD-R[W] DAO write mode and on DVD-R DL media.  Option --prodvd_cli_compatible eventually makes -multi tol-
              erable but cannot make it work.
              In order to have all filesystem content accessible, the eventual ISO-9660 filesystem of a follow-up session needs to be prepared in a special way by the filesystem formatter program.  mkisofs
              and genisoimage expect particular info about the situation which can be retrieved by cdrskin option -msinfo.
              To  retrieve  an  archive  file which was written as follow-up session, you may use option -toc to learn about the "lba" of the desired track number.  This lba is the address of the 2048 byte
              block where the archive begins.
              With overwriteable DVD or BD media, -multi cannot mark the end of the session.  So when adding a new session this end has to be determined from the payload.  Currently only ISO-9660  filesys-
              tems can be used that way. See option --grow_overwriteable_iso for lifting the ban on -multi.
              Note: -multi might make DVD media unreadable in some DVD-ROM drives.

       -nocopy
              Create subsequent tracks with permission for a single level of copies.  I.e. those copies would then be marked by -scms as offering no permission for further copies.

       -nopad Do  not  add trailing zeros to the data stream. Nevertheless, since there seems to be no use for audio tracks with incomplete last sector, this option applies only to data tracks. There it is
              default.

       -nopreemp
              Indicate for subsequent tracks that they were mastered without pre-emphasis.

       -pad   Add 30 kiB of trailing zeros to each data track. (This is not sufficient to avoid problems with various CD-ROM read drivers.)

       padsize=size
              Add the given amount of trailing zeros to the next data track. This option gets reset to padsize=0 after that next track is written. It may be set again before the next track argument.  About
              size specifiers, see option fs=.

       -preemp
              Indicate for subsequent tracks that they were mastered with pre-emphasis.

       -sao   Write CD in Session At Once mode or sequential DVD-R[W] in Disc-at-once (DAO) mode.
              With CD this mode is able to put several audio tracks on media without producing audible gaps between them.
              With DVD-R[W] this mode can only write a single track.  No -multi is allowed with DVD-R[W] -sao.
              -sao is permissible with overwriteable DVD, or DVD+R[/DL], or BD but actually only imposes restrictions without providing known advantages.
              -sao  can  only  be  used  for  tracks  of  fixely  predicted  size.  This  implies  that  track  arguments which depict stdin or named pipes need to be preceded by option tsize= or by option
              tao_to_sao_tsize=.
              -sao cannot be used on appendable media.

       -scanbus
              Scan the system for drives. On Linux the drives at /dev/s* and at /dev/hd* are to be scanned by two separate runs. One without dev= for /dev/s* and one  with  dev=ATA  for  /dev/hd*  devices.
              (Option --drives lists all available drives in a single run.)
              Drives which are busy or which offer no rw-permission to the user of cdrskin are not listed. Busy drives get reported in form of warning messages.
              The useful fields in a result line are:
              Bus,Target,Lun Number) 'Vendor' 'Mode' 'Revision'

       -scms  Create  subsequent  tracks without permission for being copied. This is usually done for tracks which are copies of tracks that were marked with -nocopy (but not yet with -scms). So copies of
              copies are prohibited.
              This option gets reset by option -copy. Thus the combination -copy -nocopy means -nocopy surely without -scms.

       speed=number
              Set speed of drive. With data CD, 1x speed corresponds to a throughput of 150,000 bytes/second. With DVD, 1x = 1,385,000 bytes/second.  With BD 1x = 4,495,625  bytes/second.   It  is  not  an
              error to set a speed higher than is suitable for drive and media. One should stay within a realistic speed range, though.  Special speed settings are:
              0 = minimal speed , -1 = maximal speed (default), text "any" = like -1.

       -swab  Announce  that  the  raw audio data source of subsequent tracks is byte swapped versus the expectations of cdrecord. This option is suitable for audio where the least significant byte of a 16
              bit word is first (little-endian, Intel).  Most raw audio data on PC systems are available in this byte order.  Less guesswork is needed if track sources are in format MS-WAVE in a file  with
              suffix ".wav".

       -tao   Write  CD  in Track At Once (TAO) mode, sequential DVD-R[W] in Incremental Streaming mode, or DVD+R[/DL] without traditional -sao restrictions.  This mode also applies pro-forma to overwrite-
              able media
              Mode -tao can be used with track sources of unpredictable size, like standard input or named pipes. It is also the only mode that can be used for writing to  appendable  media  which  already
              hold data. With unformatted DVD-R[W] it is the only mode which allows -multi.
              Mode -tao is not usable for minimally blanked DVD-RW and for DVD-R DL.

       -text  Enable  writing  of  CD-TEXT attributes read by option cuefile=.  Without option -text, cue sheet file command CDTEXTFILE will be ignored and no CD-TEXT attributes will be read from the file.
              Nevertheless, CATALOG and ISRC will have the same effect as options mcn= and isrc=.

       textfile=path
              Read CD-TEXT packs from the file depicted by path and put them into the Lead-in of the emerging session. This session has to be done by Session At Once (SAO) mode and may only  contain  audio
              tracks.
              path  must lead to a regular file, which consists of an optional header of four bytes and one or more text packs of 18 bytes each. Suitable would be the file 'cdtext.dat' which gets extracted
              from CD media by options -vv -toc and shown in human readable form by -vvv -toc.
              The header, if present, must tell the file size minus 2, encoded as big-endian 16 bit word. The other two bytes must be 0.
              If there is no 4-byte header, then a trailing 0-byte, as of Sony specification, is tolerated and ignored.
              A text pack consists of a pack type byte, a track number byte, a counter byte, a Block Number and Character Indicator byte, 12 text characters or data  bytes,  two  optional  CRC  bytes.  For
              details see libburn documentation file doc/cdtext.txt.
              By default, the input file is checked for correct CRC bytes. If all CRC bytes are 0, then the correct values get silently inserted. If there are non-zero CRC bytes, then a mismatch causes the
              abort of the burn run.  This check can be disabled by option -force.
              Note that this option overrides option input_sheet_v07t= .

       -toc   Print the table of content (TOC) which describes the tracks recorded on disc.  The output contains all info from option -atip plus lines which begin with "track:", the track number, the  word
              "lba:" and a number which gives the start address of the track. Addresses are counted in CD sectors which with SAO or TAO data tracks hold 2048 bytes each.
              If verbosity is set to level 2 (-v -v) then the CD-TEXT packs from the lead-in of an audio CD get extracted and written into file 'cdtext.dat', if that file does not yet exist. Prepended is a
              4 byte header, followed by one or more packs of 18 bytes each.
              Verbosity level 3 causes the CD-TEXT packs to be printed as hex numbers to standard output. Bytes 4 to 15 of certain pack types are printed as ASCII characters if  they  have  values  in  the
              range of 32 to 126.
              See option textfile= for more information about the text pack format.

              Example. Retrieve an afio archive from track number 2:
                     tracknumber=2
                     lba=$(cdrskin dev=/dev/cdrom -toc 2>&1 | \
                     grep '^track:[ ]*[ 0-9][0-9]' | \
                     tail +"$tracknumber" | head -1 | \
                     awk '{ print $4}' )
                     dd if=/dev/cdrom bs=2048 skip="$lba" | \
                     afio -t - | less

       tsize=size
              Announces  the  exact  size  of the next track source. This is necessary with any write mode other than -tao if the track source is not a regular disk file, but e.g. "-" (standard input) or a
              named pipe.  About size specifiers, see option fs=.
              If the track source does not deliver the predicted amount of bytes, the remainder of the track is padded with zeros. This is not considered an error.  If on the other hand  the  track  source
              delivers more than the announced bytes then the track on media gets truncated to the predicted size and cdrskin exits with non-zero value.

       -v     Increment verbosity level by one. Startlevel is 0 with only few messages.  Level 1 prints progress report with long running operations and also causes some extra lines to be put out with info
              retrieval options.  Level 2 additionally reports about option settings derived from arguments or startup files. Level 3 is for debugging and useful mainly in conjunction with somebody who had
              a look into the program sourcecode.

       -V     Enable logging of SCSI commands to stderr. This allows expert examination of the interaction between libburn and the drive. The commands are specified in SCSI-3 standards SPC, SBC, MMC.

       -waiti Wait until input data is available at stdin or EOF occurs at stdin.  Only then begin to access any drives.
              One should use this if cdrskin is working at the end of a pipe where the feeder process reads from the drive before it starts writing its output into cdrskin. Example:
              mkisofs ... -C 0,12800 -M /dev/sr0 | \
              cdrskin dev=/dev/sr0 ... -waiti -
              This option works even if stdin is not among the track sources. If no process is piping in, then the Enter key of your terminal will act as trigger for cdrskin. Note that this input line will
              not be consumed by cdrskin if stdin is not among the track sources. It will end up as shell command, usually.

       Alphabetical list of options which are genuine to cdrskin and intended for normal use:

       --adjust_speed_to_drive
              Curb explicitly given speed= values to the maximum which is announced by the drive for the loaded media. By default, such an adjustment is only made with pseudo-speeds 0 and -1 whereas  speed
              settings > 0 are sent unchanged to the drive which will then choose an appropriate speed on its own.

       --allow_emulated_drives
              Enable drive addresses of the form dev=stdio:<path>. See above, paragraph "Drive preparation and addressing".

       --allow_setuid
              Disable  the  loud warning about insecure discrepance between login user and effective user which indicates application of chmod u+s to the program binary.  One should not do this chmod u+s ,
              but it is an old cdrecord tradition.

       --any_track
              Allow source_addresses to begin with "-" (plus further characters) or to contain a "=" character.  By default such arguments are seen as misspelled options. It is nevertheless not possible to
              use one of the options listed with --list_ignored_options.

       assert_write_lba=block_number|byte_address
              Abort if the write address given with this option is not the same as predicted immediately before the write session starts. This option can ensure that a start address which was presumed by a
              formatter like mkisofs -C is really used by the drive for writing.  assert_write_lba=0 effectively demands blank media and excludes appendables.
              Block numbering is peculiar: If the last character of the option string is a letter [a-zA-Z] then the usual unit scaling by "s", "k", "m", etc. applies and the result is divided by 2048. Else
              the number value of the string is taken as plain block number with block size 2048 byte.  (E.g ...=1000 or ...=1000s means block 1000, ...=1m means block 512, ...=4096b means block number 2)

       cd_start_tno=number
              Set  the number which shall be written as CD track number with the first track of the session. The following tracks will then get written with consecutive CD track numbers. The resulting num-
              ber of the last track must not exceed 99. The lowest possible start number is 1, which is also the default.
              This setting applies only to CD SAO writing. It overrides the track number settings caused by options cuefile= or input_sheet_v07t=.

       cdtext_to_textfile=path
              Extract the CD-TEXT packs from the lead-in of an audio CD and write them to the file with the given path. If CD-TEXT can be retrieved, then this file will be suitable for option textfile=.
              Not all drives can read CD-TEXT and not all audio CDs bear CD-TEXT.  It is not considered an error if no CD-TEXT is available.

       cdtext_to_v07t=path
              Extract the CD-TEXT packs from the lead-in of an audio CD and write them as human readable Sony Input Sheet Version 0.7T to the file with the given path. If CD-TEXT  can  be  retrieved,  then
              this file will be suitable for option input_sheet_v07t=.
              If the given path is "-", then the result is printed to standard output.
              Not all drives can read CD-TEXT and not all audio CDs bear CD-TEXT.  It is not considered an error if no CD-TEXT is available.

       --demand_a_drive
              Exit with a nonzero value if no drive can be found during a bus scan.

       --devices
              List  the  device  file  addresses of all accessible CD drives. In order to get listed, a drive has to offer rw-permission for the cdrskin user and it may not be busy. The superuser should be
              able to see all idle drives listed and busy drives reported as "SORRY" messages.
              Each available drive gets listed by a line containing the following fields:
              Number dev='Devicefile' rw-Permissions : 'Vendor' 'Model'
              Number and Devicefile can both be used with option dev=, but number is volatile (numbering changes if drives become busy).

       --device_links
              Like --devices, but presenting the drives with addresses of symbolic links which point to the actual device files.
              Modern GNU/Linux systems may shuffle drive addresses from boot to boot.  The udev daemon is supposed to create links which always point to the same drive, regardless of  its  system  address.
              Option --device_links shows the addresses of such links if they begin by "/dev/dvd" or "/dev/cd".  Precedence is: "dvdrw", "cdrw", "dvd", "cdrom", "cd".

       direct_write_amount=size
              Do  not  write  a  session  with  tracks  but rather make an appropriate number of direct write operations with no preparations. Flushing the drive buffer will be the only finalization. It is
              advised to eject the media afterwards because the write operations circumvent the usual system i/o with its caches and buffers. By ejecting, those invalid memory copies get surely discarded.
              Only few media can be written this way: DVD-RAM, BD-RE, RVD+RW and overwriteable DVD-RW. Writing is restricted to the already formatted area of the media.
              Writing starts at byte 0 of the media or at the address given by option write_start_address= .  Only the first track source is used as input for the write operations.  The fifo (fs=) is  dis-
              abled.
              Parameter  size controls the amount of data to be written. Size 0 means that the track source shall be used up until EOF. In this case, the last write transaction gets padded up to the neces-
              sary size by zeros. Size -1 revokes direct writing and switches back to normal session oriented writing.
              Both, write_start_address and direct_write_amount size must be aligned to a media dependend transaction size. With DVD-RAM, BD-RE, DVD+RW this is 2k, with overwriteable DVD-RW it is 32k.

       dvd_obs=default|32k|64k
              Set the number of bytes to be transmitted with each write operation to DVD or BD media. With most write types, tracks get padded up to the  next  multiple  of  this  write  size  (see  option
              --obs_pad).  A number of 64 KB may improve throughput with systems which show latency problems. The default depends on media type, option stream_recording=, and on compile time options.

       extract_audio_to=directory_path
              Extract  tracks  from  an audio CD as separate WAVE audio files into the given directory.  This directory has to already exist, but none of the track files may exist.  This option will rather
              fail than overwrite an existing file.
              By default all tracks of the CD are extracted to files with names trackNN.wav, where NN is the track number from 01 to at most 99.

       extract_basename=name
              Set a filename which shall be used by extract_audio_to= instead of the default name "track".

       --extract_dap
              Enable Digital Audio Play flaw obscuring mechanisms like audio data mute and interpolate.

       extract_tracks=number[,number[,...]]
              Set a list of track numbers to define which tracks shall be extracted by extract_audio_to=.  If no extract_tracks= is given, then all audio tracks get extracted.  It is  permissible  to  have
              more than one extract_tracks= option in order to split a long list into shorter pieces.
              The lowest permissible track number is 1, the highest is 99.

       fallback_program=command
              Set  a  command  name  to  be executed if cdrskin encounters a known cdrecord option which it does not yet support. If a non-empty command is given with fallback_program=, and if no essential
              options are given which are specific to cdrskin, then cdrskin will delegate the job to said command.
              The natural commands to be given are cdrecord or wodim but one may well submit the address of an own program.
              The fallback program will get all arguments of cdrskin which do not match the shell patterns --?* or *_*=* . This eventually suppresses path names of track sources which happen to match those
              patterns. The options from the startup files are not handed to the fallback program.
              Fallback program execution is disabled if cdrskin is run setuid and not option --allow_setuid is given. In general, the drive's device files and the involved programs should be set up so that
              each program runs under its advised conditions. (E.g. cdrskin as member of group floppy, cdrecord setuid root.)
              Two alias names for cdrskin are predefined with default fallback programs:
              unicord implies fallback_program=cdrecord
              codim implies fallback_program=wodim

       --four_channel
              Indicate for subsequent tracks that they were mastered with four channels.

       fifo_start_at=size
              Do not wait for full fifo but start burning as soon as the given number of bytes is read. This option may be helpful to bring the average throughput near to the maximum throughput of a drive.
              A large fs= and a small fifo_start_at= combine a quick burn start and a large savings buffer to compensate for temporary lack of source data. At the beginning of burning, the software protec-
              tion against buffer underun is as weak as the size of fifo_start_at= . So it is best if the drive offers hardware protection which is enabled automatically  if  not  driveropts=noburnfree  is
              given.

       --grow_overwriteable_iso
              Enable emulation of multi-session writing on overwriteable media which contain an ISO-9660 filesystem. This emulation is learned from growisofs -M but adapted to the usage model of
              cdrskin -msinfo
              mkisofs -C -M | cdrskin -waiti [-multi] -
              --grow_overwriteable_iso  does  not hamper the use of true multi-session media.  I.e. it is possible to use the same cdrskin options with both kinds of media and to achieve similar results if
              ISO-9660 filesystem images are to be written.  This option implies option -isosize and therefore demands that the track source is a ISO-9660 filesystem image.
              With overwriteable media and no option blank=fast|all present it expands an eventual ISO-9660 filesystem on media. It is assumed that this image's inner size description points to the end  of
              the  valuable data.  Overwriteable media with a recognizable ISO-9660 size will be regarded as appendable rather than as blank. I.e. options -msinfo and -toc will work.  -toc will always show
              a single session with its size increasing with every added mkisofs image.
              If not overridden by option write_start_address=, the track with the new image will be placed behind the end of the old one. One may use option assert_write_lba= to make sure that media state
              and mkisofs job do match.
              --grow_overwriteable_iso  causes option blank=fast|all to invalidate an eventual ISO-9660 image by altering the first few bytes of block 16 on overwriteable media.  Option -multi is tolerated
              in order not to hamper true multi-session media.
              An equivalent of growisofs -Z for overwriteable media is:
              mkisofs | cdrskin --grow_overwriteable_iso blank=fast [-multi] -
              With multi-session DVD, blank=fast will act like dvd+rw-format -blank=full .
              growisofs -dvd-compat is roughly equivalent to cdrskin without option -multi.

       input_sheet_v07t=path
              Read CD-TEXT definitions from a Sony Input Sheet version 0.7T. Up to eight or seven such sheets can be read by multiple input_sheet_v07t= options.   Each  will  define  one  CD-TEXT  language
              block.
              The first line of a sheet file decides whether more than one sheet may be defined by the file. If it is
                Input Sheet Version = 0.7T
              then each further line with that text switches to the next sheet for the next block.  If it is not, then all definitions apply to a single block.
              The information in such a sheet is given by text lines of the following form:
                purpose specifier [whitespace] = [whitespace] content text
              [whitespace] is zero or more ASCII 32 (space) or ASCII 9 (tab) characters.  The purpose specifier tells the meaning of the content text.  Empty content text does not cause a CD-TEXT attribute
              to be attached.
              The following purpose specifiers apply to the session as a whole:
                Purpose specifier   | Content example
                -------------------------------------------------------------
                Text Code           = 8859
                Language Code       = English
                Album Title         = Joyful Nights
                Artist Name         = United Cat Orchestra
                Songwriter          = Various Songwriters
                Composer            = Various Composers
                Arranger            = Tom Cat
                Album Message       = For all our fans
                Catalog Number      = 1234567890
                Genre Code          = Classical
                Genre Information   = Feline classic music
                Closed Information  = This is not to be shown by CD players
                UPC / EAN           = 1234567890123
                Text Data Copy Protection = OFF
                First Track Number  = 1
                Last Track Number   = 3
              The following purpose specifiers apply to particular tracks:
                Purpose specifier   | Content example
                -------------------------------------------------------------
                Track 01 Title      = Song of Joy
                Track 01 Artist     = Felix and The Purrs
                Track 01 Songwriter = Friedrich Schiller
                Track 01 Composer   = Ludwig van Beethoven
                Track 01 Arranger   = Tom Cat
                Track 01 Message    = Fritz and Louie once were punks
                ISRC 01             = XYCRR1101234
              Track numbers are decimal despite the leading 0. There should be as many track definitions as there are track source files given.
              See libburn's doc/cdtext.txt for a detailed definition of 0.7T and the possible values for Text Code, Language Code, Genre Code, Text Data Copy Protection.
              The Q sub-channel settings by "UPC / EAN" and "ISRC" may be overridden by options mcn= and isrc=.  This will not affect their appearance as CD-TEXT.  They may override cuefile= commands CATA-
              LOG and ISRC in the same way.
              If  options  -text cuefile= are given and if the cue sheet file defines CD-TEXT, then only seven input_sheet_v07t= options may be given. They will then be used as CD-TEXT language blocks 1 to
              7.
              This option will get into effect only if no option textfile= is given.  The write mode must be SAO on CD. All tracks must be -audio tracks.
              The track numbers may be overridden by option cd_start_tno=.

       --list_formats
              List the available format descriptors as reported by the drive for the loaded media. Each descriptor line begins with "Format idx" and the descriptor's list index, followed by a ":", the for-
              mat type, the number of payload blocks and that same number converted to MiB.
              The meaning of the format types is defined by the MMC standard with command FORMAT UNIT. A user will more be interested in the sizes than in the types.

       --list_ignored_options
              List  all  ignored cdrecord options. The "-" options cannot be used as addresses of track sources. No track source address may begin with a text equal to an option which ends by "=". The list
              is ended by an empty line.

       --list_speeds
              Put out a list of speed values as reported by the output drive with the loaded medium. This does not necessarily mean that the medium is writable or that these speeds are actually achievable.
              Especially the lists reported with empty drive or with ROM media obviously advertise speeds for other media.
              It is not mandatory to use speed values out of the listed range.  The drive is supposed to choose a safe speed that is as near to the desired speed as possible.
              At  the  end of the list, "Write speed L" and "Write speed H" are the best guesses for lower and upper speed limit.  "Write speed l" and "Write speed h" may appear only with CD and eventually
              override the list of other speed offers.
              Only if the drive reports contradicting speed information there will appear "Write speed 0" or "Write speed-1", which tell the outcome of speed selection by options speed=0 resp. speed=-1, if
              it deviates from "Write speed L" resp. "Write speed H".

       --long_toc
              Like option -toc but marking each session start by a line "first: X last: Y" and each session end by "track:lout ...".

       --no_load
              When  aquiring  the  optical  drive, do not try to load its tray. This yields the same behavior for desktop drives with tray loader as is shown by laptop drives which usually lack a motorized
              tray loader.

       --no_rc
              Only if used as first command line argument this option prevents reading and interpretation of eventual startup files. See section FILES below.

       --pacifier_with_newline
              Adds a newline character to each pacifier line that would elsewise be overwritten by the next pacifier line. Such lines are emitted during a run of writing, formatting, or blanking if  option
              -v is given.

       --prodvd_cli_compatible
              Activates behavior modifications with some DVD situations which bring cdrskin nearer to the behavior of cdrecord-ProDVD:
              Option -multi with unsuitable media is not an error but simply has no effect.
              Options blank=fast and blank=all deformat overwriteable DVD-RW media.
              Option blank=fast does indeed minmal blanking with DVD-RW. This may yield media which can only do DAO but not Incremental Streaming.

       --single_track
              Accept only the last argument of the command line as track source address.

       stdio_sync=on|off|number
              Set  the  number of bytes after which to force output to drives with prefix "stdio:". This forcing keeps the memory from being clogged with lots of pending data for slow devices. Default "on"
              is the same as "16m".  Forced output can be disabled by "off".

       stream_recording=on|off|number
              By setting "on" request that compliance to the desired speed setting is preferred over management of write errors. With DVD-RAM and BD this can bring effective write speed near to the nominal
              write speed of the media.  But it will also disable the automatic use of replacement blocks if write errors occur. It might as well be disliked or ignored by the drive.
              If a number is given, then error management stays enabled for all byte addresses below that number. Any number below 16s is the same as "off".

       tao_to_sao_tsize=size
              Set an exact fixed size for the next track to be in effect only if the track source cannot deliver a size prediction and no tsize= was specified and an exact track size prediction is demanded
              by the write mode.
              This was the fallback from bad old times when cdrskin was unable to burn in mode -tao . It came back with minimally blanked DVD-RW which allow  no  Incremental  Streaming  (-tao)  resp.  with
              explicitly selected write mode -sao for best DVD-ROM compatibility.
              If the track source delivers less bytes than announced then the missing ones will be filled with zeros.

       --tell_media_space
              Prepare  a  recording  session, do not perform it but rather inquire the maximum number of 2048 byte data blocks which may be written in the current state of media with the prepared setup. So
              this option disables recording of data. It does allow blanking, though, and will measure space afterwards.
              It is not mandatory to give track sources but their nature may influence the available capacity. So for most realistic results one may set up the full burn session and add --tell_media_space.
              But  if  one  has to expect a cdrskin version prior to 0.3.3 no track source should be given in order not to start an involuntary burn session.  In this case set at least -sao or -tao explic-
              itly.
              The result gets printed to standard output. It is 0 or empty if no writing is possible with the given options.  This option redirects to stderr all message output except its own result string
              and eventual output of -msinfo.

       textfile_to_v07t=path
              Read a CD-TEXT pack file (e.g. cdtext.dat from a run with -v -v -toc) and print its content in the human readable format that is described with option input_sheet_v07t=.
              The program run ends immediately thereafter.  No drive scan will happen and no drive will be aquired.
              To avoid the cdrskin start message in the output, run:
                cdrskin textfile_to_v07t=cdtext.dat | grep -v '^cdrskin'

       --two_channel
              Indicate for subsequent tracks that they were mastered with two channels.

       write_start_address=byte_offset
              Set  the  address  on media where to start writing the track. With DVD+RW, DVD-RAM or BD-RE byte_offset must be aligned to 2 kiB blocks, but better is 32 kiB.  With DVD-RW 32 kiB alignment is
              mandatory.
              Other media are not suitable for this option yet.

       Alphabetical list of options which are only intended for very special situations and not for  normal use:

       --abort_handler
              Establish default signal handling not to leave a drive in busy state but rather to shut it down and to wait until it has ended the final operations.  This option is only needed  for  revoking
              eventual --ignore_signals or --no_abort_handler.

       --allow_untested_media
              Enable the use of media profiles which have been implemented but not yet tested. Currently this option is without effect because no media types are under test reservation.
              (If you really test experimental media, then please report the outcome on libburn-hackers@pykix.org)

       --cdtext_dummy
              Prepare  a  burn run, report the effective array of CD-TEXT packs to stdout, and then end the program run without starting to burn the session.  A blank CD-R or CD-RW has to be present in the
              drive, nevertheless.
              The output is formatted in lines which describe 18 bytes as 2-digit hex numbers or as single printable characters.  See libburn document doc/cdtext.txt about the format of these records.

       --cdtext_verbose
              Like --cdtext_dummy but without preventing the burn run. Combinable with option -dummy to exercise a CD burn run with no persistent impact on the medium.

       dev_translation=<sep><from><sep><to>
              Set drive address alias. This was necessary before cdrskin-0.2.4 to manually translate cdrecord addresses into cdrskin addresses.
              <sep> is a single character which may not occur in the address string <from>. <from> is an address as expected to be given by the user via option dev=. <to> is the address to be used  instead
              whenever <from> is given.  More than one translation instruction can be given in one cdrskin run.
              E.g.: dev_translation=+ATA:1,0,0+/dev/sr1 dev_translation=+ATA:1,1,0+/dev/sr2

       --drive_abort_on_busy
              Linux specific: Abort process if a busy drive is encountered.

       --drive_blocking
              Linux specific: Try to wait for a busy drive to become free.  This is not guaranteed to work with all drivers. Some need nonblocking i/o.

       --drive_f_setlk
              Linux specific: Try to get exclusive lock on drive device file via fcntl(2).

       --drive_not_exclusive
              Linux specific: Combine --drive_not_f_setlk and --drive_not_o_excl.

       --drive_not_f_setlk
              Linux specific: Do not try to get exclusive lock on drive device file via fcntl(2).

       --drive_not_o_excl
              Linux specific: Do not ask the operating system to prevent opening busy drives.  Wether this leads to senseful behavior depends on operating system and kernel.

       drive_scsi_dev_family=sr|scd|sg
              Linux  specific: Select a SCSI device file family to be scanned for by options --devices, --device_links and -scanbus.  Normally this is /dev/sgN on kernel versions < 2.6 and /dev/srN on ker-
              nels >= 2.6 . This option allows to explicitly override that default in order to meet other programs at a common device file for each drive.  On kernel 2.4 families sr and scd  will  find  no
              drives.
              Device file family /dev/hdX on kernel >= 2.6 is not affected by this setting.

       --drive_scsi_exclusive
              Linux  specific:  Try to exclusively reserve device files /dev/srN, /dev/scdM, /dev/sgK of drives.  This would be helpful to protect against collisions with program growisofs.  Regrettably on
              Linux kernel 2.4 with ide-scsi emulation this seems not to work. Wether it becomes helpful with new Linux systems has to be evaluated.

       --fifo_disable
              Disable fifo despite any fs=.

       --fifo_per_track
              Use a separate fifo for each track.

       --fill_up_media
              Expand the last track of the session to occupy all remaining free space on the media.
              This option overrides option -multi. It will not fill up media if option -sao is given with CD media.
              Caution: With multi-session media this option might increase readatibility on DVD-ROM drives but with some DVD recorders and media types it might also fail to produce readable media  at  all.
              "Your mileage may vary".
              You can expect the best possible read compatibility if you do not use -multi at all.

       grab_drive_and_wait=seconds
              Open  the  addressed  drive,  wait the given number of seconds, release the drive, and do normal work as indicated by the other options used. This option helps to explore the program behavior
              when faced with busy drives. Just start a second cdrskin with option --devices while grab_drive_and_wait= is still active.

       --ignore_signals
              Try to ignore any signals rather than to abort the program. This is not a very good idea. You might end up waiting a very long time for cdrskin to finish.

       modesty_on_drive=<mode>[:min_percent=<num>][:max_percent=<num>]
              Mode 1 keeps the program from trying to write to the burner drive while its buffer is in danger to be filled by more than max_percent. If this filling is exceeded then the program  will  wait
              until the filling is at most min_percent.
              This  can  ease the load on operating system and drive controller and thus help with achieving better input bandwidth if disk and burner are not on independent controllers (like hda and hdb).
              Unsufficient input bandwidth is indicated by output "(fifo  xy%)" of option -v if xy is lower than 90 for some time.  modesty_on_drive= might hamper output bandwidth and cause  buffer  under-
              runs.
              To  have  max_percent  larger  than the burner's best actual buffer fill has the same effect as min_percent==max_percent. Some burners do not use their full buffer with all media types. Watch
              output "[buf xy%]" of option -v to get an impression of the actual buffer usage. Some burners are not suitable because they report buffer fill with granularity too large in size or time.
              Mode 0 disables this feature. Mode -1 keeps it unchanged. Default is:
              modesty_on_drive=0:min_percent=65:max_percent=95
              Percentages are permissible in the range of 25 to 100.

       --no_abort_handler
              On signals exit even if the drive is in busy state. This is not a very good idea. You might end up with a stuck drive that refuses to hand out the media.

       --no_blank_appendable
              Refuse to blank appendable CD-RW or DVD-RW. This is a feature that was once builtin with libburn. No information available for what use case it was needed.

       --no_convert_fs_adr
              Do only literal translations of dev=. This prevents cdrskin from test-opening device files in order to find one that matches the given dev= specifier.
              Partly Linux specific: Such opening is needed for Bus,Target,Lun addresses unless option --old_pseudo_scsi_adr is given. It is also needed to resolve  device  file  addresses  which  are  not
              listed with cdrskin --devices but nevertheless point to a usable drive. (Like /dev/sg0 using the same SCSI address as /dev/sr0.)

       --obs_pad
              Pad  the  data  of last write operation of a DVD-R[W] DAO session or stdio: pseudo-drive up to the full size of an output chunk.  This padding has to be applied automatically to the other DVD
              and BD media types, where it causes e.g. ISO images to have trailing unclaimed blocks.
              Use this option if there is the suspicion that DAO sessions abort with your kernel and/or DVD drive, if their size is not a multiple of 16 blocks.
              This option may also get enabled at compile time of libburn.

       --old_pseudo_scsi_adr
              Linux specific: Use and report literal Bus,Target,Lun addresses rather than real SCSI and pseudo ATA addresses. This method is outdated and was never compatible with original cdrecord.

       sao_postgap=off|number
              Define whether a post-gap shall be written at the end of the track and how many sectors this gap shall have. A post-gap occupies the range of an additional index of  the  track.  It  contains
              zeros. No bytes from the track source will be read for writing the post-gap.
              This setting affects only CD SAO write runs.

       sao_pregap=off|number
              Define  whether  a pre-gap shall be written before the track and how many sectors this pre-gap shall have. A pre-gap is written in the range of track index 0 and contains zeros resp. silence.
              No bytes from the track source will be read for writing the pre-gap.
              This setting affects only CD SAO write runs.
              The first track automatically gets a pre-gap of at least 150 sectors. Its size can only be enlarged by this call.

       --xa1-ignore
              Silently interpret option -xa1 as -data. This may be necessary if a frontent does not prepare -xa1 block headers but insists in using option -xa1.

EXAMPLES
   Get an overview of drives and their addresses:
       cdrskin -scanbus
       cdrskin dev=ATA -scanbus
       cdrskin --device_links

   Get info about a particular drive or loaded media:
       cdrskin dev=0,1,0 -checkdrive
       cdrskin dev=ATA:1,0,0 -v -atip
       cdrskin dev=/dev/hdc -minfo

   Prepare CD-RW or DVD-RW for re-use, DVD-RAM or BD-RE for first use:
       cdrskin -v dev=/dev/sg1 blank=as_needed -eject

   Format DVD-RW to avoid need for blanking before re-use:
       cdrskin -v dev=/dev/sr0 blank=format_overwrite

   De-format DVD-RW to make it capable of multi-session again:
       cdrskin -v dev=/dev/sr0 blank=deformat_sequential

   Write ISO-9660 filesystem image as only one to blank or formatted media:
       cdrskin -v dev=/dev/hdc speed=12 fs=8m \
         blank=as_needed -eject padsize=300k my_image.iso

   Write compressed afio archive on-the-fly (not possible with minimally blanked DVD-RW or DVD-R DL):
       find . | afio -oZ - | \
       cdrskin -v dev=0,1,0 fs=32m speed=8 \
         blank=as_needed padsize=300k -

   Write multi-session to the same CD, DVD-R[W], DVD+R[/DL], or BD-R:
       cdrskin dev=/dev/sr0 -v padsize=300k -multi 1.iso
       cdrskin dev=/dev/sr0 -v padsize=300k -multi 2.iso
       cdrskin dev=/dev/sr0 -v padsize=300k -multi 3.iso
       cdrskin dev=/dev/sr0 -v padsize=300k 4.iso

   Get multi-session info for option -C of program mkisofs:
       c_values=$(cdrskin dev=/dev/hdc -msinfo 2>/dev/null)
       mkisofs ... -C "$c_values" ...

   Inquire free space on media for a -multi run:
       x=$(cdrskin dev=/dev/sr0 -multi \
         --tell_media_space 2>/dev/null)
       echo "Available: $x blocks of 2048 data bytes"

   Write audio tracks and CD-TEXT to CD:
       cdrskin -v dev=ATA:1,0,0 speed=48 -sao \
         input_sheet_v07t=cdtext.v07t \
         track1.wav track2.au -audio -swab track3.raw

   Extract audio tracks and CD-TEXT from CD into directory /home/me/my_cd:
       mkdir /home/me/my_cd
       cdrskin -v dev=/dev/sr0 extract_audio_to=/home/me/my_cd \
         cdtext_to_v07t=/home/me/my_cd/cdtext.v07t

FILES
   Startup files:
       If not --no_rc is given as the first argument then cdrskin attempts on startup to read the arguments from the following files:

       /etc/default/cdrskin
       /etc/opt/cdrskin/rc
       /etc/cdrskin/cdrskin.conf
       $HOME/.cdrskinrc

       The files are read in the sequence given above, but none of them is required for cdrskin to function properly. Each readable line is treated as one single argument. No extra blanks.  A first charac-
       ter '#' marks a comment, empty lines are ignored.
       Example content of a startup file:
       # This is the default device
       dev=0,1,0
       # Some more options
       fifo_start_at=0
       fs=16m

   Disabling superuser safety precautions:
       The superuser is normally banned from using any other emulated drive but /dev/null. This ban can be lifted by the existence of file

       /root/cdrskin_permissions/allow_emulated_drives

       where the directory must be owned by the superuser and must not offer w-permissions for group or others.
       Warning: Superusers must take care not to spoil their hard disk via its raw block device (like stdio:/dev/hda or stdio:/dev/sd0).


SEE ALSO
       Formatting data track sources for cdrskin:
              mkisofs(8), genisoimage(8), xorriso(1), afio(1), star(1)

       Other CD/DVD/BD burn programs:
              cdrecord(1), wodim(1), xorriso(1)

       For DVD/BD burning (also tutor of libburn's DVD/BD capabilities):
              growisofs(1)

AUTHOR
       cdrskin was written by Thomas Schmitt <scdbackup@gmx.net>.

       This manual page was started by George Danchev <danchev@spnet.net> and is now maintained by Thomas Schmitt.




                                                                                         Version 1.3.4, Dec 12, 2013                                                                               CDRSKIN(1)
