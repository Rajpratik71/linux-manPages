REPORT-GTK(1)                                                                                  LIBREPORT MANUAL                                                                                 REPORT-GTK(1)



NAME
       report-gtk - GUI tool to analyze and report ABRT problems

SYNOPSIS
       report-gtk [-vpdx] [-e EVENT] [-g GUI_FILE] PROBLEM_DIR

DESCRIPTION
       report-gtk is a graphical tool that reports application crashes and other problems caught by abrtd daemon, or created by other programs using libreport. report-gtk works with a single problem saved
       in specified PROBLEM_DIR. In the expert mode it enables access to and manipulation of problem data.

OPTIONS
       -d, --delete
           Remove PROBLEM_DIR after reporting

       -e EVENT
           Run only theset EVENTs on PROBLEM_DIR

       -g FILE
           Alternate GUI file

       -p
           Add program names to log

       -v, --verbose
           Be verbose

       -V, --version
           Display version and exit

       -x, --expert
           Enabled advanced features

CONFIGURATION
   Reporting work flow configuration
       These configuration files are placed in /usr/share/libreport/workflows.

       Each file has XML formatting with the following DTD:

           <!ELEMENT workflow    (name+,description+,events*)>
           <!ELEMENT name        (#PCDATA)>
           <!ATTLIST name         xml:lang CDATA #IMPLIED>
           <!ELEMENT description (#PCDATA)>
           <!ATTLIST description  xml:lang CDATA #IMPLIED>
           <!ELEMENT events =    (event)+>
           <!ELEMENT event =     (#PCDATA)>

       name
           User visible name

       description
           User visible description

       events
           List of executed events

       event
           Name of event. If event is not applicable on the problem data or if it is not defined then process continues with next event sibling.

EXAMPLES
   Simple reporting work flow
           <workflow>
             <name xml:lang="en">Example</name>
             <name xml:lang="cs">Příklad</name>
             <description xml:lang="en">Example description</description>
             <description xml:lang="cs">Příklad popisu</description>
             <evetns>
                <event>analyze_example</event>
                <event>collect_example</event>
                <event>report_example</event>
             </events>
           </workflow>

AUTHORS
       ·   ABRT team



LIBREPORT 2.1.11.1                                                                                08/12/2019                                                                                    REPORT-GTK(1)
