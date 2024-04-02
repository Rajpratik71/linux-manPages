SLOCK(1)                                                      General Commands Manual                                                     SLOCK(1)

NAME
       slock - simple X display locker

SYNOPSIS
       slock [-v | post_lock_command]

DESCRIPTION
       slock is a screen locker for X. If provided, the post_lock_command will be executed when the screen is locked.

OPTIONS
       -v     prints version information to stdout, then exits.

EXAMPLES
       $ slock /usr/sbin/s2ram

CUSTOMIZATION
       slock can be customized by creating a custom config.h and (re)compiling the source code. This keeps it fast, secure and simple.

AUTHORS
       See the LICENSE file for the authors.

LICENSE
       See the LICENSE file for the terms of redistribution.

BUGS
       Please report them.

                                                                     slock-1.3                                                            SLOCK(1)
