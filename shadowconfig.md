SHADOWCONFIG(8)                                               SHADOWCONFIG(8)

NAME
       shadowconfig - toggle shadow passwords on and off

SYNOPSIS
       shadowconfig on | off

DESCRIPTION
       shadowconfig  on  will turn shadow passwords on; shadowconfig off will
       turn shadow passwords off. shadowconfig will print  an  error  message
       and  exit  with a nonzero code if it finds anything awry. If that hap‐
       pens, you should correct the error and run it  again.  Turning  shadow
       passwords  on  when  they are already on, or off when they are already
       off, is harmless.

       Read /usr/share/doc/passwd/README.Debian for a brief  introduction  to
       shadow passwords and related features.

       Note  that  turning  shadow  passwords  off and on again will lose all
       password aging information.

                                 19 Apr 1997                  SHADOWCONFIG(8)
