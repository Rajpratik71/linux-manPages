yppasswd(1)                                                                                General Commands Manual                                                                                yppasswd(1)



NAME
       yppasswd, ypchfn, ypchsh - change your password in the NIS database

SYNOPSIS
       yppasswd [-f] [-l] [-p] [user]
       ypchfn [user]
       ypchsh [user]

DESCRIPTION
       In the old days, the standard passwd(1), chfn(1) and chsh(1) tools could not be used under Linux to change the users NIS password, shell and GECOS information. For changing the NIS information, they
       were replaced by their NIS counterparts, yppasswd, ypchfn and ypchsh.

       Today, this versions are deprecated and should not be used any longer.

       Using the command line switches, you can choose whether to update your password -p, your login shell -l, or your GECOS field -f, or a combination of them.  yppasswd implies  the  -p  option,  if  no
       other option is given. If you use the -f or -l option, you also need to add the -p flag.  ypchfn implies the -f option, and ypchsh -l.

       When invoked without the user argument, the account information for the invoking user will be updated, otherwise that of user will be updated. This option is only available to the super-user. If the
       yppasswdd daemon on the server supports it, you can give the root password of the server instead of the users [old] password.

       All tools will first prompt the user for the current NIS password needed for authentication with the yppasswdd(8) daemon. Subsequently, the program prompts for the updated information:

       yppasswd or -p
              Change the user's NIS password.    The user is prompted for the new password.  While typing the password, echoing is turned off, so the password does not appear on the screen. An empty  pass-
              word is rejected, as are passwords shorter than six characters. The user will then be requested to retype the password to make sure it wasn't    misspelled the first time.

       ypchsh or -l
              Change the user's login shell. The user is prompted for a new shell, offering the old one as default:

                Login shell [/bin/sh]: _

              To accept the default, simply press return. To clear the shell field in your passwd(5) file entry (so that the system's default shell is selected), enter the string none.

       ypchfn or -f
              Change the user's full name and related information. Traditionally, some applications expect the GECOS field (field 4) of the passwd(5) file to contain the user's real name (as opposed to the
              login name) plus some additional information like the office phone number. This information is displayed by finger(1) and probably some other tools, too.

              When setting the full name, ypchfn displays the following prompts, with the defaults in brackets:

                Name [Joe Doe]:
                Location [2nd floor, bldg 34]:
                Office Phone [12345]:
                Home Phone []:

              To accept a default, simply press return. To clear a field, enter the string none.

SEE ALSO
       chfn(1), chsh(1), finger(1), passwd(5), passwd(1), ypcat(1), yppasswdd(8), ypserv(8), ypwhich(1)

AUTHOR
       yppasswd is part of the yp-tools package, which was written by Thorsten Kukuk <kukuk@linux-nis.org>.



YP Tools 2.14                                                                                     April 2010                                                                                      yppasswd(1)
