ABRT-ACTION-CHECK()                                                                                                                                                                       ABRT-ACTION-CHECK()



NAME
       abrt-action-check-oops-for-hw-error - Checks dmesg element, marks problem as not-reportable if hardware error is detected

SYNOPSIS
       abrt-action-check-oops-for-hw-error

DESCRIPTION
       The tool reads dmesg element, and if it has a message which indicates hardware error, it creates not-reportable and comment elements which explain what this error is and how it can be diagnosed
       further.

   Integration with ABRT events
       This tool can be used in event handling for kernel oopses. Example fragment for /etc/libreport/report_event.conf:

           # Determine in which package/component the crash happened (if not yet done):
           EVENT=post-create analyzer=Kerneloops
                   abrt-action-check-oops-for-hw-error

AUTHORS
       ·   ABRT team



                                                                                                                                                                                          ABRT-ACTION-CHECK()
