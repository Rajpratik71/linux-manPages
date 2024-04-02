RADARE2(1)                                                  BSD General Commands Manual                                                 RADARE2(1)

NAME
     radare2 — Advanced commandline hexadecimal editor, disassembler and debugger

SYNOPSIS
     radare2 [-a arch] [-b bits] [-B baddr] [-c cmd] [-e k=v] [-i file] [-I prefile] [-k kernel] [-m addr] [-p project] [-P patch] [-r rarun2]
             [-R rr2rule] [-s addr] [-0AdDwntLquvVxX] -|--|=|file

DESCRIPTION
     radare2 is a commandline hexadecimal editor.

     "r2" is the alias program name for radare2.

     This manpage is not updated yet. Feel free to contribute.

     The options are:

     --          Open radare2 on an empty file

     -           Equivalent of 'r2 malloc://512'

     -0          Print \x00 after initialization and after every command executed

     -2          Close stderr before starting RCore

     -a arch     force asm.arch (x86, ppc, arm, mips, bf, java, ...)

     -A          run 'aaa' command before prompt or patch to analyze all referenced code. Use -AA to run aaaa

     -b bits     force asm.bits (16, 32, 64)

     -B baddr    Specify the base address to be used when loading a new binary. See 'e?bin.baddr'

     -c cmd      Execute the given command before giving prompt

     -d          Start in debugger mode

     -D dbg.backend
                 Enable debug mode. Set cfg.debug=true

     -e k=v      Set configuration eval variable key=value. For example -e scr.color=false

     -f          Blocksize = file size

     -i file     Run script file. After the file is loaded

     -I file     Run script file. Before the file is loaded

     -k kernel   Select kernel (asm.os) for syscall resolution

     -l plugfile
                 Load given plugin file

     -L          List supported IO plugins.

     -m addr     map file at given address

     -M          Disable demangling

     -n          Do not perform any analysis (r_bin). Just load the raw file

     -nn         Only load the rbin structures (elf, mach0, ...)

     -N          Do not load user settings/projects from ~/.radare2rc, ~/.config/radare2/radare2rc and the scripts inside .../radare2rc.d/ direc‐
                 tory.

     -q          Quiet mode (no prompt) and quit after running the commands specified with -i or -c

     -Q          Same as q, but exiting without freeing RCore, this produces leaks at exit time, but saves some precious ms to run the testsuite
                 in fast mode.

     -p prj      Set project file

     -P file     Apply rapatch file and quit (see doc/rapatch.md for more details)

     -r rarun2   Specify dbg.profile rarun2 profile to use when spawning a program for debugging

     -R rarun2-directive
                 Specify custom rarun2 directives without having to create a rarun2 profile

     -s addr     Start seeking at this address

     -S          Enable sandboxed mode (same as -e cfg.sandbox=true)

     -t          Get binary information using a thread

     -u          Set bin.filter=false to load rbin info without filtering names

     -v          Show version information and exit (Use -qv to get just the version number)

     -V          Show radare2 library versions

     -w          Open in write mode

     -h          Show help message

     -H          Show files and environment help

     -x          Open the file map without executable permissions

     -X          Same as -e bin.usextr=false, do not use extract plugins, useful for dyldcache

SHELL
     Type '?' for help

VISUAL
     To enter visual mode use the 'V' command. Then press '?' for help

DEBUGGER
     In r2 the debugger commands are implemented under the 'd' command. Type 'd?' for help

ENVIRONMENT
      RHOMEDIR     ~/.config/radare2
      RCFILE       ~/.radare2rc (user preferences, batch script)
      MAGICPATH    /usr/lib/radare2/0.10.0-git/magic
      R_DEBUG      if defined, show error messages and crash signal
      VAPIDIR      path to extra vapi directory FILE path to the current working file.

SEE ALSO
     rahash2(1), rafind2(1), rabin2(1), radiff2(1), rasm2(1), rax2(1), ragg2(1), rarun2(1),

AUTHORS
     pancake <pancake@nopcode.org>

                                                                   Aug 24, 2017
