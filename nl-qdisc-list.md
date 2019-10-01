nl-qdisc(8)                                                                                System Manager's Manual                                                                                nl-qdisc(8)



NAME
       nl-qdisc-{add|list|delete} - Manage queueing disciplines

SYNOPSIS
       nl-qdisc-add --dev dev --parent id [OPTIONS] qdisc-type [QDISC]

       nl-qdisc-delete [ --interactive ] [OPTIONS]

       nl-qdisc-list [OPTIONS]


DESCRIPTION
       The nl-qdisc tools allow to manage and configure queueing disciplines (qdiscs) in the kernel.


OPTIONS
       -h or --help
              Print help text to console and exit.

       -v or --version
              Print versioning information to console and exit.

       -q or --quiet
              Do not print informal notifications about actions taken to the console.  By default a short description of each qdisc added/update/deleted will be printed to the console. This option disables
              this behaviour.

       -d or --dev=DEV
              Network device the qdisc is attached to.

       -p or --parent=ID
              Identifier of the parent qdisc/class this qdisc is attached to. The identifier can be specified as classid, name or one of the special values "root" or "ingress".

       -i or --id=ID
              Identifier of qdisc. It can be specified as classid or name.


   nl-qdisc-add Options
       --update
              Update qdisc if it already exists, otherwise attempting to add a qdisc which already exists will result in an error. This does not include changing the type of the qdisc, use --replace if you
              wish to do so.

       --replace
              Replace or update qdisc if it already exists. Same behaviour as --update but will completely replace the qdisc if it exists already.

       --update-only
              Update an existing qdisc but do not create it if it does not exist.

       --replace-only
              Update or replace an existing qdisc but do not create it if it does exist.


   nl-qdisc-delete Options
       --interactive
              The  interactive  mode  requires  confirmation  by the user for each qdisc deleted. It will print a prompt for each qdisc matching the provided filter and requires the user to answer 'y'es or
              'n'o.

       --yes  Make the default answer for interactive prompts be 'y'es. This option is also required to delete all qdiscs on all network devices.

       -k or --kind=TYPE
              Only delete qdiscs of this type.


   nl-qdisc-list Options
       --details
              Show detailed information for each qdisc listed.

       --stats
              Show statistics information for each qdisc listed. This option will also turn on detailed information automatically.

       -r or --recursive
              List all TC objects recurisvely attached to all qdiscs matching the filter.

       -k or --kind=TYPE
              Only list qdiscs of this type.


USAGE
       Add a HTB root qdisc with id "5:":

              nl-qdisc-add --dev eth0 --parent root --id 5: htb

       List all qdiscs on eth0 and print statistical data:

              nl-qdisc-list --stats --dev eth0

       Delete the qdisc "5:":
              nl-qdisc-delete --id 5:


SEE ALSO
       nl-classid-lookup(8)


AUTHOR
       Thomas Graf is the original author and current maintainer of libnl and libnl tools. Many people have contributed to it since.



libnl                                                                                          21 October 2010                                                                                    nl-qdisc(8)
