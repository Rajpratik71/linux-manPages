WEBSPLOIT(1)                                                  General Commands Manual                                                 WEBSPLOIT(1)

NAME
       websploit - Advanced MITM Framework

SYNOPSIS
       websploit

DESCRIPTION
       Websploit is an automatic vulnerability assessment, web scanner and exploiter tool. It is python command line tool that is composed on mod‐
       ular structure pretty similar to Metasploit. There are currently 20 modules into four sections.  The  command  line  does  not  accept  any
       options. User just get into console typing "websploit" and the prompt will change to this: wsf >

OPTIONS
       wsf > help
              Shows all command you can type in the websploit console. Some of them are only aplicable when using a certain module.

       wsf > show modules
              Show Modules of Current Database

       wsf > use <module_name>
              Select Module For Use

       wsf > show options
              Show Current Options Of Selected Module

       wsf > set <module_option>
              Once you had seen the options of the selected module, you may use this command to define its desired value.

       wsf > scan
              Scan Wifi (Wireless Modules)

       wsf > stop
              Stop Attack & Scan (Wireless Modules)

       wsf > run
              Execute Module

       wsf > os
              Run console commands (ex : os ifconfig)

       wsf > back
              Exit current module

       wsf > upgrade | update
              Both of them are disabled on Debian systems in order to avoid conflicts with apt-get.

       wsf > about
              Shows info about the author.

EXAMPLES
       Here is a simple example on how to use apache_users module in order to hunt existing Apache users directories.
              sf > use web/apache_users
              wsf:Apache User > show options

               Options         Value
              -----------     ----------------
              URL             http://example.com

              wsf:Apache User > set url myown.example.org
              URL =>  myown.example.org
              wsf:Apache User > run
              [*] Your Target : myown.example.org
              [*]Loading Path List ... Please Wait ...
              [~root] ... [400 Bad Request]
              [~toor] ... [400 Bad Request]
              [~bin] ... [400 Bad Request]
              [~daemon] ... [400 Bad Request]
              [~adm] ... [400 Bad Request]
              [~lp] ... [400 Bad Request]
              [~sync] ... [400 Bad Request]
              etc

AUTHOR
       Fardin Allahverdinazhand <0x0ptim0us@Gmail.com>

       This manual page was written by Marcos Fouces <mfouces@yahoo.es>, for the Debian project (and may be used by others).

                                                                                                                                      WEBSPLOIT(1)
