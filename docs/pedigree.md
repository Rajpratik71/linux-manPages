pedigree(1)                                                                User Contributed Perl Documentation                                                                pedigree(1)

NAME
       pedigree - create a TeX file for pedigree from a csv file

SYNOPSIS
       pedigree [-c configuration_file] [-d] [-o output_file] [-s start_id] input_file

       pedigree -v

DESCRIPTION
       The program converts a comma separated input_file into a TeX file with pst-pdgr macros.

OPTIONS
       -c configuration_file
           The configuration file to read along with the system-wide and user's configuration files

       -d  Debug mode on

       -o -output_file
           The ouput file instead of input_file.tex

       -s -start_id
           If this option is selected, the pedigree is constructed starting from the node with the Id i<start_id>. Otherwise it is started from the proband node.

           This option allows to create pedigrees with multiple probands or absent probands, or show people who are not proband's relatives.

       -v  Print version information

FILES
       /etc/pedigree.cfg
           Global configuration file

       $HOME/.pedigreerc
           User configuration file

SEE ALSO
       The manual distributed with this program describes the format of the configuration file and the input file.

       The library functions are described in Pedigree::Language(3), Pedigree::Parser(3), Pedigree::Node(3), Pedigree::PersonNode(3), Pedigree::MarriageNode(3), Pedigree::Area(3).

AUTHOR
       Boris Veytsman, Leila Akhmadeeva, 2006-2012

perl v5.10.0                                                                            2012-04-14                                                                            pedigree(1)
