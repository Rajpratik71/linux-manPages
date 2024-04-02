RAHASH2(1)                                                  BSD General Commands Manual                                                 RAHASH2(1)

NAME
     rahash2 — block based hashing utility

SYNOPSIS
     rahash2 [-BdDehjrkvq] [-a algorithm] [-b size] [-D algo] [-E algo] [-f from] [-i iterations] [-I IV] [-s string] [-S seed] [-p type]
             [-x hexstr] [-t to] [-c hash] [[file] ...]

DESCRIPTION
     This program is part of the radare project.

     Rahash2 allows you to calculate, check and show the hash values of each block of a target file. The block size is 32768 bytes by default.
     It's allowed to hash from stdin using '-' as a target file. You can compare against a known hash and get the result in the exit status.

     You can hash big files by hashing each block and later determine what part of it has been modified. Useful for filesystem analysis.

     This command can be used to calculate hashes of a certain part of a file or a command line passed string.

     This is the command used by the 'ph' command of radare.

     -a algo     Select an algorithm for the hashing. Valid values are listed in: rahash2 -L

     -b blocksize
                 Define the block size

     -c hash     Compare the computed hash with this one. Allowed only when a single hash is computed.

     -D algo     Decrypt instead of hash using the given algorithm (base64, base91, rc4, aes, xor, blowfish, rot, rol, ror, rc2, rc6, punycode)

     -e          Use little endian to display checksums

     -E algo     Encrypt instead of hash using the given algorithm (base64, base91, rc4, aes, xor, blowfish, rot, rol, ror, rc2, rc6, punycode)

     -i iters    Apply the hash Iters times to itself+seed

     -I [^]s:string|hexstr
                 Set initialization vector (IV) for the cryptographic functions.

     -j          Show output in JSON (see -r)

     -B          Show per-block hash

     -k          Show result using OpenSSH's VisualHostKey randomart algorithm

     -s string   Hash this string instead of using the 'source' and 'hash-file' arguments.

     -S [^]s:string|hexstr
                 Set seed to hash with, use ^to prefix seed, otherwise its suffixed. If the seed is just a dash '-' it will read from stdin, this
                 is useful to provide huge XOR payloads or other crypto keys bigger than few bytes.

     -f from     Start hashing at given address

     -t to       Stop hashing at given address

     -p arg      Show vertical entropy/statistical entropy graphs

     -q          Quiet mode (-qq for even quieter!)

     -r          Show output in radare commands

     -x hexstr   Hash the given hexpair string instead of using the 'source' and 'hash-file' arguments.

     -v          Show version information

     -h          Show usage help message.

DIAGNOSTICS
     The rahash2 utility exits 0 on success, and >0 if an error occurs.

     When -c is used, exit status 0 indicates a match between the expected and computed hashes.

SEE ALSO
     radare2(1), rafind2(1), rahash2(1), rabin2(1), radiff2(1), rasm2(1), ragg2(1), rarun2(1), rax2(1),

AUTHORS
     pancake <pancake@nopcode.org>

                                                                    Feb 6, 2015
