burp_ca(8)                                                            burp_ca                                                           burp_ca(8)

NAME
       burp_ca - program for generating certificates for use with burp

SYNOPSIS
       burp_ca [options]

       A  script for generating certificates for use with burp. This script comes with the burp backup and restore package, and was contributed by
       Patrick Koppen.

OPTIONS
       -h|--help
              show help

       -i|--init
              inititalize CA

       -k|--key
              generate new key

       -r|--request
              generate certificate sign request

       -s|--sign
              sign csr (use --ca <ca> and --name <name>)

              --batch do not prompt for anything

              --revoke <number> revoke certificate with serial number

              --crl generate certificate revoke list

       -d|--dir <dir>
              ca output dir (default: /etc/burp/CA)

       -c|--config
              config file (default: /etc/burp/CA.cnf)

       -n|--name
              name (default: builder)

       -D|--days
              valid days for certificate (default in config file)

              --ca_days valid days for CA certificate (default: 3650)

       -S|--size
              key size (default: 2048)

       -a|--ca
              ca name if different from name

       -f|--dhfile <path>
              generate a new dhfile

BUGS
       If you find bugs, please report them to the email list. See the website <http://burp.grke.net/> for details.

AUTHOR
       The main author of Burp is Graham Keeling.

COPYRIGHT
       See the LICENCE file included with the source distribution.

                                                                 February 10, 2012                                                      burp_ca(8)
