PORTABLECTL(1)                                                      portablectl                                                     PORTABLECTL(1)

NAME
       portablectl - Attach, detach or inspect portable service images

SYNOPSIS
       portablectl [OPTIONS...] {COMMAND} [NAME...]

DESCRIPTION
       portablectl may be used to attach, detach or inspect portable service images. It's primarily a command interfacing with systemd-
       portabled.service(8).

       Portable service images contain an OS file system tree along with systemd(1) unit file information. A service image may be "attached" to
       the local system. If attached, a set of unit files are copied from the image to the host, and extended with RootDirectory= or RootImage=
       assignments (in case of service units) pointing to the image file or directory, ensuring the services will run within the file system
       context of the image.

       Portable service images are an efficient way to bundle multiple related services and other units together, and transfer them as a whole
       between systems. When these images are attached the local system the contained units may run in most ways like regular system-provided
       units, either with full privileges or inside strict sandboxing, depending on the selected configuration.

       Specifically portable service images may be of the following kind:

       •   Directory trees containing an OS, including the top-level directories /usr/, /etc/, and so on.

       •   btrfs subvolumes containing OS trees, similar to normal directory trees.

       •   Binary "raw" disk images containing MBR or GPT partition tables and Linux file system partitions. (These must be regular files, with
           the .raw suffix.)

COMMANDS
       The following commands are understood:

       list
           List available portable service images. This will list all portable service images discovered in the portable image search paths (see
           below), along with brief metadata and state information. Note that many of the commands below may both operate on images inside and
           outside of the search paths. This command is hence mostly a convenience option, the commands are generally not restricted to what this
           list shows.

       attach IMAGE [PREFIX...]
           Attach a portable service image to the host system. Expects a file system path to a portable service image file or directory as first
           argument. If the specified path contains no slash character ("/") it is understood as image filename that is searched for in the
           portable service image search paths (see below). To reference a file in the current working directory prefix the filename with "./" to
           avoid this search path logic.

           When a portable service is attached four operations are executed:

            1. All unit files of types .service, .socket, .target, .timer and .path which match the indicated unit file name prefix are copied
               from the image to the host's /etc/systemd/system.attached/ directory (or /run/systemd/system.attached/ — depending whether
               --runtime is specified, see above), which is included in the built-in unit search path of the system service manager.

            2. For unit files of type .service a drop-in is added to these copies that adds RootDirectory= or RootImage= settings (see
               systemd.unit(5) for details), that ensures these services are run within the file system of the originating portable service image.

            3. A second drop-in is created: the "profile" drop-in, that may contain additional security settings (and other settings). A number of
               profiles are available by default but administrators may define their own ones. See below.

            4. If the portable service image file is not already in the search path (see below), a symbolic link to it is created in
               /etc/portables/ or /run/portables/, to make sure it is included in it.

           By default all unit files whose names start with a prefix generated from the image's file name are copied out. Specifically, the prefix
           is determined from the image file name with any suffix such as .raw removed, truncated at the first occurrence of and underscore
           character ("_"), if there is one. The underscore logic is supposed to be used to versioning so that the an image file foobar_47.11.raw
           will result in a unit file matching prefix of foobar. This prefix is then compared with all unit files names contained in the image in
           the usual directories, but only unit file names where the prefix is followed by "-", "."  or "@" are considered. Example: if a portable
           service image file is named foobar_47.11.raw then by default all its unit files with names such as foobar-quux-waldi.service,
           foobar.service or foobar@.service will be considered. It's possible to override the matching prefix: all strings listed on the command
           line after the image file name are considered prefixes, overriding the implicit logic where the prefix is derived from the image file
           name.

           By default, after the unit files are attached the service manager's configuration is reloaded, except when --no-reload is specified
           (see above). This ensures that the new units made available to the service manager are seen by it.

           If --now and/or --enable are passed, the portable service(s) are immediately started (blocking operation unless --no-block is passed)
           and/or enabled after attaching the image.

       detach IMAGE [PREFIX...]
           Detaches a portable service image from the host. This undoes the operations executed by the attach command above, and removes the unit
           file copies, drop-ins and image symlink again. This command expects an image name or path as parameter. Note that if a path is
           specified only the last component of it (i.e. the file or directory name itself, not the path to it) is used for finding matching unit
           files. This is a convencience feature to allow all arguments passed as attach also to detach.

           If --now and/or --enable are passed, the portable service(s) are immediately stopped (blocking operation) and/or disabled before
           detaching the image. Prefix(es) are also accepted, to be used in case the unit names do not match the image name as described in the
           attach.

       inspect IMAGE [PREFIX...]
           Extracts various metadata from a portable service image and presents it to the caller. Specifically, the os-release(5) file of the
           image is retrieved as well as all matching unit files. By default a short summary showing the most relevant metadata in combination
           with a list of matching unit files is shown (that is the unit files attach would install to the host system). If combined with --cat
           (see above), the os-release data and the units files' contents is displayed unprocessed. This command is useful to determine whether an
           image qualifies as portable service image, and which unit files are included. This command expects the path to the image as parameter,
           optionally followed by a list of unit file prefixes to consider, similar to the attach command described above.

       is-attached IMAGE
           Determines whether the specified image is currently attached or not. Unless combined with the --quiet switch this will show a short
           state identifier for the image. Specifically:

           Table 1. Image attachment states
           ┌─────────────────┬───────────────────────────────────────────────────┐
           │State            │ Description                                       │
           ├─────────────────┼───────────────────────────────────────────────────┤
           │detached         │ The image is currently not attached.              │
           ├─────────────────┼───────────────────────────────────────────────────┤
           │attached         │ The image is currently attached, i.e. its unit    │
           │                 │ files have been made available to the host        │
           │                 │ system.                                           │
           ├─────────────────┼───────────────────────────────────────────────────┤
           │attached-runtime │ Like attached, but the unit files have been made  │
           │                 │ available transiently only, i.e. the attach       │
           │                 │ command has been invoked with the --runtime       │
           │                 │ option.                                           │
           ├─────────────────┼───────────────────────────────────────────────────┤
           │enabled          │ The image is currently attached, and at least one │
           │                 │ unit file associated with it has been enabled.    │
           ├─────────────────┼───────────────────────────────────────────────────┤
           │enabled-runtime  │ Like enabled, but the unit files have been made   │
           │                 │ available transiently only, i.e. the attach       │
           │                 │ command has been invoked with the --runtime       │
           │                 │ option.                                           │
           ├─────────────────┼───────────────────────────────────────────────────┤
           │running          │ The image is currently attached, and at least one │
           │                 │ unit file associated with it is running.          │
           ├─────────────────┼───────────────────────────────────────────────────┤
           │running-runtime  │ The image is currently attached transiently, and  │
           │                 │ at least one unit file associated with it is      │
           │                 │ running.                                          │
           └─────────────────┴───────────────────────────────────────────────────┘

       read-only IMAGE [BOOL]
           Marks or (unmarks) a portable service image read-only. Takes an image name, followed by a boolean as arguments. If the boolean is
           omitted, positive is implied, i.e. the image is marked read-only.

       remove IMAGE...
           Removes one or more portable service images. Note that this command will only remove the specified image path itself — it refers to a
           symbolic link then the symbolic link is removed and not the image it points to.

       set-limit [IMAGE] BYTES
           Sets the maximum size in bytes that a specific portable service image, or all images, may grow up to on disk (disk quota). Takes either
           one or two parameters. The first, optional parameter refers to a portable service image name. If specified, the size limit of the
           specified image is changed. If omitted, the overall size limit of the sum of all images stored locally is changed. The final argument
           specifies the size limit in bytes, possibly suffixed by the usual K, M, G, T units. If the size limit shall be disabled, specify "-" as
           size.

           Note that per-image size limits are only supported on btrfs file systems. Also, depending on BindPaths= settings in the portable
           service's unit files directories from the host might be visible in the image environment during runtime which are not affected by this
           setting, as only the image itself is counted against this limit.

OPTIONS
       The following options are understood:

       -q, --quiet
           Suppresses additional informational output while running.

       -p PROFILE, --profile=PROFILE
           When attaching an image, select the profile to use. By default the "default" profile is used. For details about profiles, see below.

       --copy=
           When attaching an image, select whether to prefer copying or symlinking of files installed into the host system. Takes one of "copy"
           (to prefer copying of files), "symlink" (to prefer creation of symbolic links) or "auto" for an intermediary mode where security
           profile drop-ins are symlinked while unit files are copied. Note that this option expresses a preference only, in cases where symbolic
           links cannot be created — for example when the image operated on is a raw disk image, and hence not directly referentiable from the
           host file system — copying of files is used unconditionally.

       --runtime
           When specified the unit and drop-in files are placed in /run/systemd/system.attached/ instead of /etc/systemd/system.attached/. Images
           attached with this option set hence remain attached only until the next reboot, while they are normally attached persistently.

       --no-reload
           Don't reload the service manager after attaching or detaching a portable service image. Normally the service manager is reloaded to
           ensure it is aware of added or removed unit files.

       --cat
           When inspecting portable service images, show the (unprocessed) contents of the metadata files pulled from the image, instead of brief
           summaries. Specifically, this will show the os-release(5) and unit file contents of the image.

       --enable
           Immediately enable/disable the portable service after attaching/detaching.

       --now
           Immediately start/stop the portable service after attaching/before detaching.

       --no-block
           Don't block waiting for attach --now to complete.

       -H, --host=
           Execute the operation remotely. Specify a hostname, or a username and hostname separated by "@", to connect to. The hostname may
           optionally be suffixed by a port ssh is listening on, separated by ":", and then a container name, separated by "/", which connects
           directly to a specific container on the specified host. This will use SSH to talk to the remote machine manager instance. Container
           names may be enumerated with machinectl -H HOST. Put IPv6 addresses in brackets.

       -M, --machine=
           Execute operation on a local container. Specify a container name to connect to.

       --no-pager
           Do not pipe output into a pager.

       --no-legend
           Do not print the legend, i.e. column headers and the footer with hints.

       --no-ask-password
           Do not query the user for authentication for privileged operations.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

FILES AND DIRECTORIES
       Portable service images are preferably stored in /var/lib/portables/, but are also searched for in /etc/portables/,
       /run/systemd/portables/, /usr/local/lib/portables/ and /usr/lib/portables/. It's recommended not to place image files directly in
       /etc/portables/ or /run/systemd/portables/ (as these are generally not suitable for storing large or non-textual data), but use these
       directories only for linking images located elsewhere into the image search path.

       When a portable service image is attached, matching unit files are copied onto the host into the /etc/systemd/system.attached/ and
       /run/systemd/system.attached/ directories. When an image is detached, the unit files are removed again from these directories.

PROFILES
       When portable service images are attached a "profile" drop-in is linked in, which may be used to enforce additional security (and other)
       restrictions locally. Four profile drop-ins are defined by default, and shipped in /usr/lib/systemd/portable/profile/. Additional, local
       profiles may be defined by placing them in /etc/systemd/portable/profile/. The default profiles are:

       Table 2. Profiles
       ┌──────────┬───────────────────────────────────────────────────┐
       │Name      │ Description                                       │
       ├──────────┼───────────────────────────────────────────────────┤
       │default   │ This is the default profile if no other profile   │
       │          │ name is set via the --profile= (see above). It's  │
       │          │ fairly restrictive, but should be useful for      │
       │          │ common, unprivileged system workloads. This       │
       │          │ includes write access to the logging framework,   │
       │          │ as well as IPC access to the D-Bus system.        │
       ├──────────┼───────────────────────────────────────────────────┤
       │nonetwork │ Very similar to default, but networking is turned │
       │          │ off for any services of the portable service      │
       │          │ image.                                            │
       ├──────────┼───────────────────────────────────────────────────┤
       │strict    │ A profile with very strict settings. This profile │
       │          │ excludes IPC (D-Bus) and network access.          │
       ├──────────┼───────────────────────────────────────────────────┤
       │trusted   │ A profile with very relaxed settings. In this     │
       │          │ profile the services run with full privileges.    │
       └──────────┴───────────────────────────────────────────────────┘

       For details on this profiles, and their effects please have a look at their precise definitions, e.g.
       /usr/lib/systemd/portable/profile/default/service.conf and similar.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

ENVIRONMENT
       $SYSTEMD_PAGER
           Pager to use when --no-pager is not given; overrides $PAGER. If neither $SYSTEMD_PAGER nor $PAGER are set, a set of well-known pager
           implementations are tried in turn, including less(1) and more(1), until one is found. If no pager implementation is discovered no pager
           is invoked. Setting this environment variable to an empty string or the value "cat" is equivalent to passing --no-pager.

       $SYSTEMD_LESS
           Override the options passed to less (by default "FRSXMK").

           Users might want to change two options in particular:

           K
               This option instructs the pager to exit immediately when Ctrl+C is pressed. To allow less to handle Ctrl+C itself to switch back to
               the pager command prompt, unset this option.

               If the value of $SYSTEMD_LESS does not include "K", and the pager that is invoked is less, Ctrl+C will be ignored by the
               executable, and needs to be handled by the pager.

           X
               This option instructs the pager to not send termcap initialization and deinitialization strings to the terminal. It is set by
               default to allow command output to remain visible in the terminal even after the pager exits. Nevertheless, this prevents some
               pager functionality from working, in particular paged output cannot be scrolled with the mouse.

           See less(1) for more discussion.

       $SYSTEMD_LESSCHARSET
           Override the charset passed to less (by default "utf-8", if the invoking terminal is determined to be UTF-8 compatible).

       $SYSTEMD_COLORS
           The value must be a boolean. Controls whether colorized output should be generated. This can be specified to override the decision that
           systemd makes based on $TERM and what the console is connected to.

       $SYSTEMD_URLIFY
           The value must be a boolean. Controls whether clickable links should be generated in the output for terminal emulators supporting this.
           This can be specified to override the decision that systemd makes based on $TERM and other conditions.

SEE ALSO
       systemd(1), systemd-portabled.service(8)

systemd 245                                                                                                                         PORTABLECTL(1)
