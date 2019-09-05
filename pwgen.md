PWGEN(1)                                                      General Commands Manual                                                     PWGEN(1)

NAME
       pwgen - generate pronounceable passwords

SYNOPSIS
       pwgen [ OPTION ] [ pw_length ] [ num_pw ]

DESCRIPTION
       The  pwgen program generates passwords which are designed to be easily memorized by humans, while being as secure as possible.  Human-memo‐
       rable passwords are never going to be as secure as completely completely random passwords.  In particular,  passwords  generated  by  pwgen
       without  the -s option should not be used in places where the password could be attacked via an off-line brute-force attack.   On the other
       hand, completely randomly generated  passwords have a tendency to be written down, and are subject to being compromised in that fashion.

       The pwgen program is designed to be used both interactively, and in shell scripts.   Hence,  its  default  behavior  differs  depending  on
       whether the standard output is a tty device or a pipe to another program.  Used interactively, pwgen will display a screenful of passwords,
       allowing the user to pick a single password, and then quickly erase the screen.  This prevents someone from being able to  "shoulder  surf"
       the user's chosen password.

       When  standard  output  (stdout)  is  not  a tty, pwgen will only generate one password, as this tends to be much more convenient for shell
       scripts, and in order to be compatible with previous versions of this program.

OPTIONS
       -0, --no-numerals
              Don't include numbers in the generated passwords.

       -1     Print the generated passwords one per line.

       -A, --no-capitalize
              Don't bother to include any capital letters in the generated passwords.

       -a, --alt-phonics
              This option doesn't do anything special; it is present only for backwards compatibility.

       -B, --ambiguous
              Don't use characters that could be confused by the user when printed, such as 'l' and '1', or '0' or 'O'.  This reduces  the  number
              of  possible  passwords  significantly,  and  as such reduces the quality of the passwords.  It may be useful for users who have bad
              vision, but in general use of this option is not recommended.

       -c, --capitalize
              Include at least one capital letter in the password.  This is the default if the standard output is a tty device.

       -C     Print the generated passwords in columns.  This is the default if the standard output is a tty device.

       -N, --num-passwords=num
              Generate num passwords.  This defaults to a screenful if passwords are printed by columns, and one password otherwise.

       -n, --numerals
              Include at least one number in the password.  This is the default if the standard output is a tty device.

       -H, --sha1=/path/to/file[#seed]
              Will use the sha1's hash of given file and the optional seed to create password. It will allow you  to  compute  the  same  password
              later,  if  you  remember the file, seed, and pwgen's options used.  ie: pwgen -H ~/your_favorite.mp3#your@email.com gives a list of
              possibles passwords for your pop3 account, and you can ask this list again and again.

              WARNING: The passwords generated using this option are not very random.  If you use this option, make  sure  the  attacker  can  not
              obtain  a  copy  of  the  file.  Also, note that the name of the file may be easily available from the ~/.history or ~/.bash_history
              file.

       -h, --help
              Print a help message.

       -s, --secure
              Generate completely random, hard-to-memorize passwords.  These should only be used  for  machine  passwords,  since  otherwise  it's
              almost guaranteed that users will simply write the password on a piece of paper taped to the monitor...

       -v, --no-vowels
              Generate  random  passwords  that do not contain vowels or numbers that might be mistaken for vowels.  It provides less secure pass‐
              words to allow system administrators to not have to worry with random passwords accidentally contain offensive substrings.

       -y, --symbols
              Include at least one special character in the password.

AUTHOR
       This version of pwgen was written by Theodore Ts'o <tytso@alum.mit.edu>.  It is modelled after a program originally written by  Brandon  S.
       Allbery,  and then later extensively modified by Olaf Titz,  Jim Lynch, and others.  It was rewritten from scratch by Theodore Ts'o because
       the original program was somewhat of a hack, and thus hard to maintain, and because the licensing status of the program was unclear.

SEE ALSO
       passwd(1)

pwgen version 2.07                                                 October 2014                                                           PWGEN(1)
