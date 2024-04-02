ABRT-HANDLE-UPLOAD(1)                                                                            ABRT Manual                                                                            ABRT-HANDLE-UPLOAD(1)



NAME
       abrt-handle-upload - Unpacks and moves problem data.

SYNOPSIS
       abrt-handle-upload ABRT_DIR UPLOAD_DIR FILENAME

DESCRIPTION
       The tool unpacks FILENAME located in UPLOAD_DIR and moves the problem data found in it to ABRT_DIR. It supports unpacking tarballs compressed by gzip, bzip2 or xz. It’s called by abrtd when a new
       file is noticed in the upload directory configured by the WatchCrashdumpArchiveDir option.

AUTHORS
       ·   ABRT team

SEE ALSO
       abrt.conf(5)



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-HANDLE-UPLOAD(1)
