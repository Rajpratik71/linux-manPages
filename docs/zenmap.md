ZENMAP(1)                                                     Zenmap Reference Guide                                                     ZENMAP(1)

NAME
       zenmap - Graphical Nmap frontend and results viewer

SYNOPSIS
       zenmap [options] [results file]

DESCRIPTION
       Zenmap is a multi-platform graphical Nmap frontend and results viewer. Zenmap aims to make Nmap easy for beginners to use while giving
       experienced Nmap users advanced features. Frequently used scans can be saved as profiles to make them easy to run repeatedly. A command
       creator allows interactive creation of Nmap command lines. Scan results can be saved and viewed later. Saved scan results can be compared
       with one another to see how they differ. The results of recent scans are stored in a searchable database.

       This man page only describes the few Zenmap command-line options and some critical notes. A much more detailed Zenmap User's Guide is
       available at https://nmap.org/book/zenmap.html. Other documentation and information is available from the Zenmap web page at
       https://nmap.org/zenmap/.

OPTIONS SUMMARY
       -f, --file results file
           Open the given results file for viewing. The results file may be an Nmap XML output file (.xml, as produced by nmap -oX) or a Umit scan
           results file (.usr). This option may be given more than once.

       -h, --help
           Show a help message and exit.

       -n, --nmap Nmap command line
           Run the given Nmap command within the Zenmap interface. After -n or --nmap, every remaining command line argument is read as the
           command line to execute. This means that -n or --nmap must be given last, after any other options. Note that the command line must
           include the nmap executable name: zenmap -n nmap -sS target.

       -p, --profile profile
           Start with the given profile selected. The profile name is just a string: "Regular scan". If combined with -t, begin a scan with the
           given profile against the specified target.

       -t, --target target
           Start with the given target. If combined with -p, begin a scan with the given profile against the specified target.

       -v, --verbose
           Increase verbosity (of Zenmap, not Nmap). This option may be given multiple times to get even more verbosity.

       Any other arguments are taken to be the names of results files to open.

ENVIRONMENT VARIABLES
       ZENMAP_DEVELOPMENT
           Set ZENMAP_DEVELOPMENT to disable automatic crash reporting.

BUGS
       Like their authors, Nmap and Zenmap aren’t perfect. But you can help make them better by sending bug reports or even writing patches. If
       Nmap or Zenmap doesn’t behave the way you expect, first upgrade to the latest version available from https://nmap.org. If the problem
       persists, do some research to determine whether it has already been discovered and addressed. Try Googling the error message or browsing
       the nmap-dev archives at http://seclists.org/. Read this full manual page as well. If nothing comes of this, mail a bug report to
       <dev@nmap.org>. Please include everything you have learned about the problem, as well as what version of Zenmap you are running and what
       operating system version it is running on. Problem reports and Zenmap usage questions sent to dev@nmap.org are far more likely to be
       answered than those sent to Fyodor directly.

       Code patches to fix bugs are even better than bug reports. Basic instructions for creating patch files with your changes are available at
       https://svn.nmap.org/nmap/HACKING. Patches may be sent to nmap-dev (recommended) or to Fyodor directly.

HISTORY
       Zenmap was originally derived from Umit, an Nmap GUI created during the Google-sponsored Nmap Summer of Code in 2005 and 2006. The primary
       author of Umit was Adriano Monteiro Marques. When Umit was modified and integrated into Nmap in 2007, it was renamed Zenmap.

AUTHORS
   Nmap
       Fyodor <fyodor@nmap.org> (http://insecure.org)

       Hundreds of people have made valuable contributions to Nmap over the years. These are detailed in the CHANGELOG file which is distributed
       with Nmap and also available from https://nmap.org/changelog.html.

   Umit
       Zenmap is derived from the Umit Nmap frontend, which was started by Adriano Monteiro Marques as an Nmap/Google Summer of Code project
       (<py.adriano@gmail.com>, http://www.umitproject.org).

Zenmap                                                              03/15/2018                                                           ZENMAP(1)
