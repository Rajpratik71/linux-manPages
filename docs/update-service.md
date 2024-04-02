update-service(8)                                             System Manager's Manual                                            update-service(8)

NAME
       update-service - add/remove a service to/from system-wide service supervision

SYNOPSIS
       update-service --add|--remove service-directory [service-name]

       update-service --list|--check [service-name]

DESCRIPTION
       service-directory must be a directory to be used by supervise(8), service-name must not start with a dot, and must not contain a slash.

       update-service  adds or removes the service-directory to the system-wide service supervision provided through daemontools' svscan(8), lists
       all registered system-wide services, or checks for a specific service-name whether it is registered.

       When adding a service, and the service-directory resides in /etc/, update-service makes sure that the ./supervise/  subdirectories  in  the
       service-directory,  and  the optional service-directory/log/, are symbolic links pointing into /var/lib/supervise/, unless they already are
       symbolic links.

OPTIONS
       --add | -a
              Add the service directory service-directory to the system-wide service supervision, under the name service-name.  If service-name is
              not specified, update-service will use the basename of service-directory.  You can use the svc(8) program to control the newly added
              service, and the svstat(8) program to query its status, e.g.:

              # svstat /etc/service/service-name

       --remove | -r
              Remove the service directory service-directory, which has been added under the  name  service-name,  from  the  system-wide  service
              supervision.   If  service-name is not specified, update-service will use the basename of service-directory.  When removing the ser‐
              vice-directory, the exit command is sent to the corresponding supervise(8) process, telling it to take the  service  down  and  exit
              afterwards.  You can use the svc(8) and svstat(8) programs to control the removed service, or query its status, e.g.:

              # svstat service-directory

       --list | -l
              If  service-name is specified, update-service checks whether service-name is registered as system-wide service, prints a message and
              exits non-zero if not, or prints the service-name and the directory it points to and exits zero if  yes.   If  service-name  is  not
              specified, it prints the names of all system-widely registered services, one per line.

       --check | -c
              The same as --list, but update-service doesn't print anything to standard out or standard error.

ENVIRONMENT
       SVDIR  The environment variable $SVDIR overrides the default services directory /etc/service/.

FILES
       /etc/service/

SEE ALSO
       svc(8), svstat(8), svscan(8), svscanboot(8)

AUTHOR
       Gerrit Pape <pape@smarden.org>

                                                                                                                                 update-service(8)
