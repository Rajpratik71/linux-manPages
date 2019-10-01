IPRSOS(8)                                                                                  System Manager's Manual                                                                                  IPRSOS(8)



NAME
       iprsos - IBM Power RAID report generator

SYNOPSIS
       iprsos


DESCRIPTION
       iprsos  is  used to generate an sosreport-like report by collecting hardware information from the system, along with other system calls such as lspci, lscsi, and others. The information is collected
       from 'iprconfig' commands and printed on stdin by default. User can specify the log file by -o /path/to/report/file of his/her choice.

FILES
       A detailed report file is printed both at stdin and the /path/to/report/file specified by the user, with the information collected from the hardware and system information. If no files are used, the
       information will be only displayed at stdin.

AUTHORS
       Daniel B. Kreling <kreling@linux.vnet.ibm.com>
       Brian King <brking@us.ibm.com>




                                                                                                December 2014                                                                                       IPRSOS(8)
