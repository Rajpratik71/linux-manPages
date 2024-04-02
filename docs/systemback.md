Systemback(1)            General Commands Manual           Systemback(1)

NAME
       Systemback  -  Simple  system backup and restore application with
       extra
                    features

SYNOPSIS
       systemback

DESCRIPTION
       Systemback makes it easy to create backups of the system and  the
       users  configuration  files.  In  case of problems you can easily
       restore the previous state of the system. There  are  extra  fea‐
       tures  like  system  copying, system installation and Live system
       creation.

ENVIRONMENT
       DBGLEV set the debug level for the stdout printed error messages
              0 - no error messages
              1 - print the error messages when a  process  has  stopped
              because
                  an error occurred (default)
              2 - print all error messages
              3 - print all error messages with extra informations

FILES
   /etc/systemback/systemback.conf
       configuration of GUI and CLI
       the  possible variables and values are indicated in the file, all
       other changes are lost

   /etc/systemback/systemback.excludes
       exclude hidden user files and directories from restore points
       exclude user data files and directories from Live system

   /etc/systemback/systemback.includes
       include user data files and directories into the restore points

AUTHOR
       Krisztián Kende (nemh@freemail.hu)

                               02.02.2016.                 Systemback(1)
