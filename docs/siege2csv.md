BOMBARDMENT(1)                                                       siege2csv                                                      BOMBARDMENT(1)

NAME
       bombardment - Run siege with an ever-increasing number of users

   SYNOPSIS
       bombardment [urlfile] [clients] [increment] [trials] [delay] bombardment urls.txt 5 10 20 1

DESCRIPTION
       bombardment is part of the siege distribution. It calls siege with an initial number of clients. When that run finishes, it immediately
       calls siege again with that number of clients plus the increment.  It does this the number of times specified in the fourth argument.

OPTIONS
       urlfile
           The name of the file containing one or more URLs for siege to test.

       clients
           The initial number of clients to be used on the first run.

       increment
           The number of clients to add to each ensuing run.

       trials
           The number of times to run siege.

       delay
           The is the amount of time, in seconds, that each client will wait
           between requests.  The siege default is overridden by bombardment

SEE ALSO
       siege(1), siege2csv(1)

AUTHOR
       Written by Peter Hutnick, et al.

JoeDog                                                              2016-05-20                                                      BOMBARDMENT(1)
