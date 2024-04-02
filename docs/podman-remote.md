podman-remote(1)                                              General Commands Manual                                             podman-remote(1)

NAME
       podman-remote - A remote CLI for Podman: A Simple management tool for pods, containers and images.

SYNOPSIS
       podman-remote [options] command

DESCRIPTION
       Podman (Pod Manager) is a fully featured container engine that is a simple daemonless tool.  Podman provides a Docker-CLI comparable
       command line that eases the transition from other container engines and allows the management of pods, containers and images.  Simply put:
       alias docker=podman.  Most Podman commands can be run as a regular user, without requiring additional privileges.

       Podman uses Buildah(1) internally to create container images. Both tools share image (not container) storage, hence each can use or
       manipulate images (but not containers) created by the other.

       Podman-remote provides a local client interacting with a Podman backend node through a RESTful API tunneled through a ssh connection. In
       this context, a Podman node is a Linux system with Podman installed on it and the API service activated. Credentials for this session can
       be passed in using flags, environment variables, or in containers.conf.

       The containers.conf file should be placed under $HOME/.config/containers/containers.conf on Linux and Mac and
       %APPDATA%\containers\containers.conf on Windows.

       podman [GLOBAL OPTIONS]

GLOBAL OPTIONS
   --connection=name, -c
       Remote connection name

   --help, -h
       Print usage statement

   --identity=path
       Path to ssh identity file. If the identity file has been encrypted, Podman prompts the user for the passphrase.  If no identity file is
       provided and no user is given, Podman defaults to the user running the podman command.  Podman prompts for the login password on the remote
       server.

       Identity value resolution precedence:
        - command line value
        - environment variable CONTAINER_SSHKEY, if CONTAINER_HOST is found
        - containers.conf

   --log-level=level
       Log messages above specified level: debug, info, warn, error (default), fatal or panic

   --url=value
       URL to access Podman service (default from containers.conf, rootless "unix://run/user/$UID/podman/podman.sock" or as root
       "unix://run/podman/podman.sock).

              • CONTAINER_HOST is of the format <schema>://[<user[:<password>]@]<host>[:<port>][<path>]

       Details:
        - user will default to either root or current running user
        - password has no default
        - host must be provided and is either the IP or name of the machine hosting the Podman service
        - port defaults to 22
        - path defaults to either /run/podman/podman.sock, or /run/user/<uid>/podman/podman.sock if running rootless.

       URL value resolution precedence:
        - command line value
        - environment variable CONTAINER_HOST
        - containers.conf
        - unix://run/podman/podman.sock

   --version
       Print the version

Exit Status
       The exit code from podman gives information about why the container failed to run or why it exited.  When podman commands exit with a
       non-zero code, the exit codes follow the chroot standard, see below:

       125 The error is with podman itself

              $ podman run --foo busybox; echo $?
              Error: unknown flag: --foo
              125

       126 Executing a contained command and the command cannot be invoked

              $ podman run busybox /etc; echo $?
              Error: container_linux.go:346: starting container process caused "exec: \"/etc\": permission denied": OCI runtime error
              126

       127 Executing a contained command and the command cannot be found
           $ podman run busybox foo; echo $?
           Error: container_linux.go:346: starting container process caused "exec: \"foo\": executable file not found in $PATH": OCI runtime error
           127

       Exit code contained command exit code

              $ podman run busybox /bin/sh -c 'exit 3'; echo $?
              3

COMMANDS
       ┌──────────────────────┬───────────────────────────────────────────────────┐
       │Command               │ Description                                       │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-attach(1)      │ Attach to a running container.                    │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-build(1)       │ Build a container image using a Dockerfile.       │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-commit(1)      │ Create new image based on the changed container.  │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-container(1)   │ Manage containers.                                │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-cp(1)          │ Copy files/folders between a container and the    │
       │                      │ local filesystem.                                 │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-create(1)      │ Create a new container.                           │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-diff(1)        │ Inspect changes on a container or image's         │
       │                      │ filesystem.                                       │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-events(1)      │ Monitor Podman events                             │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-export(1)      │ Export a container's filesystem contents as a tar │
       │                      │ archive.                                          │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-generate(1)    │ Generate structured data based for a containers   │
       │                      │ and pods.                                         │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-healthcheck(1) │ Manage healthchecks for containers                │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-history(1)     │ Show the history of an image.                     │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-image(1)       │ Manage images.                                    │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-images(1)      │ List images in local storage.                     │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-import(1)      │ Import a tarball and save it as a filesystem      │
       │                      │ image.                                            │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-info(1)        │ Displays Podman related system information.       │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-init(1)        │ Initialize a container                            │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-inspect(1)     │ Display a container or image's configuration.     │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-kill(1)        │ Kill the main process in one or more containers.  │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-load(1)        │ Load an image from a container image archive into │
       │                      │ container storage.                                │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-logs(1)        │ Display the logs of a container.                  │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-pause(1)       │ Pause one or more containers.                     │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-pod(1)         │ Management tool for groups of containers, called  │
       │                      │ pods.                                             │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-port(1)        │ List port mappings for a container.               │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-ps(1)          │ Prints out information about containers.          │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-pull(1)        │ Pull an image from a registry.                    │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-push(1)        │ Push an image from local storage to elsewhere.    │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-restart(1)     │ Restart one or more containers.                   │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-rm(1)          │ Remove one or more containers.                    │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-rmi(1)         │ Removes one or more locally stored images.        │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-run(1)         │ Run a command in a new container.                 │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-save(1)        │ Save an image to a container archive.             │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-start(1)       │ Start one or more containers.                     │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-stop(1)        │ Stop one or more running containers.              │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-system(1)      │ Manage podman.                                    │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-tag(1)         │ Add an additional name to a local image.          │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-top(1)         │ Display the running processes of a container.     │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-unpause(1)     │ Unpause one or more containers.                   │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-version(1)     │ Display the Podman version information.           │
       ├──────────────────────┼───────────────────────────────────────────────────┤
       │podman-volume(1)      │ Manage Volumes.                                   │
       └──────────────────────┴───────────────────────────────────────────────────┘

FILES
       containers.conf ($HOME/.config/containers/containers.conf)

       Podman has builtin defaults for command line options. These defaults can be overridden using the containers.conf configuration files.

       Users can modify defaults by creating the $HOME/.config/containers/containers.conf file. Podman merges its builtin defaults with the
       specified fields from this file, if it exists. Fields specified in the users file override the built-in defaults.

       Podman uses builtin defaults if no containers.conf file is found.

SEE ALSO
       containers.conf(5)

                                                                                                                                  podman-remote(1)
