PYJWT(1)                                     User Commands                                    PYJWT(1)

NAME
       pyjwt3 - Python implementation of JSON Web Token

SYNOPSIS
       pyjwt3 [options] <command> [options] input

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

   PyJWT subcommands are: encode and decode.
       encode use to encode a supplied payload

       decode use to decode a supplied JSON web token

EXAMPLES
       Decoding:

       pyjwt3 --key=secret decode json.web.token

       pyjwt3 decode --no-verify json.web.token

       Encoding  requires the key option and takes space separated key/value pairs separated by equals
       (=) as input.

       Examples:

       pyjwt3 --key=secret encode iss=me exp=1302049071

       pyjwt3 --key=secret encode foo=bar exp=+10

       The exp key is special and can take an offset to current Unix time.

AUTHOR
       Jeff Lindsay <progrium@gmail.com>

       This manual page was written by Daniele Tricoli <eriol@mornie.org>, for the Debian project (but
       may be used by others).

pyjwt3 1.7.0                                   Dec 2018                                       PYJWT(1)
