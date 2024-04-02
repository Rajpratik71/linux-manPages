hashrat(1)                                    hashing tool supporting several hashes and recursivity                                    hashrat(1)

NAME
       hashrat - hashing tool supporting several hashes and recursivity

SYNOPSIS
       hashrat [options] [paths to hash]

       hashrat -c [options] [input file of hashes]

DESCRIPTION
       Hashrat  is  a  hash-generation utility that supports the md5, sha1, sha256, sha512, whirlpool, jh-224, jh256, jh-384 and jh-512 hash func‐
       tions, and also the HMAC versions of those functions. It can output in traditional format (same as md5sum and shasum and the like) or  it's
       own format.

       Hashes can be output in octal, decimal, hexadecimal, uppercase hexadecimal or base64.

       Hashrat  also  supports  directory recursion, hashing entire devices, and generating a hash for an entire directory. It has a CGI mode that
       can be used as a web-page to lookup hashes.

OPTIONS
       -?, -help, --help
              Print this help.

       -version, --version
              Print program version.

       -md5   Use md5 hash algorithm. This is the default hash.

       -sha1  Use sha1 hash algorithm.

       -sha256
              Use sha256 hash algorithm.

       -sha512
              Use sha512 hash algorithm.

       -whirl Use whirlpool hash algorithm.

       -whirlpool
              Use whirlpool hash algorithm.

       -jh224 Use jh-224 hash algorithm.

       -jh256 Use jh-256 hash algorithm.

       -jh384 Use jh-384 hash algorithm.

       -jh512 Use jh-512 hash algorithm.

       -hmac  HMAC using specified hash algorithm.

       -8     Encode with octal instead of hex.

       -10    Encode with decimal instead of hex.

       -H, -HEX
              Encode with UPPERCASE hexadecimal.

       -64, -base64
              Encode with base64.

       -i64, -i64
              Encode with base64, with rearranged characters.

       -p64, -p64
              Encode with base64 with a-z,A-Z and _-, for best compatibility with 'allowed characters' in websites.

       -x64, -x64
              Encode with XXencode style base64.

       -u64, -u64
              Encode with UUencode style base64.

       -g64, -g64
              Encode with GEDCOM style base64.

       -a85, -a85
              Encode with ASCII85.

       -z85, -z85
              Encode with ZEROMQ variant of ASCII85.  -t, -trad Output hashes in traditional md5sum, shaXsum format.

       -tag, --tag -bsd
              Output hashes in bsdsum format.

       -r     Recurse into directories when hashing files.

       -f <listfile>
              Hash files listed in <listfile>.

       -i <pattern>
              Only hash items matching <pattern>.

       -x <pattern>
              Exclude items matching <pattern>.

       -n <length>
              Truncate hashes to <length> bytes.

       -c     CHECK hashes against list from file (or stdin).

       -cf    CHECK hashes but only show failures.

       -m     MATCH files from a list read from stdin.

       -lm    Read hashes from stdin, upload them to a memcached server (requires the -memcached option).

       -X, -exec
              In CHECK or MATCH mode only examine executable files.

       -dups  Search for duplicate files.

       -memcached <server>, -mcd <server>
              Specify memcached server. This option overrides reading list from stdin if used with -m, -c or -cf.

       -h <script>
              Script to run when a file fails CHECK mode, or is found in MATCH mode.

       -hook <script>
              Script to run when a file fails CHECK mode, or is found in FIND mode

       -color Use ANSI color codes on output when checking hashes.

       -S, -strict
              Strict mode: when checking, check file mtime, owner, group, and inode as well as it's hash.

       -d     Dereference (follow) symlinks.

       -fs    Stay one filesystem.

       -dirmode
              DirMode: read all files in directory and create one hash for them.

       -devmode
              DevMode: read from a file EVEN OF IT'S A DEVNODE.

       -lines Read lines from stdin and hash each line independently.

       -rl, -rawlines
              Read lines from stdin and hash each line independantly, INCLUDING any trailing whitespace. This is  compatible  with  'echo  text  |
              md5sum'.

       -cgi   Run in HTTP CGI mode.

       -net   Treat  'file'  arguments  as either ssh or http URLs, and pull files over the network and then hash them (allows hashing of files on
              remote machines).  URLs are in the format ssh://[username]:[password]@[host]:[port] or http://[username]:[password]@[host]:[port].

       -idfile <path>
              Path to a ssh private key file to use to authenticate INSTEAD OF A PASSWORD when pulling files via ssh.

       -xattr Use eXtended file ATTRibutes. In hash mode, store hashes in the file attributes. In check mode compare against hashes stored in file
              attributes.

       -txattr
              Use TRUSTED eXtended file ATTRibutes. In hash mode, store hashes in trusted file attributes. The trusted attributes can only be read
              and written by root.

       -cache Use hashes stored in user xattr if they're younger than the mtime of the file. This speeds up outputting hashes.

       -u <types>
              Update. In checking mode, update hashes for the files as you go. The <types> is a comma-separated list of things  to  update,  which
              can be xattr memcached or a file name. This will update these targets with the hash that was found at the time of checking.

       -hide-input
              When reading data from stdin in linemode, set the terminal to not echo characters, thus hiding typed input.

       -star-input
              When reading data from stdin in linemode replace characters with stars.

NOTES
       Hashrat can also detect if it's being run under any of the following names (e.g., via symlinks):

       md5sum Run with '-trad -md5'.

       shasum Run with '-trad -sha1'.

       sha1sum
              Run with '-trad -sha1'.

       sha256sum
              Run with '-trad -sha256'.

       sha512sum
              Run with '-trad -sha512'.

       jh224sum
              Run with '-trad -jh224'.

       jh256sum
              Run with '-trad -jh256'.

       jh384sum
              Run with '-trad -jh384'.

       jh512sum
              Run with '-trad -jh512'.

       whirlpoolsum
              Run with '-trad -whirl'.

       hashrat.cgi
              Run in web-enabled 'cgi mode'.

EXAMPLES
       hashrat
              Generate a md5 hash of data read from stdin  (default hash type is md5).

       hashrat -jh256
              Generate a jh-256 hash of data read from stdin.

       hashrat -sha256 -64
              Generate a sha-256 hash of data read from stdin, output with base64 encoding.

       hashrat -sha256 -64 -lines
              Read  lines  from  stdin, and generate a sha-256 with base64 encoding FOR EVERY LINE. This strips any whitespace from the end of the
              line (including \r and/or \n line terminators).

       hashrat -md5 -trad -rawlines
              Read lines from stdin, and generate a md5 hash in traditional format for every line INCLUDING TRAILING WHITESPACE.  This is compati‐
              ble with 'echo text | md5sum', where text is one line, as echo adds a newline to the end of the text it outputs.

       hashrat *
              Generate a list of hashes for files in the current directory (default hash type is md5).

       hashrat -r -sha1 * > hashes.sha1
              Generate a list of hashes for files in the current directory, AND ALL SUBDIRECTORIES, using sha1 hashing.

       cat hashes.sha1 > hashrat -c
              Check hashes listed in hashes.sha1.

       cat hashes.sha1 > hashrat -c -strict
              Check  hashes  listed  in hashes.sha1. If hashes are NOT in traditional format than the -strict flag will cause hashrat to check the
              files uid, gid, size, mtime and inode and print a failure message if any of those don't match.

       cat hashes.sha1 > hashrat -cf
              Check hashes listed in hashes.sha1 but only output failures.

       cat APT1.md5 | hashrat -m -r /
              Read a list of hashes from stdin and search recursively for files matching them.

       cat APT1.md5 | hashrat -lm -memcached 127.0.0.1
              Read a list of hashes from stdin, and register them in a memcached server.

       hashrat -m -memcached 127.0.0.1 -r /
              Search recursively for files whose hashes are stored in a memcached server.

       hashrat -devmode -whirlpool -64 /dev/sda1
              Generate a whirlpool hash of the entire device /dev/sda1. Output result in base 64.

       hashrat -sha1 -net ssh:user:password@myhost/bin/*
              Generate sha1 hashes of files in /bin/* on the remote machine 'myhost'.

       hashrat -whirlpool -net http://myhost.com/webpage.html
              Generate whirlpool hash for the listed URL. Note, many webpages have dynamic content that changes every  time,  so  this  will  only
              return the same hash over and over if the page is static and doesn't change.

       hashrat -dups -r /home -u xattr
              Search for duplicate files under /home. Update hashes stored in filesystem attributes as you go.

USES FOR HASHRAT
       1)  Strong Passwords

       Hashrat can be used to generate strong passwords for websites. So, you don't have to remember the strong password, if it be always regener‐
       ate with hashrat.  You need to remember a handful of moderately decent passwords, i.e., things that I can't find by grepping in the '10,000
       most  popular passwords' list[1], and an additional personal pin. Now, you need to combine the website name, one of passwords, and the per‐
       sonal pin, into a string and feed them into hashrat:

           $ echo "facebook.com password 1234" | hashrat -sha1 -64

       Obviously, a good password isn't 'password' and a good pin isn't '1234', but you get the idea. This gives a 28-character string that should
       take "8.02 trillion centuries" to crack with a "massive cracking array", according to Steve Gibson's Password haystacks utility[2]. This is
       what I then use as my password. Unfortunately some websites won't take a 28-character password, and for  these  you  can  truncate  to  the
       appropriate  length  (using the -n flag), but the results are still stronger than anything you could remember, and nothing needs storing on
       disk (as with password managers).

       There are some dangers to using the 'echo' method shown above if you are on a shared  machine,  or  if  someone  gets  hold  of  your  com‐
       puter/harddrive. On a shared machine someone could type 'ps ax' to see all commands running, and if they time it right, they might see your
       command-line with your password in it. Another danger lies in using a shell (like bash) that will record your typed  commands  so  you  can
       recall  them  later. Bash stores this information on disk in the file .bash_history, so if you use the 'echo' method shown above your pass‐
       word will be saved on disk. To combat this hashrat has line mode:

           $ hashrat -sha1 -64 -lines

       This reads lines from stdin, so type into hashrat and then press ENTER, and you'll be given the hash of the line you typed. By this  method
       your password is neither visible in 'ps ax', nor is ever stored on disk.

       A  -lines  will produce a different hash to the 'echo' method listed above, because it strips any trailing whiespace off the lines read. If
       you want strict compatibility with 'echo' (by default echo adds a newline to the end of the text to output) then use rawlines mode:

           $ hashrat -sha1 -64 -rawlines

       Finally, you can prevent shoulder-surfers seeing you type your password by using the -hide-input or -star-input options to  hide  what  you
       type.

           [1] https://github.com/discourse/discourse/blob/master/lib/common_passwords/10k-common-passwords.txt

           [2] https://www.grc.com/haystack.htm

       2)  Watching for file changes

       Like  md5sum/shasum  etc,  hashrat can be used to detect changes in files that might indicate malicious activity. For instance, in order to
       get early warning of malware like cryptolocker (that encrypts files on a users disk, or on network shares, and then demands  a  ransom  for
       file  recovery)  you can scatter about the disk a number of Canary files that should not change. You need record their hashes and regularly
       check them. If they change, you will know something is going on.

       Hashes generated by hashrat can be output to a file, or stored in extended file attributes, or in a memcached server.

           $ hashrat -sha256 -r . > /tmp/files.sha256

           $ hashrat -sha256 -r . -xattr

           $ hashrat -sha256 -r . -memcached

       Similarly these can then be used to check files later:

           $ cat /tmp/files.sha256 | hashrat -sha256

           $ hashrat -c -sha256 -r . -xattr

           $ hashrat -c -sha256 -r . -memcached

       There is a slight difference between xattr/memcached checks and checks where a list is read from stdin. Currently when reading  from  stdin
       hashrat  will  ONLY  check the files in the list. However, in -xattr and -memcached mode, it will check all files, outputting and error for
       those where no stored hash can be found. This is likely to change in the a future release, with the stdin method being  brought  into  line
       with the others.

       3)  Finding files that match hashes

       Using the -m flag hashrat can be told to read a range of hashes from stdin, and then search for files matching those hashes. For Example:

           $ cat APT1-AppendixE-MD5s.txt | hashrat -r -m /usr

       The  last  command  will  search recursively under /usr for files with hashes matching those in APT1-AppendixE-MD5s.txt. The input on stdin
       must begin with a hash, anything written after the hash will be treated as a comment to be displayed if a file matching the hash is found.

       Hashtypes other than md5 can be used thusly:

           $ cat sha1-list.lst | hashrat -r -sha1 -m /usr

       Hashes can also be loaded into a memcached server, so that the same file list can be checked on a number of machines,  without  needing  to
       store the hashlist on those machines. First you need load the hashes:

           $ cat APT1-AppendixE-MD5s.txt | hashrat -lm -memcached 192.168.1.5

       The last line loads the hashes to a memcached server at 192.168.1.5. You can then search against the memcached server by:

           $ hashrat -r -m -memcached 192.168.1.5 /usr

       4)  Find duplicate files

       Using  the  -dups  flag (usually in combination with the -r recursive flag) hashrat can be set to search for duplicate files and output any
       found to stdout.

       5)  CGI Mode

       If hashrat is run with the -cgi flag, or if it's run with a name of hashrat.cgi (either by renaming the hashrat executable, or via  a  sym‐
       bolic link) it will output a webpage that allows users to look up hashes over the web. This allows to look-up your strong passwords even if
       you don't have access to a local version of hashrat.

EXTENDED FILESYSTEM ATTRIBUTES
       Hashrat can use extended filesystem attributes where these are supported. This allows a hash to be stored in the filesystem metadata of the
       target  file.  This can then be used for checking hashes, or for caching hashes to produce faster output during hashing runs. There are two
       types of filesystem attribute, trusted attributes, which can only be set and read by root, and user attributes, which can be set  and  read
       by any user that has the appropriate permissions for the file.

       Hashes can be stored against files by using the -xattr option to set user attributes:

           $ hashrat -sha256 -r . -xattr

       And using the -txattr flag to set trusted attributes (you must be root to set trusted attributes):

           # hashrat -sha256 -r . -txattr

       When  checking either flag can be used, but hashrat will always use trusted attributes when running as root, if those are available, other‐
       wise it will fall back to user attributes.

           $ hashrat -c -sha256 -r . -xattr

       The -cache option allows using stored hashes rather than regenerating hashes. It only considers hashes stored in user  attributes  at  cur‐
       rent.

           $ hashrat -r . -cache

       This makes getting a report of hashes considerably faster, but it runs the risk that the hashes may not be accurate. Hashrat will only out‐
       put a hash stored in file attributes if the storage time of the hash is younger than the modify time (mtime) of  the  file,  however,  this
       means  an attacker could change the modify time of the file to hide changes they've made. Thus this feature should not be used for security
       checking purposes (but should be safe for uses like finding files that have changed and need to be backed up, for instance).

AUTHOR
       The hashrat was written by Colum Paget <colums.projects@gmail.com>.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

HASHRAT 1.5                                                          Jan 2015                                                           hashrat(1)
