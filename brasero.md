BRASERO(1)                                                                                 General Commands Manual                                                                                 BRASERO(1)



NAME
       brasero - Simple and easy to use CD/DVD burning application for the GNOME Desktop

SYNOPSIS
       brasero [options] [uri] [uri] ...

DESCRIPTION
       Brasero is an easy-to-use application for burning CD-R/Ws and DVD-R/Ws.  With Brasero you can create data, audio, or video CDs, DVDs, and SVCDs. You can copy existing disks, use image files, or cre‐
       ate new projects. Brasero includes tools such as a media previewer, integrity checker and a cover creator.

OPTIONS
       The following options are supported:

   Help Options:
       -h, --help
              Show help options

       --help-all
              Show all help options


   Application Options:
       -p, --project=PROJECT
              Open the specified project

       -l, --playlist=PLAYLIST
              Open the specified playlist as an audio project

       --device=DEVICE PATH
              Set the drive to be used for burning

       --image-file
              Create an image file instead of burning

       -a, --audio
              Open an audio project adding the URIs given on the command line

       -d, --data
              Open a data project adding the URIs given on the command line

       -c, --copy=PATH TO DEVICE
              Copy a disc

       -j, --cover=PATH TO COVER
              Cover to use

       -o, --video
              Open a video project adding the URIs given on the command line

       -i, --image=PATH TO IMAGE
              URI of an image file to burn (autodetected)

       -e, --empty
              Force Brasero to display the project selection page

       -b, --blank=PATH TO DEVICE
              Open the blank disc dialog

       -k, --check=PATH TO DEVICE
              Open the check disc dialog

       -n, --ncb
              Burn the contents of the burn:// URI

       --immediately
              Start burning immediately

       --no-existing-session
              Don't connect to an already-running instance

       -r, --burn-and-remove-project=PATH
              Burn the specified project and remove it (mainly useful for integration with other applications)

       -x, --transient-for
              The XID of the parent window

       --display=DISPLAY
              X display to use

   Debugging Options:
       --brasero-media-debug
              Display debug messages for Brasero media library

       -g, --brasero-burn-debug
              Display debug messages for Brasero burn library

BUGS
       Please report any brasero bugs you find to https://bugzilla.gnome.org.

AUTHOR
       Brasero´s manual page was written by Jeremy Bicha <jeremy@bicha.net>.



GNOME                                                                                             April 2011                                                                                       BRASERO(1)
