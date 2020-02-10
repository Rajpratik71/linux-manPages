JWT(1)                                                                                        User Commands                                                                                        JWT(1)

NAME
       jwt3 - Python implementation of JSON Web Token

SYNOPSIS
       jwt3 [options] input

DESCRIPTION
       Encodes or decodes JSON Web Tokens based on input

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       -n, --no-verify
              ignore signature verification on decode

       --key=KEY
              set the secret key to sign with

       --alg=ALG
              set crypto algorithm to sign with. default=HS256

EXAMPLES
       Decoding:

       jwt3 --key=secret json.web.token

       jwt3 --no-verify json.web.token

       Encoding requires the key option and takes space separated key/value pairs separated by equals (=) as input.

       Examples:

       jwt3 --key=secret iss=me exp=1302049071

       jwt3 --key=secret foo=bar exp=+10

       The exp key is special and can take an offset to current Unix time.

AUTHOR
       Jeff Lindsay <progrium@gmail.com>

       This manual page was written by Daniele Tricoli <eriol@mornie.org>, for the Debian project (but may be used by others).

jwt3 0.1                                                                                       August 2014                                                                                         JWT(1)
