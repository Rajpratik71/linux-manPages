PORTRELEASE(1)                                                                           TCP port reservation utility                                                                          PORTRELEASE(1)



NAME
       portrelease - release previously-reserved ports

SYNOPSIS
       portrelease [SVC]

DESCRIPTION
       The portrelease program instructs the portreserve daemon to release the port associated with the given service configuration file.

       It is intended that portrelease is run by the initscript of the service wanting the port. For example, the cups initscript might run portrelease cups.

EXIT CODE
       An exit code of zero means that a best effort attempt has been made to instruct the daemon to release the port. Non-zero exit codes mean that the daemon is running but couldn't be contacted.

SEE ALSO
       portreserve(1)

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Author.



portreserve                                                                                      1 July 2008                                                                                   PORTRELEASE(1)
