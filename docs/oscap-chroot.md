oscap-chroot(8)                                                                        System Administration Utilities                                                                        oscap-chroot(8)



NAME
       oscap-chroot - Tool for offline SCAP evaluation of filesystems mounted at arbitrary paths.

DESCRIPTION
       oscap-chroot runs oscap tool on it in a filesystem mounted at given path.

       Usage of the tool mimics usage and options of oscap(8) tool.


USAGE
   Evaluation of XCCDF content
       $ oscap-chroot CHROOT_PATH xccdf eval [options] INPUT_CONTENT

       supported oscap xccdf eval options are:
         --profile
         --tailoring-file
         --tailoring-id
         --cpe (external OVAL dependencies are not supported yet!)
         --oval-results
         --sce-results
         --check-engine-results
         --results
         --results-arf
         --report
         --skip-valid
         --fetch-remote-resources
         --progress
         --datastream-id
         --xccdf-id
         --benchmark-id


   Evaluation of OVAL content
       $ oscap-chroot image CHROOT_PATH oval eval [options] INPUT_CONTENT

       supported oscap oval eval options are:
         --id
         --variables
         --directives
         --results
         --report
         --skip-valid
         --datastream-id
         --oval-id
         --probe-root


   Collection of OVAL System Characteristic
       $ oscap-chroot CHROOT_PATH oval collect [options] INPUT_CONTENT

       supported oscap oval collect options are:
         --id
         --syschar
         --variables
         --skip-valid



REPORTING BUGS
       Please report bugs using https://github.com/OpenSCAP/openscap/issues


AUTHORS
       Martin Preisler <mpreisle@redhat.com>



Red Hat, Inc.                                                                                   February 2016                                                                                 oscap-chroot(8)
