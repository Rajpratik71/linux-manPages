DESKTOP-FILE-VALIDATE(1)                                                                General Commands Manual                                                               DESKTOP-FILE-VALIDATE(1)

NAME
       desktop-file-validate - Validate desktop entry files

SYNOPSIS
       desktop-file-validate [--no-hints] [--no-warn-deprecated] [--warn-kde] FILE...

DESCRIPTION
       The desktop-file-validate program is a tool to validate desktop entry files according to the Desktop Entry specification 1.1.

       The  specification describes a file format to provide information such as name, icon and description for an application. Such a file can then be used as an application launcher and to display
       the application in the applications menu.

       For information about the Desktop Entry specification, see http://freedesktop.org/wiki/Specifications/desktop-entry-spec.

       The desktop entry files are commonly called desktop files.

OPTIONS
       The following options are supported:

       --no-hints
              Do not output hints about things that might be improved in the desktop file.

       --no-warn-deprecated
              Do not warn about usage of deprecated items that were defined in previous versions of the specification.

       --warn-kde
              Warn about usage of KDE extensions to the specification. This includes the use of the KDE Desktop Entry group, of the ServiceTypes, DocPath, Keywords, InitialPreference,  Dev,  FSType,
              MountPoint, ReadOnly, UnmountIcon keys, or of the Service, ServiceType and FSDevice types.

BUGS
       If you find bugs in the desktop-file-validate program, please report these on https://bugs.freedesktop.org.

SEE ALSO
       desktop-file-edit(1) desktop-file-install(1)

                                                                                            FREEDESKTOP.ORG                                                                   DESKTOP-FILE-VALIDATE(1)
