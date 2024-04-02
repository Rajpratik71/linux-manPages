inject(8)                                                     System Manager's Manual                                                    inject(8)

NAME
       inject - injects appropriate error into function if input call chain and predicates are satisfied. Uses Linux eBPF/bcc.

SYNOPSIS
       inject -h [-I header] [-P probability] [-v] [-c count] <mode> <spec>

DESCRIPTION
       inject injects errors into specified kernel functionality when a given call chain and associated predicates are satisfied.

       WARNING:  This  tool injects failures into key kernel functions and may crash the kernel. You should know what you're doing if you're using
       this tool.

       This makes use of a Linux 4.16 feature (bpf_override_return())

       Since this uses BPF, only the root user can use this tool.

OPTIONS
       -h     Print usage message.

       -v     Display the generated BPF program, for debugging or modification.

       -I header
              Necessary headers to be included.

       -P probability
              Optional probability of failure, default 1.

       -c count
              Number of errors to inject before stopping, default never stops.

MODE
       kmalloc
              Make the following function indicate failure
                     int should_failslab(struct kmem_cache *s, gfp_t gfpflags)

       bio    Make the following function indicate failure
                     int should_fail_bio(struct bio *bio)

       alloc_page
              Make the following function indicate failure
                     bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)

SPEC
       FUNCTION([ARGS])[(TEST)] [=> ...]

       A list of predicates separated by "=>". A predicate is a function signature (name and arguments) in a call stack and a test  on  the  func‐
       tion's arguments.

       Missing  predicates are implicitly true. Missing tests are implicitly true.  Specifying the function arguments is optional if the test does
       not use them.  If the error injection function is not listed as the first predicate, it is implicitly added.

       Functions are listed in the reverse order that they are called, ie. if a() calls b(), the spec would be "b() => a()".

REQUIREMENTS
       CONFIG_BPF, CONFIG_BPF_KPROBE_OVERRIDE, bcc

EXAMPLES
       inject kmalloc -v 'SyS_mount()'

       inject kmalloc -v 'mount_subtree() => btrfs_mount()'

       inject -P 0.5 -c 100 alloc_page "should_fail_alloc_page(gfp_t gfp_mask, unsigned int order) (order == 1) => qlge_refill_bq()"

       Please see the output of '-h' and tools/inject_example.txt for more examples.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Howard McLauchlan

USER COMMANDS                                                       2018-03-16                                                           inject(8)
