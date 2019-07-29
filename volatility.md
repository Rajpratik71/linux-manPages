volatility(1)                                           advanced memory forensics framework                                          volatility(1)

NAME
       volatility - advanced memory forensics framework

SYNOPSIS
       volatility [option]
       volatility -f [image] --profile=[profile] [plugin]

DESCRIPTION
       The  Volatility  Framework is a completely open collection of tools for the extraction of digital artifacts from volatile memory (RAM) sam‐
       ples. It is useful in forensics analysis. The extraction techniques are performed completely independent of the system  being  investigated
       but offer unprecedented visibility into the runtime state of the system.

       Currently, Volatility (version 2.6) supports several versions of the MS Windows, Linux and MAC OSX:

              ·  32-bit Windows XP Service Pack 2 and 3

              ·  32-bit Windows 2003 Server Service Pack 0, 1, 2

              ·  32-bit Windows Vista Service Pack 0, 1, 2

              ·  32-bit Windows 2008 Server Service Pack 1, 2 (there is no SP0)

              ·  32-bit Windows 7 Service Pack 0, 1

              ·  32-bit Windows 8, 8.1, and 8.1 Update 1

              ·  32-bit Windows 10 (initial support)

              ·  64-bit Windows XP Service Pack 1 and 2 (there is no SP0)

              ·  64-bit Windows 2003 Server Service Pack 1 and 2 (there is no SP0)

              ·  64-bit Windows Vista Service Pack 0, 1, 2

              ·  64-bit Windows 2008 Server Service Pack 1 and 2 (there is no SP0)

              ·  64-bit Windows 2008 R2 Server Service Pack 0 and 1

              ·  64-bit Windows 7 Service Pack 0 and 1

              ·  64-bit Windows 8, 8.1, and 8.1 Update 1

              ·  64-bit Windows Server 2012 and 2012 R2

              ·  64-bit Windows 10 (including at least 10.0.14393)

              ·  64-bit Windows Server 2016 (including at least 10.0.14393.0)

              ·  32-bit Linux kernels 2.6.11 to 4.2.3

              ·  64-bit Linux kernels 2.6.11 to 4.2.3

              ·  32-bit 10.5.x Leopard (the only 64-bit 10.5 is Server, which isn't supported)

              ·  32-bit 10.6.x Snow Leopard

              ·  64-bit 10.6.x Snow Leopard

              ·  32-bit 10.7.x Lion

              ·  64-bit 10.7.x Lion

              ·  64-bit 10.8.x Mountain Lion (there is no 32-bit version)

              ·  64-bit 10.9.x Mavericks (there is no 32-bit version)

              ·  64-bit 10.10.x Yosemite (there is no 32-bit version)

              ·  64-bit 10.11.x El Capitan (there is no 32-bit version)

              ·  64-bit 10.12.x Sierra (there is no 32-bit version)

       The memory formats supported are:

              ·  Raw linear sample (dd)

              ·  Hibernation file (from Windows 7 and earlier)

              ·  Crash dump file

              ·  VirtualBox ELF64 core dump

              ·  VMware saved state and snapshot files

              ·  EWF format (E01)

              ·  LiME format

              ·  Mach-O file format

              ·  QEMU virtual machine dumps

              ·  Firewire

              ·  HPAK (FDPro)

       The supported address spaces (RAM types) are:

              ·  AMD64PagedMemory - Standard AMD 64-bit address space.

              ·  ArmAddressSpace - Address space for ARM processors.

              ·  FileAddressSpace - This is a direct file AS.

              ·  HPAKAddressSpace - This AS supports the HPAK format.

              ·  IA32PagedMemory - Standard IA-32 paging address space.

              ·  IA32PagedMemoryPae - This class implements the IA-32 PAE paging address space. It is responsible.

              ·  LimeAddressSpace - Address space for Lime.

              ·  LinuxAMD64PagedMemory - Linux-specific AMD 64-bit address space.

              ·  MachOAddressSpace - Address space for mach-o files to support atc-ny memory reader.

              ·  OSXPmemELF - This AS supports VirtualBox ELF64 coredump format.

              ·  QemuCoreDumpElf - This AS supports Qemu ELF32 and ELF64 coredump format.

              ·  VMWareAddressSpace - This AS supports VMware snapshot (VMSS) and saved state (VMSS) files.

              ·  VMWareMetaAddressSpace - This AS supports the VMEM format with VMSN/VMSS metadata.

              ·  VirtualBoxCoreDumpElf64 - This AS supports VirtualBox ELF64 coredump format.

              ·  Win10AMD64PagedMemory - Windows 10-specific AMD 64-bit address space.

              ·  WindowsAMD64PagedMemory - Windows-specific AMD 64-bit address space.

              ·  WindowsCrashDumpSpace32 - This AS supports windows Crash Dump format.

              ·  WindowsCrashDumpSpace64 - This AS supports windows Crash Dump format.

              ·  WindowsCrashDumpSpace64BitMap - This AS supports Windows BitMap Crash Dump format.

              ·  WindowsHiberFileSpace32 - This is a hibernate address space for windows hibernation files.

       There are RAM images for tests at https://github.com/volatilityfoundation/volatility/wiki/Memory-Samples.

OPTIONS
       -h, --help
              List all available options and their default values.  Default values may be set in the configuration file (/etc/volatilityrc).

       --conf-file=/root/.volatilityrc
              User based configuration file.

       -d, --debug
              Debug Volatility.

       --plugins=PLUGINS
              Additional plugin directories to use (colon separated).

       --info Print information about all registered objects.

       --cache-directory=/root/.cache/volatility
              Directory where cache files are stored.

       --cache
              Use caching.

       --tz=TZ
              Sets the timezone for displaying timestamps.

       -f FILENAME, --filename=FILENAME
              Filename to use when opening an image.

       --profile=WinXPSP2x86
              Name of the profile to load.

       -l LOCATION, --location=LOCATION
              An URN location from which to load an address space.

       -w, --write
              Enable write support.

       --dtb=DTB
              DTB Address.

       --shift=SHIFT
              Mac KASLR shift address.

       --output=text
              Output in this format (format support is module specific).

       --output-file=OUTPUT_FILE
              Write output in this file.

       -v, --verbose
              Verbose information.

       -g KDBG, --kdbg=KDBG
              Specify a specific KDBG virtual address.

       -k KPCR, --kpcr=KPCR
              Specify a specific KPCR address.

       --force
              Force utilization of suspect profile.

       --cookie=COOKIE
              Specify the address of nt!ObHeaderCookie (valid for Windows 10 only).

PLUGINS AND PROFILES
       The  supported  plugin commands and profiles can be viewed if using the command '$ volatility --info'.  Note that Linux and MAC OSX allowed
       plugins will have the 'linux_' and 'mac_' prefixes. Plugins without these prefixes were designed for MS Windows.

       Profiles are maps used by Volatility to understand the operational systems. The allowed MS Windows profiles are provided by the Volatility.

       You must create your own profiles for Linux and MAC OSX. For this, on Debian systems, read the README.Debian file provided  by  volatility-
       tools package.

       On MS Windows, to determine the OS type, you can use:

           $ volatility -f <image> imageinfo

           or

           $ volatility -f <image> kdbgscan

ENVIRONMENT VARIABLES
       On a GNU/Linux or OS X system, these variables can be set:

              ·  VOLATILITY_PROFILE - Specifies a profile to be used as default, making unnecessary a '--profile' option.

              ·  VOLATILITY_LOCATION - Specifies the path of an image. So, the Volatility command will not need a file name via '-f' option.

              ·  VOLATILITY_KDBG - Specifies a KDBG address. See EXTRA PROCEDURES to more details.

       Other  plugin  flags  may  be  utilized  in this way, for example KPCR, DTB or PLUGINS. When exporting variables, simply prefix VOLATILITY_
       before the flag name (e.g. VOLATILITY_KPCR). Otherwise, the flag name remains the same when adding it to the configuration file.

       If you have a path with a space or more in the name, spaces should be replaced with %20 instead (e.g. LOCATION=file:///tmp/my%20image.img).

       Example:

           $ export VOLATILITY_PROFILE=Win7SP0x86
           $ export VOLATILITY_LOCATION=file:///tmp/myimage.img
           $ export VOLATILITY_KDBG=0x82944c28

CONFIGURATION FILES
       Configuration files are typically 'volatilityrc' in the current directory or '~/.volatilityrc' in user's home directory, or at user  speci‐
       fied path, using the --conf-file option. An example of the file contents is shown below:

           [DEFAULT]
           PROFILE=Win7SP0x86
           LOCATION=file:///tmp/myimage.img
           KDBG=0x82944c28

       Other  plugin  flags  may  be  utilized  in this way, for example KPCR, DTB or PLUGINS. When exporting variables, simply prefix VOLATILITY_
       before the flag name (e.g. VOLATILITY_KPCR). Otherwise, the flag name remains the same when adding it to the configuration file.

       If you have a path with a space or more in the name, spaces should be replaced with %20 instead (e.g. LOCATION=file:///tmp/my%20image.img).

EXTRA PROCEDURES
       Setting a timezone

          Timestamps extracted from memory can either be in system-local time, or in Universal Time
          Coordinates (UTC). If they're in UTC, Volatility can be instructed to display them in a time zone
          of the analyst's choosing. To choose a timezone, use one of the standard timezone names
          (such as America/Sao_Paulo, Europe/London, US/Eastern or most Olson timezones) with the --tz=TIMEZONE flag.

          Volatility attempts to use pytz if installed, otherwise it uses tzset.

          Please note that specifying a timezone will not affect how system-local times are displayed. If you identify
          a time that you know is UTC-based, please file it as an issue in the issue tracker. By default the _EPROCESS
          CreateTime and ExitTime timestamps are in UTC.

       Setting the DTB

          The DTB (Directory Table Base) is what Volatility uses to translate virtual addresses to physical addresses.
          By default, a kernel DTB is used (from the Idle/System process). If you want to use a different process's DTB
          when accessing data, supply the address to --dtb=ADDRESS.

       Setting the KDBG address (this is a Windows-only option)

          Volatility scans for the '_KDDEBUGGER_DATA64' structure using hard-coded signatures "KDBG" and a series of sanity
          checks. These signatures are not critical for the operating system to function properly, thus malware can overwrite
          them in attempt to throw off tools that do rely on the signature. Additionally, in some cases there may be more
          than one '_KDDEBUGGER_DATA64' (for example if you apply a major OS update and don't reboot), which can cause confusion
          and lead to incorrect process and module listings, among other problems. If you know the address
          add '_KDDEBUGGER_DATA64', you can specify it with --kdbg=ADDRESS and this override the automated scans. For more
          information, see the kdbgscan plugin.

       Setting the KPCR address (this is a Windows-only option)

          There is one KPCR (Kernel Processor Control Region) for each CPU on a system. Some Volatility plugins display
          per-processor information. Thus if you want to display data for a specific CPU, for example CPU 3 instead of
          CPU 1, you can pass the address of that CPU's KPCR with --kpcr=ADDRESS. To locate the KPCRs for all CPUs, see
          the kpcrscan plugin. Also note that starting in Volatility 2.2, many of the plugins such as idt and gdt
          automatically iterate through the list of KPCRs.

       Enabling write support

          Write support in Volatility should be used with caution. Therefore, to actually enable it, you must not only type
          --write on command-line but you must type a 'password' in response to a question that you'll be prompted with.
          In most cases you will not want to use write support since it can lead to corruption or modification of data in
          your memory dump. However, special cases exist that make this feature really interesting. For example, you could
          cleanse a live system of certain malware by writing to RAM over firewire, or you could break into a locked workstation
          by patching bytes in the winlogon DLLs.

       Specifying additional plugin directories

          Volatility's plugin architecture can load plugin files from multiple directories at once. In the Volatility source
          code, most plugins are located in volatility/plugins. However, there is another directory (volatility/contrib)
          which is reserved for contributions from third party developers, or weakly supported plugins that simply aren't
          enabled by default. To access these plugins you just type --plugins=contrib/plugins on command-line. It also enables
          you to create a separate directory of your own plugins that you can manage without having to add/remove/modify files
          in the core Volatility directories.

       Notes:

          On Debian systems, the contrib/plugins directory is at /usr/share/volatility/contrib/plugins.

          Subdirectories will also be traversed as long as there is an __init__.py file (which can be empty) within them.

          The parameter to --plugins can also be a zip file containing the plugins such as --plugins=myplugins.zip.
          Due to the way plugins are loaded, the external plugins directory or zip file must be specified before any
          plugin-specific arguments (including the name of the plugin). Example:

           $ volatility --plugins=contrib/plugins -f XPSP3x86.vmem example

       Choosing an output format

          By default, plugins use text renderers to standard output. If you want to redirect to a file, you can of course
          use the console's redirection (i.e. > out.txt) or you could use --output-file=out.txt. The reason you can also
          choose --output=FORMAT is for allowing plugins to also render output as HTML, JSON, SQL, or whatever you choose.
          However, there are no plugins with those alternate output formats pre-configured for use, so you'll need to add
          a function named render_html, render_json, render_sql, respectively to each plugin before using --output=HTML.

       Plugin specific options

          Many plugins accept arguments of their own, which are independent of the global options. To see the list of
          available options, type both the plugin name and -h/--help on command-line.

           $ volatility dlllist -h

       Debug mode

          If something isn't happening in Volatility the expected way, try to run the command with -d/--debug.
          This will enable the printing of debug messages to standard error. To more debug levels, as in using
          pdb debugger), add -d -d -d to command.

       Using Volatility as a library

          Although its possible to use Volatility as a library, (there are plans to support it better in the future).
          Currently, to import Volatility from a python script, the following example code can be used:

           $ python
           >>> import volatility.conf as conf
           >>> import volatility.registry as registry
           >>> registry.PluginImporter()
           <volatility.registry.PluginImporter object at 0x7f9608f3ac10>
           >>> config = conf.ConfObject()
           >>> import volatility.commands as commands
           >>> import volatility.addrspace as addrspace
           >>> registry.register_global_options(config, commands.Command)
           >>> registry.register_global_options(config, addrspace.BaseAddressSpace)
           >>> config.parse_options()
           >>> config.PROFILE="WinXPSP2x86"
           >>> config.LOCATION = "file:///media/memory/private/image.dmp"
           >>> import volatility.plugins.taskmods as taskmods
           >>> p = taskmods.PSList(config)
           >>> for process in p.calculate():
           ...   print process

EXAMPLES
       To see all available plugins, profiles, scanner checks and address spaces:

           $ volatility --info

       To list all active processes found in a MS Windows 8 SP0 image:

           $ volatility -f win8.raw --profile=Win8SP0x86 pslist

       To list all active processes found in a MS Windows 8 SP0 image, using a timezone:

           $ volatility -f win8.raw --profile=Win8SP0x86 pslist --tz=America/Sao_Paulo

       To show the kernel buffer from a Linux 3.2.63 image:

           $ volatility -f mem.dd --profile=Linux_3_2_63_x64 linux_dmesg

NOTES
       This manpage was based in some tests and several official documents about Volatility.  For other information and tutorials, see:

       ·  http://www.volatilityfoundation.org

       ·  https://github.com/volatilityfoundation/volatility/wiki

AUTHOR
       Volatility was written by Volatility Foundation and several contributors. For contact, use the email <info@volatilityfoundation.org>.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

volatility-2.6                                                      01 Jan 2017                                                      volatility(1)
