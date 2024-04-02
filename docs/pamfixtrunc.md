Pamfixtrunc User Manual(0)                                                                                                                                                         Pamfixtrunc User Manual(0)



       pamfixtrunc was replaced in Netpbm 10.66 (March 2014) by pamfix(1)

       pamfix with a -truncate option is the same thing as pamfixtrunc.  But pamfix has other options to repair other kinds of corruption.

       Another  change that came with Netpbm 10.66 is that an invalid sample value (a value greater than the maxval the image declares in its header) is considered by the common Netpbm image reading facil-
       ity (in libnetpbm) to be unreadable, which means the file is essentially truncated.  In older Netpbm, the invalid sample value propagates to the output in a program such as  pamfixtrunc.   Thus,  in
       older  Netpbm  a  file  with 100 rows and an invalid sample value in the 3rd row would pass through pamfixtrunc unchanged.  But in Netpbm 10.66, pamfix -truncate with the same input would produce an
       output image with only 2 rows.  While it is not possible in 10.66 to cause pamfix to generate an invalid Netpbm image, you can use -clip and -changemaxval options to avoid truncating the file  in  a
       case like this.

       You  should  not  make any new use of pamfixtrunc and if you modify an existing use, you should upgrade to pamfixtrunc.  But note that if you write a program that might have to be used with very old
       Netpbm, pamfixtrunc is the only way to do that.



netpbm documentation                                                                                                                                                               Pamfixtrunc User Manual(0)
