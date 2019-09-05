EEPGET(1)                                                               I2P                                                              EEPGET(1)

NAME
       Eepget - I2P downloader

SYNOPSIS
       eepget [options]URL

DESCRIPTION
       Download a file non-interactively via HTTP. Transfers through both I2P and the regular Internet are supported.

       Eepget  is  able  to  cope with slow or unstable network connections; if a download is not successful because of a network problem, it will
       keep retrying until the whole file has been retrieved (if the -n option is set).  If supported by the remote server, eepget  will  instruct
       the server to continue the download from the point of interruption.

OPTIONS
       -c

       Clearnet. Do not use a proxy. Same as -p :0 .

       -e etag

       Sets the etag value in the request headers.

       -h name=value

       Adds an arbitrary request header with the given name and value.

       -l lineLen

       Controls the progress display.  lineLen  is the length of one progress line in characters. The default is 40.

       -m markSize

       Controls the progress display.  markSize  is the number of bytes one '#' character represents. The default is 1024.

       -n retries

       Specify the number of times to retry downloading if the download isn't successful. If this option is not specified, eepget will not retry.

       -o file

       Sets the output file to write to. If this option is not given, the output filename will be determined by the URL.

       -p proxy_host[:port]

       Specify  an  I2P proxy server (eeproxy) to use. If the port is not specified, eepget will use 4444. If this option is not specified, eepget
       will use 127.0.0.1:4444. Specify -c or -p :0 to disable the eeproxy.

       -t seconds

       Sets the inactivity timeout. The default is 60 seconds.

       -u username

       Sets the username for proxy authorization, if required.

       -x password

       Sets the password for proxy authorization, if required. If a username is specified but not a password, EepGet will prompt for the password.

EXIT STATUS
       eepget exits with status zero upon successful transfer and non-zero if there were problems with the download.

REPORTING BUGS
       Please enter a ticket on the I2P trac page ⟨https://trac.i2p2.de/⟩.

SEE ALSO
       i2prouter(1) curl(1) wget(1)

                                                                 January 26, 2017                                                        EEPGET(1)
