Pamfunc User Manual(0)                                                                                                                                                                 Pamfunc User Manual(0)



NAME
       pamfunc - Apply a simple monadic arithmetic function to a Netpbm image


SYNOPSIS
       pamfunc  {  -multiplier=realnum  |  -divisor=realnum  |  -adder=integer  | -subtractor=integer | -min=wholenum | -max=wholenum -andmask=hexmask -ormask=hexmask -xormask=hexmask -not -shiftleft=count
       -shiftright=count [-changemaxval] } [filespec]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one.  You may separate an option name and its value with white space instead of an equals sign.


DESCRIPTION
       This program is part of Netpbm(1)

       pamfunc reads a Netpbm image as input and produces a Netpbm image as output, with the same format, maxval, and dimensions as the input.  pamfunc applies a simple transfer function to each sample  in
       the input to generate the corresponding sample in the output.  The options determine what function.

       pamarith  is  the  same  thing for binary functions -- it takes two images as input and applies a specified simple arithmetic function (e.g. addition) on pairs of samples from the two to produce the
       single output image.



   Values
       The functions fall into two categories: arithmetic (such as multiply by 5) and bit string (such as and with 01001000).  For the arithmetic functions, the function arguments and results are the frac-
       tion  that a sample is of the maxval, i.e. normal interpretation of PAM tuples.  But for the bit string functions, the value is the the bit string whose value as a binary cipher is the sample value,
       and the maxval indicates the width of the bit string.

       Arithmetic functions

       The arithmetic functions are those selected by the options -multiplier, -divisor, -adder, -subtractor, -min, and -max.

       As an example, consider an image with maxval 100 and a sample value of 10 and a function of 'multiply by 5.' The argument to the function is 10/100 (0.1) and the result is 5 * 0.1  =  0.5.   In  the
       simplest  case,  the maxval of the output is also 100, so the output sample value is 0.5 * 100 = 50.  As you can see, we could just talk about the sample values themselves instead of these fractions
       and get the same result (10 * 5 = 50), but we don't.

       Where it makes a practical difference whether we consider the values to be the fraction of the maxval or the sample value alone is where pamfunc uses a different maxval in the output image  than  it
       finds in the input image.  See -changemaxval.

       So remember in reading the descriptions below that the values are 0.1 and 0.5 in this example, not 10 and 50.  All arguments and results are in the range [0,1].

       Bit string functions

       The bit string functions are those selected by the options -andmask, -ormask, -xormask, -not, -shiftleft, and -shiftright.

       With  these  functions, the maxval has a very different meaning than in normal Netpbm images: it tells how wide (how many bits) the bit string is.  The maxval must be a full binary count (a power of
       two minus one, such as 0xff) and the number of ones in it is the width of the bit string.

       As an example, consider an image with maxval 15 and a sample value of 5 and a function of 'and with 0100'.  The argument to the function is 0101 and the result is 0100.

       In this example, it doesn't make any practical difference what we consider the width of the string to be, as long as it is at least 3.  If the maxval were 255, the result would  be  the  same.   But
       with  a  bit  shift  operation,  it  matters.   Consider shifting left by 2 bits.  In the example, where the input value is 0101, the result is 0100.  But if the maxval were 255, the result would be
       00010100.

       For a masking function, the mask value you specify must not have more significant bits than the width indicated by the maxval.

       For a shifting operation, the shift count you specify must not be greater than the width indicated by the maxval.



OPTIONS
       -multiplier=realnum

              This option makes the transfer function that of multiplying by
                   realnum.  realnum must be nonnegative.  If the result
                   is greater than one, it is clipped to one.

              Where the input is a PGM or PPM image, this has the effect of
                   dimming or brightening it.  For a different kind of brightening,
                   see ppmbrighten(1)
               and ppmflash(1)


              Also, see ppmdim(1) , which does the same
                   thing as pamfunc -multiplier on a PPM image with a multiplier
                   between zero and one, except it uses integer arithmetic, so it may be
                   faster.

              And ppmfade(1)
               can generate a whole
                   sequence of images of brightness declining to black or increasing to
                   white, if that's what you want.


       -divisor=realnum

              This option makes the transfer function that of dividing by
                   realnum.  realnum must be nonnegative.  If the result
                   is greater than one, it is clipped to one.

              This is the same function as you would get with -multiplier,
                   specifying the multiplicative inverse of realnum.


       -adder=integer

              This option makes the transfer function that of adding
                   integer/maxval.  If the result is greater than one, it is
                   clipped to one.  If it is less than zero, it is clipped to zero.

              Note that in mathematics, this entity is called an 'addend,'
                   and an 'adder' is a snake.  We use 'adder' because
                   it makes more sense.


       -subtractor=integer

              This option makes the transfer function that of subtracting
                   integer/maxval.  If the result is greater than one, it is
                   clipped to one.  If it is less than zero, it is clipped to zero.

              Note that in mathematics, this entity is called a
                   'subtrahend' rather than a 'subtractor.' We use
                   'subtractor' because it makes more sense.

              This is the same function as you would get with -adder,
                   specifying the negative of integer.


       -min=wholenum

              This option makes the transfer function that of taking the maximum of
                   the argument and wholenum/maxval.  I.e the minimum value in
                   the output will be wholenum/maxval.

                   If wholenum/maxval is greater than one, though, every value
                   in the output will be one.


       -max=wholenum

              This option makes the transfer function that of taking the minimum of
                   the argument and wholenum/maxval.  I.e the maximum value in
                   the output will be wholenum/maxval.

                   If wholenum/maxval is greater than one, the function is
                   idempotent -- the output is identical to the input.


       -andmask=hexmask

              This option makes the transfer function that of bitwise anding
                   with hexmask.

              hexmask is in hexadecimal.  Example: 0f

              This option was new in Netpbm 10.40 (September 2007).


       -ormask=hexmask

              This option makes the transfer function that of bitwise
                   inclusive oring with hexmask.

              This is analogous to -andmask.

              This option was new in Netpbm 10.40 (September 2007).


       -xormask=hexmask

              This option makes the transfer function that of bitwise
                   exclusive oring with hexmask.

              This is analogous to -andmask.

              This option was new in Netpbm 10.40 (September 2007).


       -not

              This option makes the transfer function that of bitwise logical
                   inversion (e.g. sample value 0xAA becomes 0x55).

              pnminvert does the same thing for a bilevel visual image
                   which has maxval 1 or is of PBM type.

              This option was new in Netpbm 10.40 (September 2007).


       -shiftleft=count

              This option makes the transfer function that of bitwise shifting
                   left by count bits.

              This option was new in Netpbm 10.40 (September 2007).


       -shiftright=count

              This option makes the transfer function that of bitwise shifting
                   right by count bits.

              This is analogous to -shiftleft.

              This option was new in Netpbm 10.40 (September 2007).


       -changemaxval

              This option tells pamfunc to use a different maxval in the output image than the maxval of the input image, if it helps.  By default, the maxval of the output is unchanged from the input  and
              pamfunc modifies the sample values as necessary to perform the operation.

              But  there  is  one  case where pamfunc can achieve the same result just by changing the maxval and leaving the sample values unchanged: dividing by a number 1 or greater, or multiplying by a
              number 1 or less.  For example, to halve all of the values, pamfunc can just double the maxval.

              With -changemaxval, pamfunc will do just that.

              As the Netpbm formats have a maximum maxval of 65535, for large divisors, pamfunc may not be able to use this method.

              An advantage of dividing by changing the maxval is that you don't lose precision.  The higher maxval means higher precision.  For example, consider an image with a maxval of  100  and  sample
              value  of  10.  You divide by 21 and then multiply by 21 again.  If pamfunc does this by changing the sample values while retaining maxval 100, the division will result in a sample value of 0
              and the multiplication will also result in zero.  But if pamfunc instead keeps the sample value 10 and changes the maxval, the division will result in a maxval of 2100 and the  multiplication
              will change it back to 100, and the round trip is idempotent.

              This option was new in Netpbm 10.65 (December 2013).





SEE ALSO
       ppmdim(1) , ppmbrighten(1) , pamdepth(1) , pamarith(1) , pamsummcol(1) , pamsumm(1) , ppmfade(1) , pnminvert(1) , pam(5) , pnm(5) ,


HISTORY
       This program was added to Netpbm in Release 10.3 (June 2002).



netpbm documentation                                                                            December 2013                                                                          Pamfunc User Manual(0)
