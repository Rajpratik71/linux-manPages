BULK_EXTRACTOR(1)                      General Commands Manual                      BULK_EXTRACTOR(1)

NAME
       bulk_extractor - Scans a disk image for regular expressions and other content.

SYNOPSIS
       bulk_extractor -o output_dir [options] [ image | -R dir ]

DESCRIPTION
       bulk_extractor  scans a disk image (or any other file) for a large number of pre-defined regu‐
       lar expressions and other kinds of content. These items are called features.  When it finds  a
       feature, bulk_extractor writes the output to an output file. Each line of the output file con‐
       tains a byte offset at which the feature was found, a tab, and the  actual  feature.  Features
       therefore cannot contain the end-of-line character.

       bulk_extractor  includes  native support for EnCase (.E01) and AFFLIB (.aff) files, if it com‐
       piled and linked on a system containing those libraries. Alternatively, the -R option  can  be
       used  to  recursively  scan and process a directory of individual files (disk images in such a
       directory will be treated as files, not as disk images).

       bulk_extractor is multi-threaded. By specifying the -j option, multiple copies of the  program
       can  be run. Each thread writes its results into its own feature file. The files are then com‐
       bined by the primary thread when all of the secondary threads complete.

       bulk_extractor is a two-phase program. In phase 1 the features are extracted.  In  phase  2  a
       histogram is created of relevant features.

       bulk_extractor  will also create a wordlist of all the words that are found in the disk image.
       This can be used as a dictionary for cracking encryption.

       The options are as follows:

       -o outdir
              Specifies the output directory, which will be created by bulk_extractor  if  necessary.
              If the output directory contains data from a partial bulk_extractor run, bulk_extractor
              will attempt to resume where the previous run left off.

       -b bannerfile.txt
              Read the contents of bannerfile.txt and stamp it at the beginning of each output  file.
              This  might  be useful if you have some kind of privacy banner that needs to be stamped
              at the top of all of your files.

       -r alert_list.txt
              Specifies an alert list, (or red list), which is a list of terms that, if  found,  will
              be  specifically  flagged  in  a special alert file that begins with the letters ALERT.
              The alert list may contain individual terms, which must be found in their entirity  and
              are  case-sensitive,  or  wildcards  with  standard Unix globbing (e.g. *@company.com).
              Globbed terms are case-insensitive.

       -w stop_list.txt
              Specifies a stop list, (or white list), which is a list of terms that, if  found,  will
              be  placed  in a special stopped file (rather than in the main file). The whitelist may
              also contain globbed terms.

       -s frac[:passes]
              Specify random sampling parameters.

       -p path/format
              Open a disk image and print the information found at path.   The  format  specification
              may be r for raw output and h for hex output.
              Specify -p - for interactive mode.
              Specify -p -http for HTTP mode.

       -F <rfile>
              Specifies a file of regular expressions to be used as search terms.

       -f <regex>
              Specifies a regular expression to be used as a search term.

       -q nn  Quiet mode. Only prints every nn status reports.
              Specify -1 for no status.

       -Wn1:n2
              The  scan_wordlist scanner should only extract words that are between n1 and n2 charac‐
              ters in length.

TUNING
       These commands are useful for tuning operation:

       -C NN  Specifies the size of the context window.

       -S fr:<name>:window=NN
              specifies context window for recorder <name> to NN.

       -S fr:<name>:window_before=NN
              specifies context window after to NN for recorder <name>

       -S fr:<name>:window_after=NN
              specifies context window before to NN for recorder <name>

       -G NN  specify the page size

       -g NN  Specifies the size of the margin in bytes.

       -j NN  Use n threads for analysis. Normally you do not need specify this, as  the  default  is
              the number of processors on the current computer.

       -m NN  Have  bulk_extractor wait at most NN minutes for scanners to finish after all data have
              been read.

DEBUGGING
       The following commands are useful for debugging:

       -V     Print the version number

       -R outdir
              Restarts the program from where it left off for a particular directory.

       -B nn  Set the dedup Bloom filter to nn bits. This is used by the scan_wordlist scanner.

       -M nn  Specifies a maximum recursion depth of nn.

       -z pagenum
              Start on page number pagenum.

       -Y <o1>[-<o2>]
              Start at input offset o1 optionally ending at offset o2

       -dN    Enable debugging level N.

SCANNER CONTROL
       Finally, you can control scanners with these options:

       -P <dir>
              Specifies a directory in which to find plugins.

       -E scanner
              Turns off all scanners, then enabled scanner scanner.

       -e scanner
              Enables a scanner.

       -x scanner
              Disables a scanner.

HISTORY
       bulk_extractor is based on a feature extractor and named entity recognizer developed for SBook
       in  1991.  The  feature  extractor  was  repurposed  for  disk images in 2003. The stand-alone
       bulk_extractor program was rewritten in 2005 and publicly released in 2007. The multi-threaded
       bulk_extractor was released in May 2010.

AUTHOR
       Simson Garfinkel <simsong@acm.org>

User Manuals                                   OCT 2013                             BULK_EXTRACTOR(1)
