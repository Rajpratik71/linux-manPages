man(1)                                                          fwupdtool man page                                                          man(1)

NAME
       fwupdtool - standalone firmware update utility

SYNOPSIS
       fwupdtool [CMD]

DESCRIPTION
       This tool allows an administrator to use the fwupd plugins without being installed on the host system.

       Additionally  dfu-tool  can  be  used to convert firmware from various different formats, or to modify the images contained inside the con‐
       tainer firmware file.  For example, you can convert DFU or Intel HEX firmware into the vendor-specific format.

OPTIONS
       The fwupdtool command takes various options depending on the action.  Run fwupdtool --help for the full list.

EXIT STATUS
       Commands that successfully execute will return "0", but commands that have no actions but successfully execute will return "2".

SEE ALSO
       fwupdagent(1), fwupdmgr(1)

BUGS
       No known bugs.

AUTHOR
       Richard Hughes (richard@hughsie.com)

1.7.9                                                              11 April 2021                                                            man(1)
