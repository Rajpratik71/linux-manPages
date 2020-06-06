HALOG(1)                                                                                        User Commands                                                                                        HALOG(1)



NAME
       halog - HAProxy log statistics reporter

SYNOPSIS
       halog [-h|--help]
       halog [options] <LOGFILE

DESCRIPTION
       halog reads HAProxy log data from stdin and extracts and displays lines matching user-specified criteria.

OPTIONS
   Input filters (several filters may be combined)
       -H     Only match lines containing HTTP logs (ignore TCP)

       -E     Only match lines without any error (no 5xx status)

       -e     Only match lines with errors (status 5xx or negative)

       -rt|-RT <time>
              Only match response times larger|smaller than <time>

       -Q|-QS Only match queued requests (any queue|server queue)

       -tcn|-TCN <code>
              Only match requests with/without termination code <code>

       -hs|-HS <[min][:][max]>
              Only match requests with HTTP status codes within/not within min..max. Any of them may be omitted. Exact code is checked for if no ':' is specified.

   Modifiers
       -v     Invert the input filtering condition

       -q     Don't report errors/warnings

       -m <lines>
              Limit output to the first <lines> lines

   Output filters - only one may be used at a time
       -c     Only report the number of lines that would have been printed

       -pct   Output connect and response times percentiles

       -st    Output number of requests per HTTP status code

       -cc    Output number of requests per cookie code (2 chars)

       -tc    Output number of requests per termination code (2 chars)

       -srv   Output statistics per server (time, requests, errors)

       -u*    Output statistics per URL (time, requests, errors)
              Additional characters indicate the output sorting key:

              -u     URL

              -uc    Request count

              -ue    Error count

              -ua    Average response time

              -ut    Average total time

              -uao, -uto
                     Average times computed on valid ('OK') requests

              -uba   Average bytes returned

              -ubt   Total bytes returned

SEE ALSO
       haproxy(1)

AUTHOR
       halog was written by Willy Tarreau <w@1wt.eu> and is part of haproxy(1).

       This  manual page was written by Apollon Oikonomopoulos <apoikos@gmail.com> for the Debian project (but may be used by others).




halog                                                                                             July 2013                                                                                          HALOG(1)
