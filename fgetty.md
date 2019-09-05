FGETTY(8)                                                  System Administrator's Manual                                                 FGETTY(8)

NAME
       fgetty - a small getty for linux

SYNOPSIS
       fgetty tty [--noclear] [--long-hostname]

DESCRIPTION
       The command fgetty is normally invoked by init(8), opens a tty port, prompts for a login name and invokes the /bin/login command.

OPTIONS
       --noclear makes fgetty not clear the screen before displaying the login prompt.

       --long-hostname makes fgetty display the full hostname in the login prompt.

FILES
       /etc/issue       printed before the login prompt
       /etc/inittab     init(8) configuration file
       /var/run/utmp    the system status file

ISSUE ESCAPES
       The  issue-file  (/etc/issue  or  the file may contain certain escape codes to display the system name, date and time etc. All escape codes
       consist of a backslash (\) immediately followed by one of the letters explained below.

       d      the current date. (eg: 2002-01-19)

       s      the system name, the name of the operating system. (eg: Linux)

       l      the name of the current tty line. (eg: tty3)

       m      the architecture identifier of the machine (eg: i586)

       n      the nodename of the machine, also known as the hostname. (eg: sirius)

       o      the domainname of the machine. (eg: (none))

       r      the release number of the OS. (eg: 2.4.3-i)

       t      the current time. (eg: 14:51:51)

       u      the number of current users logged in. (eg: 4)

       U      the string "1 user" or "<n> users", where <n> is the number of current users logged in. (eg: 4 users)

       v      Insert the version of the OS. (eg: #2 Fre Jan 18 23:05:45 CET 2002)

ENVIRONMENT VARIABLES
       HOST    is set to your hostname
       TERM    is set to linux
       TTY     is set to the current tty line

RETURN VALUES
       1     could not chown/chmod tty device
       3     could not open tty device
       4     not a typewriter
       5     vhangup failed
       6     could not open tty (can't happen)
       7     dup failed
       8     could not exec login
       9     read returned an unexpected error
       10    unprintable character in login name
       11    login name too long (>40)

       13    user name started with a dash
       23    received SIGQUIT

AUTHOR
       Felix von Leitner <felix-fgetty@fefe.de>

       Homepage: http://www.fefe.de/fgetty/

fgetty                                                              2002-01-19                                                           FGETTY(8)
