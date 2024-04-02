GO(1)                                  General Commands Manual                                  GO(1)

NAME
       go - tool for managing Go source code

SYNOPSIS
       go command [arguments]

DESCRIPTION
       The  Go  distribution  includes a command, named go, that automates the downloading, building,
       installation, and testing of Go packages and commands.

COMMANDS
       Each command is documented in its own manpage. For example, the build command is documented in
       go-build(1). The commands are:

       build  compile packages and dependencies

       clean  remove object files

       doc    run godoc on package sources

       env    print Go environment information

       fix    run go tool fix on packages

       fmt    run gofmt on package sources

       get    download and install packages and dependencies

       install
              compile and install packages and dependencies

       list   list packages

       run    compile and run Go program

       test   test packages

       tool   run specified go tool

       version
              print Go version

       vet    run go tool vet on packages

EXAMPLES
       TODO

SEE ALSO
       go-build(1), go-clean(1).

AUTHOR
       This  manual  page  was  written by Michael Stapelberg <stapelberg@debian.org>, for the Debian
       project (and may be used by others).

                                              2012-05-13                                        GO(1)
