FLATPAK(1)                                                                                         flatpak                                                                                         FLATPAK(1)



NAME
       flatpak - Build, install and run applications and runtimes

SYNOPSIS
       flatpak [OPTION...] {COMMAND}

DESCRIPTION
       flatpak is a tool for managing applications and the runtimes they use. In the flatpak model, applications can be built and distributed independently from the host system they are used on, and they
       are isolated from the host system ('sandboxed') to some degree, at runtime.

       flatpak can operate in system-wide or per-user mode. The system-wide data (runtimes, applications and configuration) is located in $prefix/var/lib/flatpak/, and the per-user data is in
       $HOME/.local/share/flatpak/. Below these locations, there is a local repository in the repo/ subdirectory and installed runtimes and applications are in the corresponding runtime/ and app/
       subdirectories.

       System-wide remotes can be statically preconfigured by dropping config fragments into /etc/flatpak/remotes.d/.

       In addition to the system-wide installation in $prefix/var/lib/flatpak/, which is always considered the default one unless overridden, more system-wide installations can be defined via configuration
       files in /etc/flatpak/installations.d/, which must define at least the id of the installation and the absolute path to it. Other optional parameters like DisplayName, Priority or StorageType are
       also supported.

       flatpak uses OSTree to distribute and deploy data. The repositories it uses are OSTree repositories and can be manipulated with the ostree utility. Installed runtimes and applications are OSTree
       checkouts.

OPTIONS
       The following options are understood:

       -h, --help
           Show help options and exit.

       -v, --verbose
           Print debug information during command processing. Use -vv for more detail.

       --ostree-verbose
           Print OSTree debug information during command processing.

       --version
           Print version information and exit.

       --default-arch
           Print the default arch and exit.

       --supported-arches
           Print the supported arches in priority order and exit.

       --gl-drivers
           Print the list of active gl drivers and exit.

COMMANDS
       Commands for managing installed applications and runtimes:

       flatpak-install(1)
           Install an application or a runtime from a remote or bundle.

       flatpak-update(1)
           Update an installed application or runtime.

       flatpak-uninstall(1)
           Uninstall an installed application or runtime.

       flatpak-list(1)
           List installed applications and/or runtimes.

       flatpak-info(1)
           Show information for an installed application or runtime.

       flatpak-config(1)
           Manage flatpak configuration.

       flatpak-repair(1)
           Repair flatpak installation.

       flatpak-create-usb(1)
           Copy apps and/or runtimes onto removable media.

       Commands for finding applications and runtimes:

       flatpak-search(1)
           Search for applications and runtimes.

       Commands for running applications:

       flatpak-run(1)
           Run an application.

       flatpak-override(1)
           Override permissions for an application.

       flatpak-make-current(1)
           Specify the default version to run.

       flatpak-enter(1)
           Enter the namespace of a running application.

       Commands for managing file access:

       flatpak-document-export(1)
           Grant an application access to a specific file.

       flatpak-document-unexport(1)
           Revoke access to a specific file.

       flatpak-document-info(1)
           Show information about a specific file.

       flatpak-document-list(1)
           List exported files.

       Commands for managing the dynamic permission store:

       flatpak-permission-remove(1)
           Remove item from permission store.

       flatpak-permission-list(1)
           List permissions.

       flatpak-permission-show(1)
           Show app permissions.

       flatpak-permission-reset(1)
           Reset app permissions.

       Commands for managing remote repositories:

       flatpak-remotes(1)
           List all configured remote repositories.

       flatpak-remote-add(1)
           Add a new remote repository.

       flatpak-remote-modify(1)
           Modify properties of a configured remote repository.

       flatpak-remote-delete(1)
           Delete a configured remote repository.

       flatpak-remote-ls(1)
           List contents of a configured remote repository.

       flatpak-remote-info(1)
           Show information about a ref in a configured remote repository.

       Commands for building applications:

       flatpak-build-init(1)
           Initialize a build directory.

       flatpak-build(1)
           Run a build command in a build directory.

       flatpak-build-finish(1)
           Finalizes a build directory for export.

       flatpak-build-export(1)
           Export a build directory to a repository.

       flatpak-build-bundle(1)
           Create a bundle file from a ref in a local repository.

       flatpak-build-import-bundle(1)
           Import a file bundle into a local repository.

       flatpak-build-sign(1)
           Sign an application or runtime after its been exported.

       flatpak-build-update-repo(1)
           Update the summary file in a repository.

       flatpak-build-commit-from(1)
           Create a new commit based on an existing ref.

       flatpak-repo(1)
           Print information about a repo.

FILE FORMATS
       File formats that are used by Flatpak commands:

       flatpak-flatpakref(5)
           Reference to a remote for an application or runtime

       flatpak-flatpakrepo(5)
           Reference to a remote

       flatpak-remote(5)
           Configuration for a remote

       flatpak-installation(5)
           Configuration for an installation location

       flatpak-metadata(5)
           Information about an application or runtime

ENVIRONMENT
       Besides standard environment variables such as XDG_DATA_DIRS and XDG_DATA_HOME, flatpak is consulting some of its own.

       FLATPAK_USER_DIR
           The location of the per-user installation. If this is not set, $XDG_DATA_HOME/flatpak is used.

       FLATPAK_SYSTEM_DIR
           The location of the default system-wide installation. If this is not set, /var/lib/flatpak is used (unless overridden at build time by --localstatedir or --with-system-install-dir).

       FLATPAK_CONFIG_DIR
           The location of flatpak site configuration. If this is not set, /etc/flatpak is used (unless overridden at build time by --sysconfdir).

SEE ALSO
       ostree(1), ostree.repo(5), flatpak-remote(5),



flatpak                                                                                                                                                                                            FLATPAK(1)
