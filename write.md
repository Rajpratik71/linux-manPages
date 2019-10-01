WRITE(1)                                                                                        User Commands                                                                                        WRITE(1)



NAME
       write - send a message to another user

SYNOPSIS
       write user [ttyname]

DESCRIPTION
       Write allows you to communicate with other users, by copying lines from your terminal to theirs.

       When you run the write command, the user you are writing to gets a message of the form:

              Message from yourname@yourhost on yourtty at hh:mm ...

       Any further lines you enter will be copied to the specified user's terminal.  If the other user wants to reply, they must run write as well.

       When you are done, type an end-of-file or interrupt character.  The other user will see the message EOF indicating that the conversation is over.

       You can prevent people (other than the super-user) from writing to you with the mesg(1) command.  Some commands, for example nroff(1) and pr(1), may disallow writing automatically, so that your out‐
       put isn't overwritten.

       If the user you want to write to is logged in on more than one terminal, you can specify which terminal to write to by specifying the terminal name as  the  second  operand  to  the  write  command.
       Alternatively,  you  can let write select one of the terminals - it will pick the one with the shortest idle time.  This is so that if the user is logged in at work and also dialed up from home, the
       message will go to the right place.

       The traditional protocol for writing to someone is that the string `-o', either at the end of a line or on a line by itself, means that it's the other person's turn to talk.  The string  `oo'  means
       that the person believes the conversation to be over.

SEE ALSO
       mesg(1), talk(1), who(1)

HISTORY
       A write command appeared in Version 6 AT&T UNIX.

AVAILABILITY
       The write command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        March 1995                                                                                         WRITE(1)
