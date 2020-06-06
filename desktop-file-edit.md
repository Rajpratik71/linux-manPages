DESKTOP-FILE-INSTALL(1)                                                                  General Commands Manual                                                                  DESKTOP-FILE-INSTALL(1)

NAME
       desktop-file-install, desktop-file-edit - Installation and edition of desktop files

SYNOPSIS
       desktop-file-install [--dir=DIR] [-m MODE|--mode=MODE] [--vendor=VENDOR] [--delete-original] [--rebuild-mime-info-cache] [EDITOPTION]... FILE...

       desktop-file-edit [EDITOPTION]... FILE

DESCRIPTION
       The  desktop-file-install  program is a tool to install, and optionally edit, desktop files. The desktop-file-edit program is a tool to edit a desktop file. They are mostly useful for developers
       and packagers.

       Various options are available to edit the desktop files. The edit options can be specified more than once and will be processed in the same order as the options passed to the program.

       desktop-file-install and desktop-file-edit will always try to validate the resulting desktop file. A failure to validate might lead to the abortion of the installation of the desktop files.

       The list of registered categories and desktop environments is defined in the Menu specification: http://freedesktop.org/wiki/Specifications/menu-spec.

OPTIONS
       The following options are supported:

       --dir=DIR
              Install desktop files to the DIR directory.

       -m, --mode=MODE
              Set the permissions of the destination files to MODE.

       --vendor=VENDOR
              Add a vendor prefix to the desktop files. If a file already has this prefix, nothing happens; else, the file will be named VENDOR-FILE. For example: if VENDOR is freedesktop.org and  FILE
              is specification.desktop, the result file will be freedesktop.org-specification.desktop.

       --delete-original
              Delete the source desktop files, leaving only the target files.  Effectively "renames" the desktop files.

       --rebuild-mime-info-cache
              Rebuild the MIME types application database after installing the desktop files. See update-desktop-database(1) for information about this database.

EDIT OPTIONS
       The following edit options are supported:

       --set-key=KEY
              Set the KEY key to the value passed to the next --set-value option. A matching --set-value option is mandatory.

       --set-value=VALUE
              Set the key specified with the previous --set-key option to VALUE.  A matching --set-key option is mandatory.

       --set-name=NAME
              Set the name (key Name) to NAME. If a name was already set, it will be overridden. Localizations of the old name will be removed.

       --copy-name-to-generic-name
              Copy the value of the Name key to the GenericName key. Note that a desktop file requires a Name key to be valid, so this option will always have an effect.

       --set-generic-name=GENERIC-NAME
              Set the generic name (key GenericName) to GENERIC-NAME. If a generic name was already set, it will be overridden. Localizations of the old generic name will be removed.

       --copy-generic-name-to-name
              Copy the value of the GenericName key to the Name key, if the GenericName key is present.

       --set-comment=COMMENT
              Set the comment (key Comment) to COMMENT. If a comment was already set, it will be overridden. Localizations of the old comment will be removed.

       --set-icon=ICON
              Set the icon (key Icon) to ICON. If an icon was already set, it will be overridden. Localizations of the old icon will be removed.

       --add-category=CATEGORY
              Add CATEGORY to the list of categories (key Categories). If CATEGORY was already present in the list, this operation is a no-op. A non-registered category should be prefixed with X-.

       --remove-category=CATEGORY
              Remove CATEGORY from the list of categories (key Categories). If CATEGORY was not present in the list, this operation is a no-op.

       --add-mime-type=MIME-TYPE
              Add MIME-TYPE to the list of MIME types (key MimeType). If MIME-TYPE was already present in the list, this operation is a no-op.

       --remove-mime-type=MIME-TYPE
              Remove MIME-TYPE from the list of MIME types (key MimeType).  If MIME-TYPE was not present in the list, this operation is a no-op.

       --add-only-show-in=ENVIRONMENT
              Add  ENVIRONMENT  to the list of desktop environments where the desktop files should be displayed (key OnlyShowIn). If ENVIRONMENT was already present in the list, this operation is a no-
              op. A non-registered desktop environment should be prefixed with X-. Note that an empty OnlyShowIn key in a desktop file means that the desktop file will be displayed in all environments.

       --remove-only-show-in=ENVIRONMENT
              Remove ENVIRONMENT from the list of desktop environments where the desktop files should be displayed (key OnlyShowIn). If ENVIRONMENT was not present in the list, this operation is a  no-
              op.

       --add-not-show-in=ENVIRONMENT
              Add  ENVIRONMENT  to  the list of desktop environments where the desktop files should not be displayed (key NotShowIn). If ENVIRONMENT was already present in the list, this operation is a
              no-op. A non-registered desktop environment should be prefixed with X-. Note that an empty NotShowIn key in a desktop file means that the desktop file will be displayed  in  all  environ‐
              ments.

       --remove-not-show-in=ENVIRONMENT
              Remove  ENVIRONMENT  from the list of desktop environments where the desktop files should not be displayed (key NotShowIn). If ENVIRONMENT was not present in the list, this operation is a
              no-op.

       --remove-key=KEY
              Remove the KEY key from the desktop files, if present.

ENVIRONMENT
       Some environment variables change the behavior of desktop-file-install:

       DESKTOP_FILE_VENDOR

              This variable can be used as an alternative to the --vendor option. If the --vendor option is used, this environment variable will be ignored.

       DESKTOP_FILE_INSTALL_DIR

              This variable can be used as an alternative to the --dir option. If the --dir option is used, this environment variable will be ignored.

       RPM_BUILD_ROOT

              This variable is set when building RPM packages. If the --dir option and the DESKTOP_FILE_INSTALL_DIR environment variable are not used, it will automatically be prepended to the  default
              install directory to install the desktop files appropriately when building packages.

BUGS
       If you find bugs in the desktop-file-install program, please report these on https://bugs.freedesktop.org.

SEE ALSO
       desktop-file-validate(1) update-desktop-database(1)

                                                                                             FREEDESKTOP.ORG                                                                      DESKTOP-FILE-INSTALL(1)
