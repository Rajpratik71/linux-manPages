awffull(1)                                                                                                                              awffull(1)

NAME
       AWFFull - A Webalizer Fork, Full o' features

SYNOPSIS
       awffull [...] [log-file]

DESCRIPTION
       AWFFull  is  a web server log analysis program based on The Webalizer.  AWFFull produces usage statistics in HTML format for viewing with a
       browser. The results are presented in both columnar and graphical format, which facilitates  interpretation.  Yearly,  monthly,  daily  and
       hourly  usage  statistics  are  presented, along with the ability to display usage by site, URL, referrer, user agent (browser), user name,
       search strings, entry/exit pages, and country (some information may not be available if not present in the log file being processed).

       AWFFull supports the following log formats shown in the following variable list:

       CLF    (common log format) log files

       Combined
              log formats as defined by NCSA and others, and variations of these which it attempts to handle intelligently

       xferlog
              wu-ftpd formatted log files allowing analysis of ftp servers, and squid proxy logs.
              Note

              Logs may also be compressed, via gzip. If a compressed log file is detected, it will be automatically uncompressed while it is read.
              Compressed logs must have the standard gzip extension of .gz.

       This documentation applies to AWFFull Version 3.8.2

CHANGES FROM WEBALIZER
       AWFFull is based on The Webalizer code and has a number of large and small changes.  These include:

       · Beyond the raw statistics: Making use of published formulae to provide additional insights into site usage

       · GeoIP IP Address look-ups for more accurate country detection

       · Resizable graphs

       · Integration with GNU gettext allowing for ease of translations.  Currently 32 languages are supported.

       · Display more than 12 months of the site history on the front page.

       · Additional page count tracking and sort by same.

       · Some minor visual tweaks, including Geolizer's use of Kb, Mb etc for Volumes

       · Additional Pie Charts for URL counts, Entry and Exit Pages, and Sites

       · Horizontal lines on graphs that are more sensible and easier to read

       · User Agent and Referral tracking is now calculated via PAGES not HITS

       · GNU style long command line options are now supported (eg --help)

       · Can choose what is a page by excluding ‘what isn't’ vs the original ‘what is’ method

       · Requests to the site being analysed are displayed with the matching referring URL

       · A Table of 404 Errors, and the referring URL can be generated

       · An external CSS file can be used with the generated html

       · Manual performance optimisation of the config file is now easier with a post analysis summary output

       · Specified IP Addresses can be assigned to a given country

       · Additional Dump options for detailed analysis with other tools

       · Lotus Domino v6 logs are now detected and processed

       Additional changes and improvements are planned and undergoing implementation. See the TODO file for details.

NEW REPORT MEASUREMENTS
       With version 3.8.1 of AWFFull, several new measured results have been added to the detailed report monthly page.

       Single Access
              Single Access Pages - the only page seen within a given visit

       Stickiness
              How useful a given entry page is to draw Visitors deeper into your site

       Popularity
              The Ratio of Page Entries to Page Exits

       These  metrics  can  help towards improving insight in the usage of the processed web site. And hence allow the site owner to make positive
       change to make the site more useful to site visitors. All three metrics appear in the ‘Entry Pages’ Report. ‘Popularity’  is  also  on  the
       ‘Exit Pages’ Report.

       Single Access

       More  completely: ‘Single Access Pages’. This is a report on the number of times that a given page was the only page viewed within a Visit.
       Or in English, Someone came to your website. They only viewed one page. The number is the cumulative count of people who did this for  that
       particular  page.  Why  is this useful? Identifying those entry pages that don't draw visitors deeper into your site. Or seeing entry pages
       that shouldn't be entry pages. It's also a reality check against the next two values which are calculated from this number. The number gen‐
       erated should be a subset of the ‘Entry Page Views’ and/or ‘Exit Page Views’ metric. If it isn't? Let me know, we have a bug. :-)

       Stickiness

       Is calculated as 1 - (Single Access / Entry Page Views) expressed as a percentage. In essence Stickiness describes how useful a given entry
       page is to draw Visitors deeper into your site. The stickier the page, the more folk are caught by it. :-) The closer to 100%  the  better.
       Generally.   Certain pages within YOUR website may not make sense to have a high stickiness or even > 5%. This measurement is a clue to un‐
       derstanding how your site is used, it is not a rule. How is this useful? How and where are people entering your web site.  Does  that  make
       sense? Should it be here or there? What can you change to fix this and hence improve their use of your website.

       Popularity

       Popularity  is  the Ratio of Page Entries to Page Exits. o If it equals 1.0? Then the number of visitors to your site who started with that
       page, equals the number who left at that page. o If greater then 1.0, then more people entered here then left. o If less then 0? More  peo‐
       ple  left from here then entered. I personally find this metric one of the more useful "At a Glance: How are Pages Performing" metrics. One
       of the difficulties with using this particular metric is that certain numbers will NOT make sense for YOUR site. In  that  a  natural  exit
       page  would  expect to have a very low Popularity. It's an exit page, not an entry page. So if an exit page has a high popularity, then you
       have a real problem. Likewise, a low Popularity for an entry page is unlikely to be a Good Thing(tm).

       "Where & Why?" All three of these metrics are covered very nicely in Hack #58 from "Web Site Measurement Hacks" [1]. Which is where, credit
       where credit due, the inspiration to add these metrics came from.

RUNNING AWFFULL
       AWFFull is designed to be run from a Unix command line prompt or as a crond(8) job.  There is no need to run with super-user privleges, and
       indeed, is preferable NOT to.

       Once executed, the general flow of the program is:

       A default configuration file is scanned for, /etc/awffull/awffull.conf and, if found, is used.

       Any command line arguments given to the program are parsed. This may include the specification of one or more  configuration  files,  which
       are processed at the time it is encountered.

       It  can  be  useful to have multiple config files. A master used for multiple sites, and individualised config files. Do be aware that last
       option set wins. So last config file, or if after a config file, command line options. Useful if you desire to send the output to an alter‐
       nate directory.

       If  a  log  file  was  specified, it is opened and made ready for processing. If no log file was given, STDIN is used for input. If the log
       filename '-' is specified, STDIN will be forced.

       If an output directory was specified, AWFFull changes to that directory in preparation for generating output. If no  output  directory  was
       given, the current directory is used.

       If no hostname was given, the program attempts to get the hostname using a uname(2) system call. If that fails, localhost is used.

       A  history  file is searched for in the current directory (output directory) and read if found. This file keeps totals for previous months,
       which is used in the main index.html HTML document. Note: The file location can now be specified with the HistoryName configuration option.

       If incremental processing was specified, a data file is searched for and loaded if found, containing the 'internal state' data of the  pro‐
       gram at the end of a previous run. Note: The file location can now be specified with the IncrementalName configuration option.

       Main  processing  begins on the log file. If the log spans multiple months, a separate HTML document is created for each month.  After main
       processing, the main index.html page is created, which has totals by month and links to each months HTML document.

       A new history file is saved to disk, which includes totals generated by AWFFull during the current run.

       If incremental processing was specified, a data file is written that contains the 'internal state' data at the end of this run.

INCREMENTAL PROCESSING
       Version 1.2x of The Webalizer added incremental run capability.  Simply put, this allows processing large log files by breaking them up in‐
       to smaller pieces, and processing these pieces instead. What this means in real terms is that you can now rotate your log files as often as
       you want, and still be able to produce monthly usage statistics without the loss of any detail. Basically, AWFFull saves and  restores  all
       internal  data  in a file named awffull.current. This allows the program to 'start where it left off' so to speak, and allows the preserva‐
       tion of detail from one run to the next. The data file is placed in the current output directory, and is a plain ASCII text file  that  can
       be viewed with any standard text editor. It's location and name may be changed using the IncrementalName configuration keyword.

       Some special precautions need to be taken when using the incremental run capability of AWFFull. Configuration options should not be changed
       between runs, as that could cause corruption of the internal data stored. For example, changing the MangleAgents level will cause different
       representations of user agents to be stored, producing invalid results in the user agents section of the report. If you need to change con‐
       figuration options, do it at the end of the month after normal processing of the previous month and before processing  the  current  month.
       You may also want to delete the awffull.current file as well.

       AWFFull  also  attempts  to prevent data duplication by keeping track of the timestamp of the last record processed. This timestamp is then
       compared to current records being processed, and any records that were logged previous to that timestamp  are  ignored.  This,  in  theory,
       should  allow  you  to  re-process logs that have already been processed, or process logs that contain a mix of processed/not yet processed
       records, and not produce duplication of statistics.

       The only time this may break is if you have duplicate timestamps in two separate log files. Any records in the second log file that do have
       the  same  timestamp  as the last record in the previous log file processed, will be discarded as if they had already been processed. There
       are lots of ways to prevent this however, for example, stopping the web server before rotating logs will prevent this situation, or using a
       tool  such  as cronolog (⟨http://cronolog.org/⟩).  This setup also necessitates that you always process logs in chronological order, other‐
       wise data loss will occur as a result of the timestamp compare.

REVERSE DNS LOOKUPS
       AWFFull no longer supports DNS lookups. Please use an external program such as DNShistory or DNSTran instead.

       · ⟨http://www.summary.net/soft/dnstran.html⟩

       · ⟨http://www.stedee.id.au/dnshistory⟩

       With version 3.7.1 of AWFFull, GeoIP capability can be used for improved country detection.

COMMAND LINE OPTIONS
       AWFFull supports many different configuration options that will alter the way the program behaves and generates output. Most of  these  can
       be specified on the command line, while some can only be specified in a configuration file. The command line options are listed below, with
       references to the corresponding configuration file keywords. See also awffull.conf(5).

       General Options

       -h, --help
              Display all available command line options and exit program

       -V, --version
              Display program version and exit program

       -v --verbose
              Verbosity Display debugging information for errors and warnings. Multiple v's will increase the amount of information displayed.

       --match_counts
              Display optimisation useful information pertaining to the number of matches against various Group, Hide and Ignore options.

       -i --ignore_history
              IgnoreHist Ignore history. USE WITH CAUTION.  This will cause AWFFull to ignore any previous monthly history file only.  Incremental
              data (if present) is still processed.

       -p --preserve_state
              Incremental Preserve internal data between runs.

       -T --timing
              TimeMe. Force display of timing information at end of processing.

       -c --config=FILE
              Use configuration file FILE

       -n NAME
              HostName. Use the hostname NAME.

       -o --output=DIR
              OutputDir. Use output directory DIR.

       -t NAME
              ReportTitle. Use NAME for report title.

       F --logtype=TYPE
              LogType. Specify log type to be processed.  Value can be one of: auto, clf, combined, domino, ftp or squid format. If not specified,
              will default to auto format. FTP logs must be in standard wu-ftpd xferlog format. A value of ‘auto’ states that the log format auto‐
              matically ascertained.

       -f --fold
              FoldSeqErr.  Fold  out  of  sequence log records back into analysis, by treating as if they were the same date/time as the last good
              record. Normally, out of sequence log records are simply ignored.

       -Y     CountryGraph. Suppress country graph.

       -G     HourlyGraph. Suppress hourly graph.

       -x NAME
              HTMLExtension. Defines the HTML file extension to use on the created report files. If not specified, defaults to html.  Do  not  in‐
              clude the leading period.

       -H     HourlyStats. Suppress hourly statistics.

       -L     GraphLegend. Suppress color coded graph legends.

       -l NUM GraphLines.  Use background lines. The number of lines and where to place are automatically calculated. For backwards compatibility,
              any number > 0 enables. Use zero ('0') to disable the lines.

       -P NAME
              PageType. Specify file extensions that are considered pages. Sometimes referred to as pageviews.

       -m NUM VisitTimeout. Specify the Visit timeout period. Specified in number of seconds. Default is 1800 seconds (30 minutes). Sometimes  re‐
              ferred to as sessions.

       -I NAME
              IndexAlias. Use the filename name as an additional alias for index.

       -M NUM MangleAgents. Mangle user agent names according to the mangle level specified by num.

              Mangle levels are:

              5 - Browser name and major version

              4 - Browser name, major and minor version

              3 - Browser name, major version, minor version to two decimal places

              2 - Browser name, major and minor versions and sub-version

              1 - Browser name, version and machine type if possible

              0 - All information (left unchanged).

       -g NUM GroupDomains.  Automatically group sites by domain. The grouping level specified by num can be thought of as 'the number of dots' to
              display in the grouping. The default value of 0 disables any domain grouping.

       Hide Options

       -a NAME
              HideAgent. Hide user agents matching name.

       -r NAME
              HideReferrer. Hide referrer matching name.

       -s NAME
              HideSite. Hide site matching name.

       -X NAME
              HideAllSites. Hide all individual sites (only display groups).

       -u NAME
              HideURL. Hide URL matching name.

       Table size options

       -A --top_agents=NUM
              TopAgents. Display the top num user agents table.

       -R --top_refers=NUM
              TopReferrers. Display the top num referrers table.

       -S --top_sites=NUM
              TopSites. Display the top num sites table.

       -U --top_urls=NUM
              TopURLs. Display the top num URL's table.

       -C --top_countries=NUM
              TopCountries. Display the top num countries table.

       -e --top_entry=NUM
              TopEntry. Display the top num entry pages table.

       -E --top_exit=NUM
              TopExit. Display the top num exit pages table.

       Other Options

       --use_geoip
              Enables the use of the Maxmind GeoIP capability for more accurate detection of countries.

              NOTE! Do not enable GeoIP if you analyse files that have had the IP Address translated to a Fully Qualified Host Name.   Use  either
              raw IP Addresses and GeoIP, or Names and disable GeoIP.  ie. Don't use GeoIP AND DNShistory.

       --match_counts
              Display  the  various  Group/Hide  etc Match Counts. This option is ideal for optimisation of the awffull.conf file. Just be careful
              with optimising Agents in particular, as the order is typically important.

CONFIGURATION FILES
       See the awffull.conf(5) man page for complete details of all configuration options.

       Configuration files are standard ASCII(7) text files that may be created or edited using any standard editor.

       Blank lines and lines that begin with a pound sign ('#') are ignored.

       Any other lines are considered to be configuration lines, and have the form ‘Keyword Value’, where the ‘Keyword’ is one  of  the  currently
       available configuration keywords (see awffull.conf(5)), and ‘Value’ is the value to assign to that particular option.

       Any  text found after the keyword up to the end of the line is considered the keyword's value, so you should not include anything after the
       actual value on the line that is not actually part of the value being assigned. The file sample.conf provided with  the  distribution  con‐
       tains lots of useful documentation and examples as well.

       Certain  "Keywords"  will accept a 2nd value. In those situations, the first value may be enclosed in double quotes (") to allow for white‐
       space.

SEE ALSO
       awffull.conf(5)

BUGS
       None currently known. YMMV....

       Report bugs to ⟨https://bugs.launchpad.net/awffull⟩, or use the email discussion list: <awffull@stedee.id.au>

NOTES
       In case it is not obvious: AWFFull is a play/pun on the word ‘awful’, and is pronounced the same way. Yes it was deliberate.

REFERENCES
       [1] Web Site Measurement Hacks. Eric T. Peterson (and others).  O'Reilly. ISBN 0-596-00988-7.

                                                                    2008-Dec-13                                                         awffull(1)
