xmbind(user cmd)                                                                                                                                                                             xmbind(user cmd)



NAME
       xmbind — Configures virtual key bindings

SYNOPSIS
       xmbind [options ]  [file ]

DESCRIPTION
       xmbind  is  an X Window System client that configures the virtual key bindings for Motif applications. This action is performed by mwm at its startup, so the xmbind client is only needed when mwm is
       not in use, or when you want to change bindings without restarting mwm. If a file is specified, its contents are used as the virtual key bindings. If a file is not specified, the file .motifbind  in
       the user's home directory is used. If this file is not found, xmbind loads the default virtual key bindings, as described in VirtualBindings(3).

   Options
       -display  This option specifies the display to use; see X(1).

RELATED
       VirtualBindings(3) and X(1).



                                                                                                                                                                                             xmbind(user cmd)
