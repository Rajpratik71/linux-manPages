cimreparchive(8)                                                                           System Manager's Manual                                                                           cimreparchive(8)



NAME
       cimreparchive - create an archive copy of the CIM Server repository

SYNOPSIS
       cimreparchive archive_file

       cimreparchive --help

       cimreparchive --version

DESCRIPTION
       The  cimreparchive command creates an archive copy of the CIM Server repository in the specified archive_file. The archive copy is assured to contain a consistent repository state even if it is cre‐
       ated while the CIM Server is running.

       The archive_file is created using the tar(1) command.  To restore the repository from the archive_file, stop the cimserver, move the active repository files to a different location,  use  tar(2)  to
       extract the archived repository files, and restart the cimserver.  (Note that the repository location is printed when an archive file is created.)

   Options
       cimreparchive recognizes the following options:

              --help         Displays the command help message.

              --version      Displays the CIM Server version number.

EXIT STATUS
       When an error occurs, an error message is written to the standard error stream and a non-zero exit status value is returned. The following exit status values are defined:

              0      Success

              1      General error

              2      Failed to initiate archive operation

              3      Archive operation failed

SEE ALSO
       cimserver(8), tar(1).



                                                                                                                                                                                             cimreparchive(8)
