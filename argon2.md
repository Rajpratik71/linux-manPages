ARGON2(1)                                                          User Commands                                                         ARGON2(1)

NAME
       argon2 - generate argon2 hashes

SYNOPSIS
       argon2 salt [OPTIONS]

DESCRIPTION
       Generate Argon2 hashes from the command line.

       The supplied salt (the first argument to the command) must be at least 8 octets in length, and the password is supplied on standard input.

       By  default,  this uses Argon2i variant (where memory access is independent of secret data) which is the preferred one for password hashing
       and password-based key derivation.

OPTIONS
       -h     Display tool usage

       -d     Use Argon2d instead of Argon2i (Argon2i is the default)

       -id    Use Argon2id instead of Argon2i (Argon2i is the default)

       -t N   Sets the number of iterations to N (default = 3)

       -m N   Sets the memory usage of 2^N KiB (default = 12)

       -p N   Sets parallelism to N threads (default = 1)

       -l N   Sets hash output length to N bytes (default = 32)

       -e     Output only encoded hash

       -r     Output only the raw bytes of the hash

COPYRIGHT
       This manpage was written by Daniel Kahn Gillmor for the Debian distribution (but may be used by others).  It is released, like the rest  of
       this Argon2 implementation, under a dual license. You may use this work under the terms of a Creative Commons CC0 1.0 License/Waiver or the
       Apache Public License 2.0, at your option.

argon2                                                              April 2016                                                           ARGON2(1)
