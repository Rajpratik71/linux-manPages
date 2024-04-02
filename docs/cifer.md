CIFER(1)                                                      General Commands Manual                                                     CIFER(1)

NAME
       cifer - multipurpose classical cryptanalysis and code‐breaking tool

SYNOPSIS
       cifer [-finqs] [command]

DESCRIPTION
       Cifer  provides  many  functions  designed  to  aid in cracking classical ciphers; a group of ciphers used historically, but which have now
       fallen into disuse because of their suceptability to ciphertext‐only attacks. In general, they were designed and implemented by  hand,  and
       operate on an alphabet of letters (such as [A‐Z]).

       Cifer  is  implemented  as an interactive shell, with support for scripting.  All of its commands are documented via the usage command. For
       instance, type usage load_dict for information on the load_dict command.

   Buffers and Filters
       The shell uses the concept of a buffer to store a string of text, which most comands read from as input, and write to as output. Unless run
       with  the -n option, cifer will automatically create 10 buffers at startup.  Buffers are referred to in the form, buffer_#, where # is sub‐
       stituted with the buffer's index number. For more information on buffers, see the usage for: buffers, resize,  clear,  copy,  load,  write,
       read, bufferinfo, and nullbuffer.

       Filters  can  be  used to manipulate the set of characters in a buffer, for example making all characters uppercase, or removing all white‐
       space. For more information on filters, see the usage of filter.

   Dictionaries
       Some of cifer's functions require a specially formatted 'dictionary', which  takes  the  basic  form  of  a  list  of  words.  The  utility
       cifer-dict(1) can be used to create these dictionaries. The loaddict command is used to load a dictionary for use.

   Frequency Analysis
       Frequency  analysis is the study of the frequency of symbols, or groups of symbols in a ciphertext. It aids in cracking monoalphabetic sub‐
       stition schemes.  Frequency analysis works upon the principle that, in any given sample of written language, certain characters and  groups
       of  characters  will occur more often than others. Furthermore, the distribution of those frequencies will be roughly the same for all sam‐
       ples of that written language. For instance, in any section of English language, the character 'E' appears far more often than 'X'.   Like‐
       wise,  the  pair  of letters 'TH' is very common, whilst 'XY' is very rare. In monoalphabetic substitution schemes, these patterns are pre‐
       served and it is possible to determine certain mapppings of letters from ciphertext‐>plaintext from the frequencies alone. As more and more
       characters are converted, it becomes easy to guess the remaining ones to form words in the target language.

       Perhaps  the  most  tedious  part  of this method is the actual counting of the symbols themselves. Thus, Cifer provides functions to count
       characters, digrams (pairs of characters), and trigrams (triplets of characters). It can  also  use  frequency  analyis  to  guess  cipher‐
       text‐>plaintext  mappings  for  the English language. For more information, see the usage for: frequency_guesses, identity_frequency_graph,
       frequency_analysis, count_digrams, and count_trigrams.

   Affine Ciphers
       An affine cipher is a type of monoalphabetic substitution cipher. In order to implement an affine cipher, one would assign  each  character
       of  the  chosen alphabet a number, for example, a = 0; b = 1; c = 2; etc. Then for each letter of the plaintext, put it through the encryp‐
       tion function:

       e(x) = (ax + b) (mod m)

       Where x is the plaintext character's assigned number, a and m are coprime and m is the size of the alphabet. The ciphertext  character  for
       this plaintext character is the character assigned to the number e(x).

       Cifer  provides  functions  to  both  encrypt  and decrypt affine ciphers as well as crack affine ciphers using frequency analysis or brute
       force. Note that cifer is currently only able to deal with affine ciphers where m = 26.  For more information, see the usage  for:  affine‐
       solve, affinebf, affineencode, affinedecode, and mmi.

   Vigenere Ciphers
       The  Vigenere cipher is a form of polyalphabetic substitution consisting of several Caesar ciphers in sequence with differing shift values,
       which vary according to a repeating keyword. Cifer provides the function vigenere_crack, which employs a  brute‐force  (for  each  possible
       keyword length) frequency analysis method in order to find the keyword, and crack the cipher.

   Keyword Ciphers
       A keyword cipher is a type of monoalphabetic substitution in which the mapping of plaintext characters to ciphertext characters is affected
       by the inclusion of a 'keyword'. Cifer provides the function keyword_bruteforce which attempts to find the correct keyword by going through
       a  'dictionary'  of possible words and trying each one in turn, then selecting the best solution by matching words in the solution to those
       in the dictionary. If the keyword to a ciphertext is already known, it can be decoded using the keyword_decode command.

   Bacon Ciphers
       A bacon cipher is a method of stenography, in which a message is concealed in the presentation  of  text,  rather  than  its  content.  The
       ciphertext  consists  of  any  message  (again, the language has no impact on the concealed plaintext) in which each character can be cate‐
       gorised into one of two distinct groups, we call these 'A' and 'B'. This distinction may be made in any number of predetermined ways,  such
       as  two typefaces, or other indicators. In order to decode the cipher one replaces groups of 5 As and Bs with their corresponding plaintext
       character, as dictated by the Baconian alphabet (however, be aware that it would be trivial for the two  communicating  parties  to  create
       their own 'custom' version of the Baconian alphabet). To encode a plaintext, the reverse operation is performed.

       A  Bacon  cipher  can be easily encoded/decoded, and cifer provides the functions bacon_encode and bacon_decode to achieve this. They use a
       buffer of As and Bs as input and output, and thus any ciphertext that needs to be decoded must first be turned into As and Bs.  Before  the
       plaintext  is  loaded,  it should be modified so that upper and lower case characters belong to the A and B groups, respectively. Then, the
       casebacon filter can be applied to convert the upper and lower case characters in the buffer to As and Bs. There is also  a  bacon  filter,
       which removes all characters which are not 'A' or 'B'.

   Rail Fence Ciphers
       The  rail fence cipher is a form of transposition cipher, which gets its name from the way the plaintext is written alternatively downwards
       and upwards diagonally on 'rails', before being read off as the ciphertext in rows.

       Cifer provides the function rfbf to crack rail fence ciphers using a brute force method and checking for solutions using a dictionary.

   Columnar Transposition
       Columnar transposition is a relatively complex form of cipher, with many variants. The basic process of encoding using this method involves
       first  writing the plaintext out in a table defined by its width (which is also the length of the keyword). Then, depending on the variant,
       the ciphertext is written and read out of the table in any number of different ways.

       The keyword can be specified in numeric or alphabetic form. In the former, each digit must only be used once and there must be enough  dig‐
       its  to  form a full key (ie. for a key length 4, all the digits [0,1,2,3] must be used). An alphabetic keyword, such as 'apple', first has
       duplicate letters removed. This gives us 'aple'. If you were encrypting by hand, you would write out 'aple' at the top of your  table,  and
       them move the columns around until the keyword is in alphabetic order, ie. 'aelp'.

       In  order  to  decrypt  a  ciphertext,  we first 'flip' the keyword, turning 'aelp' into 'plea'. We can then use this keyword as if we were
       encrypting, and the process will reverse the original function to give us the plaintext.

       Cifer's keyword functions provide utilities to automate many variants.  There are nine commands:  c2c_encode,  c2c_decode,  c2c_bruteforce,
       r2c_encode, r2c_decode, r2c_bruteforce, c2r_encode, c2r_decode and c2r_bruteforce.

       The  first  three  letters of each command are short for: 'column to column', ´column to row' and 'row to column'; these refer to different
       ways in which the ciphertext can be read off the table. In c2c, the table is written from left to right, re‐ordered and read  off  left  to
       right again. In r2c, the table is written from top to bottom, re‐ordered and then read off from left to right. Finally, in c2r the table is
       written left to right, re‐ordered and read off from top to bottom.

       ´Encode' and 'decode' mode both take a keyword and work as one would expect.   In  'bruteforce'  mode,  cifer  tries  all  permutations  of
       increasing key lengths in an attempt to find the real keyword. It tests possible solutions by matching words in the dictionary.

OPTIONS
       -n     Disable auto-init.

       -f     Execute the commands in the (script) file specified, then exit

       -i     Execute the script file and then go to interactive mode

       -q     Do not fully parse file before execution

       -s     Exit on soft-fails, not just hard-fails (for script execution)

       Any  text found after the options will be interpreted as a command to the shell; Please note that you cannot specify a command if either -i
       or -f are used, and that -q and -s only apply to -f or -i.

BUGS
       Please report any bugs by sending email to either Simrun Basuita  <simrunbasuita@googlemail.com>  or  Daniel  Richman  <danieljonathanrich‐
       man@googlemail.com>.

AUTHORS
       Daniel Richman <danieljonathanrichman@googlemail.com>, Simrun Basuita <simrunbasuita@googlemail.com>

COPYRIGHT
       This manual page is Copyright 2008 Simrun Basuita and Daniel Richman.

       This  manual  page  was written by Simrun Basuita <simrunbasuita@googlemail.com> and Daniel Richman <danieljonathanrichman@googlemail.com>.
       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 3  or  any
       later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

SEE ALSO
       cifer-dict(1)

                                                                                                                                          CIFER(1)
