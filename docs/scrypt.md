SCRYPT(1)                                                   BSD General Commands Manual                                                  SCRYPT(1)

NAME
     scrypt — encrypt and decrypt files.

SYNOPSIS
     scrypt {enc | dec} [-M maxmem] [-m maxmemfrac] [-t maxtime] infile [outfile]

DESCRIPTION
     scrypt enc encrypts infile and writes the result to outfile if specified, or the standard output otherwise.  The user will be prompted to
     enter a passphrase (twice) to be used to generate a derived encryption key.

     scrypt dec decrypts infile and writes the result to outfile if specified, or the standard output otherwise.  The user will be prompted to
     enter the passphrase used at encryption time to generate the derived encryption key.

OPTIONS
     -M maxmem      Use at most maxmem bytes of RAM to compute the derived encryption key.

     -m maxmemfrac  Use at most the fraction maxmemfrac of the available RAM to compute the derived encryption key.

     -t maxtime     Use at most maxtime seconds of CPU time to compute the derived encryption key.

     In scrypt enc, the memory and CPU time limits are enforced by picking appropriate parameters to the scrypt key derivation function.  In
     scrypt dec, the memory and CPU time limits are enforced by exiting with an error if decrypting the file would require too much memory or CPU
     time.

EXIT STATUS
     The scrypt utility exits 0 on success, and >0 if an error occurs.

     Note that if the input encrypted file is corrupted, scrypt dec may produce output prior to determining that the input was corrupt and exiting
     with a non-zero status; so users should direct the output to a safe location and check the exit status of scrypt before using the decrypted
     data.

SEE ALSO
     Colin Percival, Stronger Key Derivation via Sequential Memory-Hard Functions, May 2009, Presented at BSDCan'09.

HISTORY
     The scrypt utility was written in May 2009 by Colin Percival as a demonstration of the scrypt key derivation function.  The scrypt key
     derivation function was invented in March 2009 by Colin Percival in order to allow key files from the tarsnap backup system to be passphrase
     protected.

BSD                                                                May 24, 2009                                                                BSD
