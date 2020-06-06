IBDIAGUI(1)                                                                                 IB DIAGNOSTIC PACKAGE                                                                                 IBDIAGUI(1)



NAME
       ibdiagui - IB Diagnostic GUI

SYNOPSYS
       ibdiagui [-c <count>] [-v] [-r] [-o <out-dir>]
            [-t <topo-file>] [-s <sys-name>] [-i <dev-index>] [-p <port-num>]
            [-pm] [-pc] [-P <PM counter>=<Trash Limit>]
            [-lw <1x⎪4x⎪12x>] [-ls <2.5⎪5⎪10>]

DESCRIPTION
         ibdiagui is a GUI wrapper for ibdiagnet.
         Its main features:

       1. Display a graph of the discovered fabric (with optional names annotattion)
       2. Hyperlink the ibdiagnet log to the graph objects
       3. Show each object properties and object type specific actions on a properties pannel.

OPTIONS
ibdiagui simply passes its options to ibdiagnet. Please see ibdiagnet man page for the complete list.



IBDIAG 1.0                                                                                        2006-11-17                                                                                      IBDIAGUI(1)
