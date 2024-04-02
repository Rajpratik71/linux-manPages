Hashcat(1)                                                    General Commands Manual                                                   Hashcat(1)

NAME
       hashcat - Advanced CPU-based password recovery utility

SYNOPSIS
       hashcat [options] hashfile [mask|wordfiles|directories]

DESCRIPTION
       Hashcat is the world’s fastest CPU-based password recovery tool.

       While  it's  not  as  fast  as  its GPU counterpart oclHashcat, large lists can be easily split in half with a good dictionary and a bit of
       knowledge of the command switches.

       Hashcat is the self-proclaimed world’s fastest CPU-based password recovery tool, Examples of hashcat supported hashing algorithms  are  Mi‐
       crosoft LM Hashes, MD4, MD5, SHA-family, Unix Crypt formats, MySQL, Cisco PIX.

OPTIONS
       -h, --help
              Show summary of options.

       -V, --version
              Show version of program.

       -m, --hash-type=NUM
              Hash-type, see references below

       -a, --attack-mode=NUM
              Attack-mode, see references below

       --quiet
              Suppress output

       -b, --benchmark
              Run benchmark

       --hex-salt
              Assume salt is given in hex

       --hex-charset
              Assume charset is given in hex

       --runtime=NUM
              Abort session after NUM seconds of runtime

       --status
              Enable automatic update of the status-screen

       --status-timer=NUM
              Seconds between status-screen update

       --status-automat
              Display the status view in a machine readable format

       -o, --outfile=FILE
              Define outfile for recovered hash

       --outfile-format=NUM
              Define outfile-format for recovered hash, see references below

       --outfile-autohex-disable
              Disable the use of $HEX[] in output plains

       -p, --separator=CHAR
              Define separator char for hashlists/outfile

       --show Show cracked passwords only (see --username)

       --left Show uncracked passwords only (see --username)

       --username
              Enable ignoring of usernames in hashfile (Recommended: also use --show)

       --remove
              Enable remove of hash once it is cracked

       --stdout
              Stdout mode

       --potfile-disable
              Do not write potfile

       --debug-mode=NUM
              Defines the debug mode (hybrid only by using rules), see references below

       --debug-file=FILE
              Output file for debugging rules (see --debug-mode)

       -e, --salt-file=FILE
              Salts-file for unsalted hashlists

       -c, --segment-size=NUM
              Size in MB to cache from the wordfile

       -n, --threads=NUM
              Number of threads

       -s, --words-skip=NUM
              Skip number of words (for resume)

       -l, --words-limit=NUM
              Limit number of words (for distributed)

       -r, --rules-file=FILE
              Rules-file use: -r 1.rule

       -g, --generate-rules=NUM
              Generate NUM random rules

       --generate-rules-func-min=NUM
              Force NUM functions per random rule min

       --generate-rules-func-max=NUM
              Force NUM functions per random rule max

       --generate-rules-seed=NUM
              Force RNG seed to NUM

       -1, --custom-charset1=CS
              User-defined  charsets example --custom-charset1=?dabcdef : sets charset ?1 to 0123456789abcdef -2 mycharset.hcchr : sets charset ?2
              to chars contained in file

       -2, --custom-charset2=CS
              User-defined charsets example --custom-charset1=?dabcdef : sets charset ?1 to 0123456789abcdef -2 mycharset.hcchr : sets charset  ?2
              to chars con$

       --toogle-min=NUM
              Number of alphas in dictionary minimum

       --toogle-max=NUM
              Number of alphas in dictionary maximum

mass-attack options
       --increment
              Enable increment mode

       --increment-min=NUM
              Start incrementing at NUM

       --increment-max=NUM
              Stop incrementing at NUM

Permutation attack-mode options
       --perm-min=NUM
              Filter words shorter than NUM

       --perm-max=NUM
              Filter words larger than NUM

Table-Lookup attack-mode options
       -t, --table-file=FILE
              Table file

       --table-min=NUM
              Number of chars in dictionary minimum

       --table-max=NUM
              Number of chars in dictionary maximum

Prince attack-mode options
       --pw-min=NUM
              Print candidate if length is greater than NUM

       --pw-max=NUM
              Print candidate if length is smaller than NUM

       --element-cnt-min=NUM
              Minimum number of elements per chain

       --element-cnt-max=NUM
              Maximum number of elements per chain

       --wl-dist-len
              Calculate output length distribution from wordlist

       --wl-max=NUM
              Load only NUM words from input wordlist or use 0 to disable

       --case-permute=NUM
              For each word in the wordlist that begins with a letter generate a word with the opposite case of the first letter

Outfile formats
        1 = hash[:salt]
        2 = plain
        3 = hash[:salt]:plain
        4 = hex_plain
        5 = hash[:salt]:hex_plain
        6 = plain:hex_plain
        7 = hash[:salt]:plain:hex_plain
        8 = crackpos
        9 = hash[:salt]:crackpos
        10 = plain:crackpos
        11 = hash[:salt]:plain:crackpos
        12 = hex_plain:crackpos
        13 = hash[:salt]:hex_plain:crackpos
        14 = plain:hex_plain:crackpos
        15 = hash[:salt]:plain:hex_plain:crackpos

Debug mode output formats (for hybrid mode only, by using rules)
        1 = save finding rule
        2 = save original word
        3 = save original word and finding rule
        4 = save original word, finding rule and modified plain

Built-in charsets
       ?l = abcdefghijklmnopqrstuvwxyz
       ?u = ABCDEFGHIJKLMNOPQRSTUVWXYZ
       ?d = 0123456789
       ?s =  !"#$%&'()*+,-./:;<=>?@[]^_`{|}~
       ?a = ?l?u?d?s
       ?b = 0x00 - 0xff

Attack mode
       0 = Straight
       1 = Combination
       2 = Toggle-Case
       3 = Brute-force
       4 = Permutation
       5 = Table-Lookup
       8 = Prince

Hash types
       0 = MD5
       10 = md5($pass.$salt)
       20 = md5($salt.$pass)
       30 = md5(unicode($pass).$salt)
       40 = md5($salt.unicode($pass))
       50 = HMAC-MD5 (key = $pass)
       60 = HMAC-MD5 (key = $salt)
       100 = SHA1
       110 = sha1($pass.$salt)
       120 = sha1($salt.$pass)
       130 = sha1(unicode($pass).$salt)
       140 = sha1($salt.unicode($pass))
       150 = HMAC-SHA1 (key = $pass)
       160 = HMAC-SHA1 (key = $salt)
       200 = MySQL323
       300 = MySQL4.1/MySQL5
       400 = phpass, MD5(Wordpress), MD5(phpBB3), MD5(Joomla)
       500 = md5crypt, MD5(Unix), FreeBSD MD5, Cisco-IOS MD5
       900 = MD4
       1000 = NTLM
       1100 = Domain Cached Credentials (DCC), MS Cache
       1400 = SHA256
       1410 = sha256($pass.$salt)
       1420 = sha256($salt.$pass)
       1430 = sha256(unicode($pass).$salt)
       1431 = base64(sha256(unicode($pass)))
       1440 = sha256($salt.unicode($pass))
       1450 = HMAC-SHA256 (key = $pass)
       1460 = HMAC-SHA256 (key = $salt)
       1600 = md5apr1, MD5(APR), Apache MD5
       1700 = SHA512
       1710 = sha512($pass.$salt)
       1720 = sha512($salt.$pass)
       1730 = sha512(unicode($pass).$salt)
       1740 = sha512($salt.unicode($pass))
       1750 = HMAC-SHA512 (key = $pass)
       1760 = HMAC-SHA512 (key = $salt)
       1800 = SHA-512(Unix)
       2400 = Cisco-PIX MD5
       2410 = Cisco-ASA MD5
       2500 = WPA/WPA2
       2600 = Double MD5
       3200 = bcrypt, Blowfish(OpenBSD)
       3300 = MD5(Sun)
       3500 = md5(md5(md5($pass)))
       3610 = md5(md5($salt).$pass)
       3710 = md5($salt.md5($pass))
       3720 = md5($pass.md5($salt))
       3800 = md5($salt.$pass.$salt)
       3910 = md5(md5($pass).md5($salt))
       4010 = md5($salt.md5($salt.$pass))
       4110 = md5($salt.md5($pass.$salt))
       4210 = md5($username.0.$pass)
       4300 = md5(strtoupper(md5($pass)))
       4400 = md5(sha1($pass))
       4500 = Double SHA1
       4600 = sha1(sha1(sha1($pass)))
       4700 = sha1(md5($pass))
       4800 = MD5(Chap), iSCSI CHAP authentication
       4900 = sha1($salt.$pass.$salt)
       5000 = SHA-3(Keccak)
       5100 = Half MD5
       5200 = Password Safe SHA-256
       5300 = IKE-PSK MD5
       5400 = IKE-PSK SHA1
       5500 = NetNTLMv1-VANILLA / NetNTLMv1-ESS
       5600 = NetNTLMv2
       5700 = Cisco-IOS SHA256
       5800 = Android PIN
       6300 = AIX {smd5}
       6400 = AIX {ssha256}
       6500 = AIX {ssha512}
       6700 = AIX {ssha1}
       6900 = GOST, GOST R 34.11-94
       7000 = Fortigate (FortiOS)
       7100 = OS X v10.8+
       7200 = GRUB 2
       7300 = IPMI2 RAKP HMAC-SHA1
       7400 = sha256crypt, SHA256(Unix)
       7900 = Drupal7
       8400 = WBB3, Woltlab Burning Board 3
       8900 = scrypt
       9200 = Cisco $8$
       9300 = Cisco $9$
       9800 = Radmin2
       10000 = Django (PBKDF2-SHA256)
       10200 = Cram MD5
       10300 = SAP CODVN H (PWDSALTEDHASH) iSSHA-1
       11000 = PrestaShop
       11100 = PostgreSQL Challenge-Response Authentication (MD5)
       11200 = MySQL Challenge-Response Authentication (SHA1)
       11400 = SIP digest authentication (MD5)
       99999 = Plaintext

Specific hash type
       11 = Joomla < 2.5.18
       12 = PostgreSQL
       21 = osCommerce, xt:Commerce
       23 = Skype
       101 = nsldap, SHA-1(Base64), Netscape LDAP SHA
       111 = nsldaps, SSHA-1(Base64), Netscape LDAP SSHA
       112 = Oracle S: Type (Oracle 11+)
       121 = SMF > v1.1
       122 = OS X v10.4, v10.5, v10.6
       123 = EPi
       124 = Django (SHA-1)
       131 = MSSQL(2000)
       132 = MSSQL(2005)
       133 = PeopleSoft
       141 = EPiServer 6.x < v4
       1421 = hMailServer
       1441 = EPiServer 6.x > v4
       1711 = SSHA-512(Base64), LDAP {SSHA512}
       1722 = OS X v10.7
       1731 = MSSQL(2012 & 2014)
       2611 = vBulletin < v3.8.5
       2612 = PHPS
       2711 = vBulletin > v3.8.5
       2811 = IPB2+, MyBB1.2+
       3711 = Mediawiki B type
       3721 = WebEdition CMS
       7600 = Redmine Project Management Web App

AUTHOR
       hashcat was written by Jens Steube <jens.steube@gmail.com>

       This manual page was written by Daniel Echeverry <epsilon77@gmail.com>, for the Debian project (and may be used by others).

                                                                   March 28 2016                                                        Hashcat(1)
