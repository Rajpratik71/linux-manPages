Pnmflip User Manual(0)                                                                                                                                                                 Pnmflip User Manual(0)



       pnmflip was replaced in Netpbm 10.13 (December 2002) by pamflip(1)

       pamflip is mostly backward compatible with pnmflip, but works on PAM images too.

       One  way pamflip is not backward compatible with pnmflip is that pnmflip lets you specify any number of basic flip options, whereas pamflip requires exactly one.  (pamflip provides the -xform option
       for requesting multiple transformations, though).  Because of this incompatibility, pnmflip still exists as a separate program, and all it does is translate its options to pamflip style and run pam-
       flip.

       You  should  not  make any new use of pnmflip and if you modify an existing use, you should upgrade to pamflip.  But note that if you write a program that might have to be used with very old Netpbm,
       pnmflip is the only way to do that.



netpbm documentation                                                                                                                                                                   Pnmflip User Manual(0)
