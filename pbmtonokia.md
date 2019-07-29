Pbmtonokia User Manual(0)                                                                                                                                                           Pbmtonokia User Manual(0)



NAME
       pbmtonokia - convert a PBM image to Nokia Smart Messaging Formats


SYNOPSIS
       pbmtonokia [ -fmt
         {
           HEX_NOL,
           HEX_NGG,
           HEX_NPM,
           NOL,
           NGG,
           NPM
         } ] [-net networkcode] [-txt text] [pbmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pbmtonokia reads a PBM image as input and produces a Nokia Smart Messaging (hexcode, .ngg, .nol, .npm) file as output.


OPTIONS
       -fmt   Specifies the output format (default is HEX_NOL).



       HEX_NOL
              Nokia Operator Logo as (uploadable) hexcode.  Use option -net to specify network code.


       HEX_NGG
              Nokia Group Graphic as (uploadable) hexcode.


       HEX_NPM
              Nokia Picture Message as (uploadable) hexcode.  Use option -txt to specify an optional text message.


       NOL    Nokia Operator Logo as .nol format. This is editable by the Group-Graphic Editor from Kessler Wireless Design ( www.kessler-design.com ⟨http://www.kessler-design.com⟩ )


       NGG    Nokia Group Graphic as .ngg format. This is editable by the Group-Graphic Editor from Kessler Wireless Design ( www.kessler-design.com ⟨http://www.kessler-design.com⟩ )


       NPM    Nokia Picture Message as .npm format. This is editable by the Picture-Message Editor from Kessler Wireless Design ( www.kessler-design.com ⟨http://www.kessler-design.com⟩ )

              This option was new in Netpbm 10.36 (October 2006).




       -net   Specifies the 6 hex-digit operator network code for Operator Logos (Default is 62F210 = D1,Germany).


       -txt   Specifies the text message for Picture Messages.  The maximum size text message allowed by the format is 120 characters.

              Default is no text message.




LIMITATIONS
       This  program  currently accepts all PBM images with up to 255 rows or up to 255 columns.  (Valid Nokia Group Graphics or Operator Logos can be 72 columns by 14 rows and 78 columns by 21 rows; valid
       Nokia Picture Messages are 72 columns by 28 rows.)  This program generates black and white graphics, not animated.


SEE ALSO
       ·

              pbm(5) ,


       ·      Nokia Smart Messaging Specification ( http://forum.nokia.com ⟨http://forum.nokia.com⟩ )


       ·

               http://www.kessler-design.com/wireless/samples.html (1)



       ·

              Gnokii ⟨http://www.gnokii.org⟩




AUTHOR
       Copyright (C) 2001 Tim Ruehsen <tim.ruehsen@openmediasystem.de>.



netpbm documentation                                                                          14 September 2006                                                                     Pbmtonokia User Manual(0)
