RTPR(8)                                                                                    System Manager's Manual                                                                                    RTPR(8)



NAME
       rtpr - replace backslashes with newlines.


DESCRIPTION
       rtpr is a trivial bash script which converts backslashes in standard input to newlines. It's sole purpose is to be fed with input from ip when executed with it's --oneline flag.


EXAMPLES
       ip --onenline address show | rtpr
              Undo oneline converted ip-address output.


SEE ALSO
       ip(8)


AUTHORS
       Stephen Hemminger <shemming@brocade.com>



                                                                                              18 September, 2015                                                                                      RTPR(8)
