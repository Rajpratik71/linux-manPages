Ppmtogif User Manual(0)                                                                                                                                                               Ppmtogif User Manual(0)



       ppmtogif was replaced in Netpbm 10.37 (December 2006) by pamtogif(1)

       pamtogif is mostly backward compatible with ppmtogif.

       One  way pamtogif is not backward compatible with ppmtogif is that to specify a transparency (alpha) mask with ppmtogif, you supply the transparency as a separate pseudo-PGM image and use the -alpha
       option, whereas with pamtogif, you supply an input image that has the transparency integrated into it, and there is no -alpha option.

       ppmtogif still exists as a separate program for backward compatibility, but it runs pamtogif to do the essential work.  The compatibility ppmtogif interprets an -alpha option by reading  the  trans-
       parency  image and combining it with the input image, then feeding pamtogif the combined image it expects.  Other than that, the compatibility ppmtogif just passes input and options directly to pam-
       togif.

       You should not make any new use of ppmtogif and if you modify an existing use, you should upgrade to pamtogif.  But note that if you write a program that might have to be used with old Netpbm,  ppm-
       togif is the only way to do that.

       Unless you use the -alpha option, you can simply change the name of the program.  If you use -alpha, here is how to upgrade:

         $ ppmtogif -alpha=myalpha.pgm myinput.ppm >myoutput.gif

       becomes

         $ pamstack -tupletype=RGB_ALPHA myinput.ppm myalpha.pgm |  \
             pamtogif >myoutput.gif



Original Ppmtogif
       If you are using Netpbm before 10.37, pamtogif doesn't exist, so you use ppmtogif.  You can use the pamtogif manual for ppmtogif, with the following exceptions.

       The current documentation of pamtogif documents all versions of that program.  Use the information for Version 10.37 only.

       ppmtogif before Netpbm 10.31 does not accept PAM input at all.

       ppmtogif does not accept PAM input with transparency information in it.  Instead, ppmtogif has an -alpha option.

       The  syntax of the option is -alpha=pgmfile.  ppmtogif treats the contents of the named PGM file the same as pamtogif treats the alpha plane of a PAM.  The PGM image must have the same dimensions as
       the input file.  But unlike the PAM case, the alpha image need not have the same maxval as the input.  ppmtogif interprets the alpha file using the alpha file's maxval.

       You cannot specify both -transparent and -alpha.



netpbm documentation                                                                                                                                                                  Ppmtogif User Manual(0)
