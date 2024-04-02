xfsinvutil(8)                                                                              System Manager's Manual                                                                              xfsinvutil(8)



NAME
       xfsinvutil - xfsdump inventory database checking and pruning utility

SYNOPSIS
       xfsinvutil [-F|-i] [-m media_label] -M mount_point mm/dd/yyyy
       xfsinvutil [-F|-i] [-m media_label] -u UUID mm/dd/yyyy
       xfsinvutil [-F] -s SESSION_ID
       xfsinvutil -i
       xfsinvutil -C

DESCRIPTION
       xfsdump maintains an online dump inventory in /var/lib/xfsdump/inventory.  The -I option of xfsdump displays the inventory contents hierarchically.  The levels of the hierarchy are: filesystem, dump
       session, stream, and media file.

       xfsinvutil is a utility to check this inventory database for consistency, to remove entries of dump sessions which may no longer be of relevance, and to browse the contents of the inventory.

       The following command line options are available:

       -F   Don't prompt the operator.  When xfsinvutil encounters a matching dump session, xfsinvutil will normally ask the operator for permission to delete the entry. With this option  the  deletion  is
            performed, no questions asked.

       -i   Interactive  mode.   Causes  xfsinvutil  to run in a mode that will allow the operator to browse and modify the contents of the inventory. Please refer to the Interactive Mode section below for
            more information.

       -M mount_point mm/dd/yyyy
            Prunes dump sessions identified by the given mount point which were created prior to the specified date. Optionally -m may be be specified to further limit the matching dump sessions  by  media
            label.  xfsinvutil will prompt the operator prior to pruning a dump session unless the -F or -i options are given.

       -u UUID mm/dd/yyyy
            Like -M, except the matching filesystem is specified using its universally unique identifier (UUID) instead of its mount point.

       -m media_label
            If specified, only sessions with at least one media file whose label matches this value will be eligible for pruning.  This restriction is in addition to those imposed by the date and the -M or
            -u options.  This option allows the pruning of all inventory references to media which may have been overwritten or lost. Note that this option does not apply to sessions with no media files.

       -s SESSION_ID
            Prunes the dump session identified by the given session id.  xfsinvutil will prompt the operator prior to pruning a dump session unless the -F option is given.

       -C   With this option, xfsinvutil performs consistency checks for all entries in the inventory database.  It fixes any problems found. If no consistent entries are found , the  corresponding  inven‐
            tory database file is removed.

   Interactive Mode
       When  run with -i, xfsinvutil will present the operator with a hierarchical representation of the xfsdump inventory.  In this mode, the operator can use the arrow keys (or the h j k l keys) to navi‐
       gate the inventory and also use the following keys and functionality:

       +    Expand a branch of the tree.

       -    Collapse a branch of the tree.

       *    Fully expand a branch of the tree.

       %    Fully collapse a branch of the tree.

       h    Move selection to the parent entry.

       l    Move selection to the child entry.

       j    Move selection to next entry.

       k    Move selection to previous entry.

       d    Mark the current record, and all sub-records, to be deleted.

       u    Clear the current record and all parent records from being deleted.

       i    Import another xfsdump inventory.

       ?    Show help window.

       x    Commit any changes made to the inventory, and exit the program.

       q    Exit the program without committing any changes to the inventory.

       Inventories from other hosts can be imported to create a larger common inventory.  It is recommended that the contents of /var/lib/xfsdump/inventory on the remote host be copied to a temporary local
       directory prior to running xfsinvutil.  When xfsinvutil is run in interactive mode, and the operator hits i, they will be prompted for the path to the inventory to be imported.  xfsinvutil will then
       add the contents of the imported inventory to the main window, and all entries will be marked as imported.  The operator can then delete any of these entries that are not to be imported.   When  the
       operator commits the changes, xfsinvutil will import any entries which were not marked as deleted.  Deleted entries are not actually deleted from the original imported inventory.

NOTES
   Inventory
       Each dump session updates an inventory database in /var/lib/xfsdump/inventory.  xfsdump uses the inventory to determine the base of incremental and resumed dumps.

       This database can be displayed by invoking xfsdump with the -I option.  The display uses tabbed indentation to present the inventory hierarchically.  The first level is filesystem.  The second level
       is session.  The third level is media stream (currently only one stream is supported).  The fourth level lists the media files sequentially composing the stream.

FILES
       /var/lib/xfsdump/inventory
                                dump inventory database

SEE ALSO
       xfsdump(8), xfsrestore(8).



                                                                                                                                                                                                xfsinvutil(8)
