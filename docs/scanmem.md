scanmem(1)                                                    General Commands Manual                                                   scanmem(1)

NAME
       scanmem - locate and modify a variable in an executing process.

SYNOPSIS
       scanmem [--version] [--help] [--debug] [--backend] target-program-pid

DESCRIPTION
       scanmem  is  an interactive debugging utility that can be used to isolate the address of a variable in an executing process by successively
       scanning the process' address space looking for matching values. By informing scanmem how the value of the variable changes over  time,  it
       can determine the actual location (or locations) of the variable by successively eliminating non-matches.  scanmem determines where to look
       by searching for mappings with read / write permission, these are referred to as regions. Users can  eliminate  regions  they  believe  are
       likely unrelated to the target variable (for example, located in a shared library unrelated to the variable in question), this will improve
       the speed of the scan, which can initially be quite slow in large programs.

       Once a variable has been found, scanmem can monitor the variable, or change it to a user specified value, either once, or continually  over
       a period of time.

       scanmem  works similarly to the " pokefinders " once commonly used to cheat at video games, this function is a good demonstration of how to
       use scanmem , and is used in the documentation.

USAGE
       scanmem should be invoked with the process id of the program you wish to debug as an argument. Once started,  scanmem  accepts  interactive
       commands. These are described below, however entering help at the > prompt will allow you to access scanmem's online documentation.

       The  target-program-pid can be specified in decimal, hexadecimal, or octal using the standard C language notation (leading 0x for hexadeci‐
       mal, leading 0 for octal, anything else is assumed to be decimal).

       --version

       Print version and exit.

       --help

       Print a short description of command line options then exit.

       --debug

       Run in debug mode, more information will be outputted.

       --backend

       Work as backend, normal users should not use this paratmeter.

COMMANDS
       While in interactive mode, scanmem prints a decimal number followed by > , the number is the current number of possible candidates for  the
       target variable that are known. 0 indicates that no possible variables have been eliminated yet.

       n

       Where n represents any number in decimal, octal or hexadecimal, this command tells scanmem that the current value of the target variable is
       exactly n.  scanmem will begin a search of the entire address space, or the existsing known matches (if any), eliminating any variable that
       does not have this value.

       set [match-id][,match-id,...]=]value[/delay] [...]

       Set the value value into the match numbers match-id , or if just value is specified, all known matches.  value can be specified in standard
       C language notation. All known matches, along with their match-id's can be displayed using the list command.  Multiple  match-id's  can  be
       specified, separated with commas and terminated with an = sign. To set a value continually,  suffix the command with / followed by the num‐
       ber of seconds to wait between sets. You can interrupt the set command with ^C to return to the scanmem prompt. This can be used to sustain
       the  value  of a variable which decreases overtime, for example a timer that is decremented every second can be set to 100 every 10 seconds
       to prevent some property from ever changing.

       This command is used to change the value of the variable(s) once found by elimination.  Please note, some applications will store values in
       multiple locations.

       dump <address> <length> [<filename>]

       Dump the memory region starting from <address> of length <length> into a human-readable format.

       If <filename> is given, data will be saved into the file, otherwise data will be displayed into stdout in a human readable format

       write <value_type> <address> <value>

       Manually set the value of the variable at the speicified address.

       Names of value_type are subject to change in different versions of scanmem, see more info using the `help write' command.

       >

       Tells scanmem that it should eliminate all matched variables that have not increased since the last search.  For example, if the value of a
       variable is known to be zero when a program is executed, but increases over time, this command can be used several times to eliminate vari‐
       ables that have decreased or not changed.

       <

       As for > but indicates that the target variable has decreased since the last scan.

       =

       As for > but indicates that the target variable has not changed since last scan.

       snapshot

       Save a snapshot of existing program state, for use with > , < , and = , although other commands can still be used.

       list

       List all the possible candidates currently known, including their address, last known value and possible types. The value in the first col‐
       umn is the match id, and can be used in conjunction with the delete command to eliminate matches.

       delete [match-id]

       Delete match match-id , which can be found from the output of the list command. To delete all matches, see the reset command, or to  delete
       all  matches  associated  with  a  particular  library, see the dregion command, which also removes any associated matches. Pleae note that
       match-ids may be recalculated after matches are removed or added.

       watch [match-id]

       Monitor the value of match-id , and print its value as it changes. Every change is printed along with a timestamp, you can  interrupt  this
       command with ^C to stop monitoring.

       pid [new-pid]

       Print out the process id of the current target program, or change the target to new-pid , which will reset existing regions and matches.

       lregions

       List  all  the  known regions, this can be used in combination with the dregion command to eliminate regions that the user believes are not
       related to the variable in question, thus reducing the address space required to search. The value in the first  column  is  the  region-id
       which  must  be  passed  to  the  dregion command. The size and path (if applicable) is also printed. This can be used to eliminate regions
       located in shared libraries that are unlikely to be relevant to the variable required.

       dregion [!][region-id][,region-id][,...]

       Delete the region region-id , along with any matches from the match list. The region-id can be found in the output of the lregions command.
       A leading !  indicates the list should be inverted.

       reset

       Forget all known matches and start again.

       shell [shell-command]

       Execute shell-command using /bin/sh, then return.

       option <name> <value>

       Change options in runtime. See `help option` for all possible names/values.

       version

       Print the version of scanmem in use.

       help

       Print a short summary of available commands.

       exit

       Detach from the target program and exit immediately.

EXAMPLES
       Cheat at nethack, on systems where nethack is not installed sgid.

       $ scanmem `pidof nethack`
       info: attaching to pid 13070.
       info: maps file located at /proc/13070/maps opened.
       info: 17 suitable regions found.
       Please enter current value, or "help" for other commands.
       0>

       The  0 in the scanmem prompt indicates we currently have no candidates, so I enter how much gold I currently have (91 pieces) and let scan‐
       mem find the potential candidates.

       0> 91
       info: searching 0xbfffa000 - 0xc0000000...........ok
       info: searching 0x401c2000 - 0x401e3000...........ok
       info: searching 0x401c1000 - 0x401c2000...........ok
       info: searching 0x401b6000 - 0x401b8000...........ok
       info: searching 0x401b5000 - 0x401b6000...........ok
       info: searching 0x40189000 - 0x4018a000...........ok
       info: searching 0x40188000 - 0x40189000...........ok
       info: searching 0x40181000 - 0x40183000...........ok
       info: searching 0x4017f000 - 0x40181000...........ok
       info: searching 0x40070000 - 0x40071000...........ok
       info: searching 0x40068000 - 0x40070000...........ok
       info: searching 0x40030000 - 0x40031000...........ok
       info: searching 0x40029000 - 0x4002a000...........ok
       info: searching 0x4001f000 - 0x40020000...........ok
       info: searching 0x40016000 - 0x40017000...........ok
       info: searching 0x081d4000 - 0x0820a000...........ok
       info: searching 0x081b7000 - 0x081d4000...........ok
       info: we currently have 16 matches.
       16> list
       [ 0] 0x081c1f34 {        91} (/usr/share/games/nethack/nethack)
       [ 1] 0x081c1780 {        91} (/usr/share/games/nethack/nethack)
       [ 2] 0x081be436 {        91} (/usr/share/games/nethack/nethack)
       [ 3] 0x081eeffc {        91} (unassociated, typically .bss)
       [ 4] 0x081ee0c0 {        91} (unassociated, typically .bss)
       [ 5] 0x081eddb8 {        91} (unassociated, typically .bss)
       [ 6] 0x081d6d88 {        91} (unassociated, typically .bss)
       [ 7] 0x4001fcd3 {        91} (/lib/libnss_compat-2.3.5.so)
       [ 8] 0x40029fe3 {        91} (/lib/libnss_nis-2.3.5.so)
       [ 9] 0x40029f8b {        91} (/lib/libnss_nis-2.3.5.so)
       [10] 0x40029efb {        91} (/lib/libnss_nis-2.3.5.so)
       [11] 0x40029bff {        91} (/lib/libnss_nis-2.3.5.so)
       [12] 0x401d18d3 {        91} (unassociated, typically .bss)
       [13] 0x401d156f {        91} (unassociated, typically .bss)
       [14] 0x401d120b {        91} (unassociated, typically .bss)
       [15] 0xbfffd76c {        91} (unassociated, typically .bss)
       16>

       16 potential matches were found, many of them are clearly unrelated, as they're part of unrelated libraries (libnss_nis.so). We could  make
       scanmem  eliminate  these  manually using the delete command, however just waiting until the amount of gold changes and telling scanmem the
       new value should be enough. I find some more gold, and tell scanmem the new value, 112.

       16> 112
       info: we currently have 1 matches.
       info: match identified, use "set" to modify value.
       info: enter "help" for other commands.
       1> list
       [ 0] 0x081d6d88 {       112} (unassociated, typically .bss)

       Only one of the 16 original candidates now have the value 112, so this must be where the amount of gold is stored. I'll try setting  it  to
       10,000 pieces.

       1> set 10000
       info: setting *0x081d6d88 to 10000...
       1>

       The resulting nethack status:

       Dlvl:1  $:10000 HP:15(15) Pw:2(2) AC:7  Exp:1

NOTES
       scanmem has been tested on multiple large programs, including the 3d shoot-em-up quake3 linux.

       Obviously, scanmem can crash your program if used incorrectly.

       Some programs store values in multiple locations, this is why set will change all known matches.

BUGS
       The  first  scan  can  be very slow on large programs, this is not a problem for subsequent scans as huge portions of the address space are
       usually eliminated. This could be improved in future, perhaps by assuming all integers are aligned by default. Suggestions welcome.

       The snapshot command uses memory inefficiently, and should probably not be used on large programs.  In future this will use a more intelli‐
       gent format.

HOMEPAGE
       http://code.google.com/p/scanmem/

AUTHORS
       Tavis Ormandy <taviso(a)sdf.lonestar.org> http://taviso.decsystem.org/
       Eli   Dupree  <elidupree(a)charter.net>
       WANG  Lu      <coolwanglu(a)gmail.com>

       All bug reports, suggestions or feedback welcome.

SEE ALSO
       gdb(1) ptrace(2) nethack(6) pidof(8)

version 0.08                                                     January 01, 2010                                                       scanmem(1)
