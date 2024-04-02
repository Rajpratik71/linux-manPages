MEMSTOMP(1)                                                                                General Commands Manual                                                                                MEMSTOMP(1)



NAME
       memstomp - detect function calls with overlapping memory regions

SYNOPSIS
       memstomp [-dk] application [argument...]

       memstomp -h

DESCRIPTION
       The  memstomp  utility identifies function calls that use overlapping memory regions in situations when such an overlap is not allowed by various standards. When a problem is detected, memstomp dis‐
       plays a backtrace to help you debug the problem, and if executed with the --debug-info command line option, it even uses the available debugging information. Since the backtrace code is  not  thread
       safe, memstomp also allows you to use the --kill option to immediately terminate the analyzed program when an invalid function call is detected.

       This  version  of  memstomp  inspects  the  following  function calls: memcpy(), memccpy(), mempcpy(), strcpy(), stpcpy(), strncpy(), stpncpy(), strcat(), strncat(), wmemcpy(), wmempcpy(), wcscpy(),
       wcsncpy(), wcscat(), and wcsncat().

OPTIONS
       -d, --debug-info
              Make use of debugging information to produce more detailed stack traces.

       -k, --kill
              Kill the analyzed application when a problem is detected.

       -h, --help
              Display usage information and exit.

       -q, --quiet
              Be less verbose

SEE ALSO
       memcpy(3), memccpy(3), mempcpy(3), strcpy(3), stpcpy(3), strncpy(3), stpncpy(3), strcat(3), strncat(3), wmemcpy(3), wmempcpy(3), wcscpy(3), wcsncpy(3), wcscat(3), wcsncat(3)

AUTHORS
       Lennart Poettering <lennart@poettering.net>
       William Cohen <wcohen@redhat.com>



0.1.4                                                                                           09 April 2013                                                                                     MEMSTOMP(1)
