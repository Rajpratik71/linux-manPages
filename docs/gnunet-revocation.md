GNUNET-REVOCATION(1)                   General Commands Manual                   GNUNET-REVOCATION(1)

NAME
       gnunet-revocation - revoke private keys (of egos) in GNUnet

SYNOPSIS
       gnunet-revocation [options]

DESCRIPTION
       gnunet-revocation can be used to verify if a key has been revoked, to create a revocation cer‐
       tificate for later revocation, to instantly revoke a key and to use a pre-generated revocation
       certificate to revoke a key.  Upon successful revocation, all peers will be informed about the
       invalidity of the key.  As this is an expensive operation, GNUnet requires the issuer  of  the
       revocation to perform an expensive proof-of-work computation before he will be allowed to per‐
       form the revocation.  gnunet-revocation will perform this computation.  The computation can be
       performed  ahead of time, with the resulting revocation certificate being stored in a file for
       later "instant" use.  gnunet-revocation also makes is possible to resume  the  pre-calculation
       of  a  revocation  ---  simply  abort a running proof-of-work calculation with CTRL-C, and the
       existing revocation certificate file will contain the status of the  computation.   Note  that
       performing  a revocation proof-of-work is deliberately VERY expensive.  Depending on your CPU,
       the calculation can take days or weeks.

OPTIONS
       -t KEY, --test=KEY
              Check if the given KEY (ASCII-encoded public key required) has been revoked.

       -R NAME, --revoke=NAME
              Calculate or perform revocation for the ego with the given NAME.

       -p, --perform
              Actually perform the revocation as soon as possible (do not just generate a  revocation
              certificate, use it).  Must be supplied to actually perform the revocation.

       -f NAME, --filename=NAME
              Use NAME as the name of the file that is to contain the revocation certificate.  Inter‐
              mediate computation results will be stored here, as well as the final  revocation  cer‐
              tificate.   When  used  together with -p, this file will be inspected to see if it con‐
              tains a valid certificate for instant revocation, in which case the revocation  can  be
              performed instantly.  If the given file contains anything (a valid certificate, with or
              without the completed proof-of-work) there is no need to supply the "-R" option  or  to
              still have the private key of the ego to perform the revocation.

       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -v, --version
              Print GNUnet version number.

BUGS
       Report  bugs  by  using  Mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

GNUnet                                       Mar 15, 2012                        GNUNET-REVOCATION(1)
