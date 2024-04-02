SLOWHTTPTEST(1)                                             BSD General Commands Manual                                            SLOWHTTPTEST(1)

NAME
     slowhttptest — Denial Of Service attacks simulator

SYNOPSIS
     slowhttptest [-H|B|R|X] [-g] [-a range start] [-b range limit] [-c number of connections]
                  [-d all traffic directed through HTTP proxy at host:port] [-e probe traffic directed through HTTP proxy at host:port]
                  [-f value of Content-type header] [-i interval in seconds] [-k request multiply factor] [-l test duration in seconds]
                  [-m value of Accept header] [-n slow read interval in seconds] [-o output file path and/or name]
                  [-p timeout for probe connection in seconds] [-r connection per second] [-s value of Content-Length header] [-t HTTP verb]
                  [-u absolute URL] [-v output verbosity level] [-w advertised window size range start] [-x max length of follow up data]
                  [-y advertised window size range end] [-z slow read from receive buffer in bytes]

DESCRIPTION
     The slowhttptest implements most common low-bandwidth Application Layer DoS attacks and produces CSV and HTML files with test statistics.

     Currently supported attacks are:

           ·   Slowloris
           ·   Slow HTTP POST
           ·   Apache Range Header
           ·   Slow Read

     The options are as follows:

     -g      Forces slowhttptest to generate CSV and HTML files when test finishes with timestamp in filename.

     -H      Starts slowhttptest in SlowLoris mode, sending unfinished HTTP requests.

     -B      Starts slowhttptest in Slow POST mode, sending unfinished HTTP message bodies.

     -R      Starts slowhttptest in Range Header mode, sending malicious Range Request header data.

     -X      Starts slowhttptest in Slow Read mode, reading HTTP responses slowly.

     -a start
             Sets the start value of range-specifier for Range Header attack.

     -b bytes
             Sets the limit value of range-specifier for Range Header attack.

     -c number of connections
             Specifies the target number of connections to establish during the test.

     -d HTTP proxy host:port
             Specifies HTTP proxy server to connect to for all connections.

     -e HTTP proxy host:port
             Specifies HTTP proxy server to connect to for probe connections.

     -f content-type
             Specifies the value of Content-Type header.

     -i seconds
             Specifies the interval between follow up data for slowrois and Slow POST tests.

     -k pipeline factor
             Specifies number of times the resource would be requested per socket in Slow Read test.

     -l seconds
             Specifies test duration in seconds.

     -m accept
             Specifies the value of Accept header.

     -n seconds
             Specifies the interval between read operations for Slow Read test.

     -o file name
             Specifies custom file name, effective with -g.

     -p seconds
             Specifies the interval to wait for HTTP response on probe connection, before marking the server as DoSed.

     -r connections per second
             Specifies the connection rate.

     -s bytes
             Specifies the value of Content-Length header for Slow POST test.

     -t HTTP verb
             Specifies the verb to use in HTTP request.

     -u URL  Specifies the URL.

     -v level
             Specifies the verbosity level of logging.

     -w bytes
             Specifies the start of the range the TCP advertised window size would be picked from in Slow Read test.

     -x bytes
             Specifies the maximum length of follow up data for slowloris and Slow POST tests.

     -y bytes
             Specifies the end of the range the TCP advertised window size would be picked from in Slow Read test.

     -z bytes
             Specifies the number of bytes to read from receive buffer with each read() operation.

EXAMPLES
     Start a slowloris test of host.example.com with 1000 connections, statistics goes into my_header_stats, interval between follow up headers is
     10 seconds and connection rate is 200 connections per second:

           $ slowhttptest -c 1000 -H -g -o my_header_stats -i 10 -r 200 -t GET -u https://host.example.com/index.html -x 24 -p 3

     Start slow POST test of host.example.com with 3000 connections, statistics goes into my_body_stats, interval between follow up headers is 110
     seconds, connection rate is 200 connections per second, Content-Length header value is 8192, maximum length of follow up data is random value
     limited by 10 bytes and probe connections waits 3 seconds for HTTP response before marking server as DoSed:

           $ slowhttptest -c 3000 -B -g -o my_body_stats -i 110 -r 200 -s 8192 -t FAKEVERB -u http://host.example.com/loginform.html -x 10 -p 3

     Start Range Header test of host.example.com with 1000 connections, use HEAD verb, and generate HTTP header Range:0-, x-1, x-2, x-3, ... x-y,
     where x is 10 and y is 3000, connection rate is 500: interval between follow up headers is 10 seconds and connection rate is 200 connections
     per second:

           $ slowhttptest -R -u http://host.example.com/ -t HEAD -c 1000 -a 10 -b 3000 -r 500

     Start Slow Read test of host.example.com with 8000 connections, no statistics is generated, connection rate is 200 connections per second,
     TCP advertised window size is a random value between 512 and 1024, slowhttptest reads 32 bytes from each connections every 5 seconds, 3
     requests are pipelined per each connections, probe connection waits 3 seconds for HTTP response before marking server as DoSed:

           $ slowhttptest -c 8000 -X -r 200 -w 512 -y 1024 -n 5 -z 32 -k 3 -u https://host.example.com/resources/index.html -p 3

     Start Slow Read test of host.example.com through HTTP proxy server at 10.10.0.1:8080 with 8000 connections, no statistics is generated, the
     rest test values are default.  slowhttptest most likely would test HTTP proxy server itself, rather than target server, but it all depends on
     the HTTP proxy server implementation:

           $ slowhttptest -d 10.10.0.1:8080 -c 8000 -X -u https://host.example.com/resources/index.html

     Start Slow Read test of host.example.com and direct probe traffic through HTTP proxy server at 10.10.0.1:8080 with 8000 connections, no sta‐
     tistics is generated, the rest test values are default.  Specifying another connection channel for probe connections helps to make sure that
     slowhttptest shows valid statistics for availability of server under test:

           $ slowhttptest -e 10.10.0.1:8080 -c 8000 -X -u https://host.example.com/resources/index.html

AUTHOR
     Sergey Shekyan ⟨shekyan@gmail.com⟩.

     Project page ⟨https://github.com/shekyan/slowhttptest/⟩.

BSD                                                              November 25, 2013                                                             BSD
