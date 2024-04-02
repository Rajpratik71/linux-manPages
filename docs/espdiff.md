ESPDIFF(1)                                                                                        Man pages                                                                                        ESPDIFF(1)



NAME
       espdiff - apply the appropriate transformation to a set of patches

SYNOPSIS
       espdiff [--deep-brainwave-mode] [--recurse] [--compare] [file...]

       espdiff {[--help] | [--version]}

DESCRIPTION
       espdiff applies the appropriate transformation to a patch or set of patches, depending on what you intend to accomplish.

       The input patches must be “clean”: in other words they must apply without fuzz or offsets in whichever order they are meant to be applied. The exception is if you intend espdiff to clean them for
       you (good luck).

       You may find it useful to cross your fingers while the program performs its task, or to screw your eyes tight shut while imagining it doing the right thing.

OPTIONS
       --deep-brainwave-mode
           Probes your brain deeply in a manner that takes longer, but produces better extra sensory results.

       --recurse
           Recurses neural pathways throughout all parts of the brain, in some cases determining code changes you might make far off in the future. You may feel a gentle tickling sensation when using this
           option.

       --compare
           Allows the program to scan the current directory examining existing patches to determine areas of code you are likely to change again, and concentrating on these areas more closely.

       --help
           Display a short usage message.

       --version
           Display the version number of espdiff.

LIMITATIONS
       Do not use this program while sleep-walking, or before your first cup of coffee.

       There are some cases in which it is not possible to determine what the intention of the user is. In these cases, you should construct the output you desire using an editor, and send the input files
       together with the desired output file to Tim Waugh <twaugh@redhat.com> asking for a new diff tool.

AUTHORS
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

       Mike Harris <mharris@redhat.com>
           Conceptual designer



patchutils                                                                                       5 March 2003                                                                                      ESPDIFF(1)
