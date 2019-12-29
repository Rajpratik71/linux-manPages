L2TEST(1)                               General Commands Manual                              L2TEST(1)

NAME
       l2test - L2CAP testing tool

DESCRIPTION
       l2test - L2CAP testing tool Usage:

              l2test <mode> [options] [bdaddr]

   Modes:
       -r listen and receive

       -w listen and send

       -d listen and dump incoming data

       -x listen, then send, then dump incoming data

       -t listen, then send and receive at the same time

       -q connect, then send and receive at the same time

       -s connect and send

       -u connect and receive

       -n connect and be silent

       -y connect, then send, then dump incoming data

       -c connect, disconnect, connect, ...

       -m multiple connects

       -p trigger dedicated bonding

       -z information request

OPTIONS
              [-b  bytes]  [-i  device]  [-P  psm]  [-J  cid]  [-I imtu] [-O omtu] [-L seconds] enable
              SO_LINGER [-W seconds] enable deferred setup [-B filename] use data  packets  from  file
              [-N num] send num frames (default = infinite) [-C num] send num frames before delay (de‐
              fault = 1) [-D milliseconds] delay after sending num frames (default = 0) [-K  millisec‐
              onds]  delay before receiving (default = 0) [-g milliseconds] delay before disconnecting
              (default = 0) [-X mode] l2cap mode (help for list, default =  basic)  [-a  policy]  chan
              policy  (help for list, default = bredr) [-F fcs] use CRC16 check (default = 1) [-Q num]
              Max Transmit value (default = 3) [-Z size] Transmission Window size (default =  63)  [-Y
              priority]  socket priority [-H size] Maximum receive buffer size [-R] reliable mode [-G]
              use connectionless channel (datagram) [-U] use sock stream [-A]  request  authentication
              [-E] request encryption [-S] secure connection [-M] become master [-T] enable timestamps
              [-V type] address type (help for list, default = bredr) [-e seq] initial sequence  value
              (default = 0)

   Usage:
              l2test <mode> [options] [bdaddr]

   Modes:
       -r listen and receive

       -w listen and send

       -d listen and dump incoming data

       -x listen, then send, then dump incoming data

       -t listen, then send and receive at the same time

       -q connect, then send and receive at the same time

       -s connect and send

       -u connect and receive

       -n connect and be silent

       -y connect, then send, then dump incoming data

       -c connect, disconnect, connect, ...

       -m multiple connects

       -p trigger dedicated bonding

       -z information request

              [-b  bytes]  [-i  device]  [-P  psm]  [-J  cid]  [-I imtu] [-O omtu] [-L seconds] enable
              SO_LINGER [-W seconds] enable deferred setup [-B filename] use data  packets  from  file
              [-N num] send num frames (default = infinite) [-C num] send num frames before delay (de‐
              fault = 1) [-D milliseconds] delay after sending num frames (default = 0) [-K  millisec‐
              onds]  delay before receiving (default = 0) [-g milliseconds] delay before disconnecting
              (default = 0) [-X mode] l2cap mode (help for list, default =  basic)  [-a  policy]  chan
              policy  (help for list, default = bredr) [-F fcs] use CRC16 check (default = 1) [-Q num]
              Max Transmit value (default = 3) [-Z size] Transmission Window size (default =  63)  [-Y
              priority]  socket priority [-H size] Maximum receive buffer size [-R] reliable mode [-G]
              use connectionless channel (datagram) [-U] use sock stream [-A]  request  authentication
              [-E] request encryption [-S] secure connection [-M] become master [-T] enable timestamps
              [-V type] address type (help for list, default = bredr) [-e seq] initial sequence  value
              (default = 0)

                                              April 2018                                     L2TEST(1)
