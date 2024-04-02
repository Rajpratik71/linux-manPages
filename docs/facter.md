FACTER(8)                                                                                                                                                                                           FACTER(8)



NAME
       facter - Gather system information

SYNOPSIS
       Collect and display facts about the system.

USAGE
       facter [--color] [--config] [--custom-dir DIR] [-d|--debug] [--external-dir DIR] [--help]
         [-j|--json] [--list-block-groups] [--list-cache-groups] [-l|--log-level LEVEL (=warn)]
         [--no-block] [--no-cache] [--no-color] [--no-custom-facts] [--no-external-facts]
         [--trace] [--verbose] [-v|--version] [-y|--yaml] [--strict] [fact] [fact] [...]

DESCRIPTION
       Collect and display facts about the current system. The library behind Facter is easy to extend, making Facter an easy way to collect information about a system.

       If no queries are given, then all facts will be returned.

       Many of the command line options can also be set via the HOCON config file. This file can also be used to block or cache certain fact groups.

OPTIONS
             --color                      Enable color output.
             --config                     A custom location for the config file.
             --custom-dir arg             A directory to use for custom facts.
       -d, [ --debug ]                    Enable debug output.
             --external-dir arg           A directory to use for external facts.
             --help                       Print help and usage information.
       -j, [ --json ]                     Output facts in JSON format.
             --list-block-groups          List the names of all blockable fact groups.
             --list-cache-groups          List the names of all cacheable fact groups.
             --show-legacy                Show legacy facts when querying all facts.
       -l, [ --log-level ] arg (=warn)    Set logging level.
                                          Supported levels are: none, trace, debug,
                                          info, warn, error, and fatal.
             --no-block                   Disable fact blocking.
             --no-cache                   Disable fact caching.
             --no-color                   Disable color output.
             --no-custom-fact             Disable custom facts.
             --no-external-facts          Disable external facts.
             --no-ruby                    Disable loading Ruby, facts requiring Ruby, and custom facts.
             --trace                      Enable backtraces for custom facts.
             --verbose                    Enable verbose (info) output.
       -v, [ --version ]                  Print the version and exit.
       -y, [ --yaml ]                     Output facts in YAML format.

FILES
       /etc/puppetlabs/facter/facter.conf
              A HOCON config file that can be used to specify directories for custom and external facts, set various command line options, and specify facts to block. See example below for details, or visit the GitHub README.

EXAMPLE
       Display all facts:



           $ facter
           disks => {
             sda => {
               model => "Virtual disk",
               size => "8.00 GiB",
               size_bytes => 8589934592,
               vendor => "ExampleVendor"
             }
           }
           dmi => {
             bios => {
               release_date => "06/23/2013",
               vendor => "Example Vendor",
               version => "6.00"
             }
           }
           [...]



       Display a single structured fact:



           $ facter processors
           {
             count => 2,
             isa => "x86_64",
             models => [
               "Intel(R) Xeon(R) CPU E5-2680 v2 @ 2.80GHz",
               "Intel(R) Xeon(R) CPU E5-2680 v2 @ 2.80GHz"
             ],
             physicalcount => 2
           }



       Display a single fact nested within a structured fact:


           $ facter processors.isa
           x86_64



       Display  a  single  legacy  fact. Note that non-structured facts existing in previous versions of Facter are still available, but are not displayed by default due to redundancy with newer structured
       facts:


           $ facter processorcount
           2



       Format facts as JSON:



           $ facter --json os.name os.release.major processors.isa
           {
             "os.name": "Ubuntu",
             "os.release.major": "14.04",
             "processors.isa": "x86_64"
           }



       An example config file.



           # always loaded (CLI and as Ruby module)
           global : {
               external-dir : "~/external/facts",
               custom-dir   :  [
                  "~/custom/facts",
                  "~/custom/facts/more-facts"
               ],
               no-external-facts : false,
               no-custom-facts   : false,
               no-ruby           : false
           }
           # loaded when running from the command line
           cli : {
               debug     : false,
               trace     : true,
               verbose   : false,
               log-level : "info"
           }
           # always loaded, fact-sepcific configuration
           facts : {
               # for valid blocklist entries, use --list-block-groups
               blocklist : [ "file system", "EC2" ],
               # for valid time-to-live entries, use --list-cache-groups
               ttls : [ { "timezone" : 30 days } ]
           }



AUTHOR
       Luke Kanies

COPYRIGHT
       Copyright (c) 2011-2015 Puppet Labs, Inc Licensed under the Apache 2.0 license




                                                                                                  April 2015                                                                                        FACTER(8)
