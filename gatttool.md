GATTTOOL(1)                             General Commands Manual                            GATTTOOL(1)

NAME
       gatttool - tool for Bluetooth Low Energy device

SYNOPSIS
       gatttool

DESCRIPTION
       gatttool  is  tool  that can be used to manipulate these attributes with a Bluetooth Low Energy
       device.

USAGE
         gatttool [OPTION...]

       Help Options:
         -h, --help                                  Show help options
         -h, --help                                  Show help options
         --help-all                                  Show all help options
         --help-gatt                                 Show all GATT commands
         --help-params                               Show all Primary  Services/Characteristics  argu‐
       ments
         --help-char-read-write                        Show   all   Characteristics   Value/Descriptor
       Read/Write arguments

       Application Options:
         --i, ---adapter=hciX                        Specify local adapter interface
         --b, ---device=MAC                          Specify remote Bluetooth address
         --t, ---addr-type=[public | random]         Set LE address type. Default: public
         --m, ---mtu=MTU                             Specify the MTU size
         --p, ---psm=PSM                             Specify the PSM for GATT/ATT over BR/EDR
         --l, ---sec-level=[low | medium | high]     Set security level. Default: low
         --I, ---interactive                         Use interactive mode

AUTHOR
       This manual page was  written  by  Nobuhiro  Iwamatsu  <iwamatsu@debian.org>,  for  the  Debian
       GNU/Linux system (but may be used by others).

                                               Aug 2015                                    GATTTOOL(1)
