COMMAND-NOT-FOUND(1)                                                                      http://en.opensuse.org/Sco                                                                     COMMAND-NOT-FOUND(1)



NAME
       command-not-found - A command-not-found handler

SYNOPSIS
       command-not-found {binary_name} {repository}

ARGUMENTS
       The following arguments are required:

       binary_name
           The name of binary you are looking for.

       repository
           The name of repository for search. For most cases, use zypp

DESCRIPTION
       command-not-found handler is designed to tell users which package contains a missing command.

       The handler is integrated to bash(1) and zsh(1) shells and is not necessary to call it directly. Just type a name of the command in your favourite shell and you´ll get a result.

       If you consider c-n-f handler useless, just add unset command_not_found_handle to your profile or remove the command-not-found package.

       Handler doesn´t call the command-not-found binary directly, it only prints info about it. If you want to invoke it automatically, just add export COMMAND_NOT_FOUND_AUTO=1 to your bash profile.

EXAMPLE: NORMAL USAGE
       For example you want to try blender, because you have heard that is an amazing program. So just type blender in shell:

           $ blender

       You get the following output:

           The program ´blender´ can be found in the following package:
             * blender [ path: /usr/bin/blender, repository: zypp (openSUSE 11.1-0) ]

           Try installing with:
               sudo zypper install blender

           bash: blender: command not found

SEE ALSO
       scout(1)

AUTHOR
       Pavol Rusnak <stick@gk2.sk>
           Developer



http://gitorious.org/opensus                                                                      08/07/2009                                                                             COMMAND-NOT-FOUND(1)
