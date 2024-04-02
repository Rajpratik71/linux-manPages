IBQUERYERRORS(8)                                                                              OpenIB Diagnostics                                                                             IBQUERYERRORS(8)



NAME
       IBQUERYERRORS - query and report IB port counters

SYNOPSIS
       ibqueryerrors [options]

DESCRIPTION
       The default behavior is to report the port error counters which exceed a threshold for each port in the fabric.  The default threshold is zero (0).  Error fields can also be suppressed entirely.

       In addition to reporting errors on every port.  ibqueryerrors can report the port transmit and receive data as well as report full link information to the remote port if available.

OPTIONS
       -s, --suppress <err1,err2,...> Suppress the errors listed in the comma separated list provided.

       -c, --suppress-common Suppress some of the common "side effect" counters.  These counters usually do not indicate an error condition and can be usually be safely ignored.

       -r, --report-port Report the port information.  This includes LID, port, external port (if applicable), link speed setting, remote GUID, remote port, remote external port (if applicable), and remote
       node description information.

       --data Include the optional transmit and receive data counters.

       --threshold-file <filename> Specify an alternate threshold file.  The default is /etc/infiniband-diags/error_thresholds

       --switch  print data for switch's only

       --ca  print data for CA's only

       --skip-sl  Use the default sl for queries. This is not recommended when using a QoS aware routing engine as it can cause a credit deadlock.

       --router  print data for routers only

       --clear-errors -k Clear error counters after read.

       --clear-counts -K Clear data counters after read.

       CAUTION clearing data or error counters will occur regardless of if they are printed or not.  See --counters and --data for details on controlling which counters are printed.

       --details include receive error and transmit discard details

       --counters print data counters only

   Partial Scan flags
       The node to start a partial scan can be specified with the following addresses.

       --port-guid, -G <port_guid>  Specify a port_guid

       -D, --Direct <dr_path>     The address specified is a directed route

          Examples:
             -D "0"          # self port
             -D "0,1,2,1,4"  # out via port 1, then 2, ...

             (Note the second number in the path specified must match the port being
             used.  This can be specified using the port selection flag '-P' or the
             port found through the automatic selection process.)

       Note: For switches results are printed for all ports not just switch port 0.

       -S <port_guid> same as "-G". (provided only for backward compatibility)

   Cache File flags
       --load-cache <filename> Load and use the cached ibnetdiscover data stored in the specified filename.  May be useful for outputting and learning about other fabrics or a previous state of a fabric.

   Port Selection flags
       -C, --Ca <ca_name>    use the specified ca_name.

       -P, --Port <ca_port>    use the specified ca_port.

   Local port Selection
       Multiple port/Multiple CA support: when no IB device or port is specified (see the "local umad parameters" below), the libibumad library selects the port to use by the following criteria:

          1. the first port that is ACTIVE.

          2. if not found, the first port that is UP (physical link up).

          If a port and/or CA name is specified, the libibumad library attempts to fulfill the user request, and will fail if it is not possible.

          For example:

              ibaddr                 # use the first port (criteria #1 above)
              ibaddr -C mthca1       # pick the best port from "mthca1" only.
              ibaddr -P 2            # use the second (active/up) port from the first available IB device.
              ibaddr -C mthca0 -P 2  # use the specified port only.

   Configuration flags
       --config, -z  <config_file> Specify alternate config file.
          Default: /etc/infiniband-diags/ibdiag.conf

       --outstanding_smps, -o <val>
              Specify the number of outstanding SMP's which should be issued during the scan

              Default: 2

       --node-name-map <node-name-map> Specify a node name map.
          This file maps GUIDs to more user friendly names.  See FILES section.

       -t, --timeout <timeout_ms> override the default timeout for the solicited mads.

       -y, --m_key <key>
              use the specified M_key for requests. If non-numeric value (like 'x') is specified then a value will be prompted for.

   Debugging flags
       -d     raise the IB debugging level.  May be used several times (-ddd or -d -d -d).

       -e     show send and receive errors (timeouts and others)

       -h, --help      show the usage message

       -v, --verbose
              increase the application verbosity level.  May be used several times (-vv or -v -v -v)

       -V, --version     show the version info.

       -R  (This option is obsolete and does nothing)

EXIT STATUS
       -1 if scan fails.

       0 if scan succeeds without errors beyond thresholds

       1 if errors are found beyond thresholds or inconsistencies are found in check mode.

FILES
   ERROR THRESHOLD
       /etc/infiniband-diags/error_thresholds

       Define threshold values for errors.  File format is simple "name=val".  Comments begin with '#'

       Example:

          # Define thresholds for error counters
          SymbolErrorCounter=10
          LinkErrorRecoveryCounter=10
          VL15Dropped=100

   CONFIG FILE
       /etc/infiniband-diags/ibdiag.conf

       A global config file is provided to set some of the common options for all tools.  See supplied config file for details.

   NODE NAME MAP FILE FORMAT
       The node name map is used to specify user friendly names for nodes in the output.  GUIDs are used to perform the lookup.

       This functionality is provided by the opensm-libs package.  See opensm(8) for the file location for your installation.

       Generically:

          # comment
          <guid> "<name>"

       Example:

          # IB1
          # Line cards
          0x0008f104003f125c "IB1 (Rack 11 slot 1   ) ISR9288/ISR9096 Voltaire sLB-24D"
          0x0008f104003f125d "IB1 (Rack 11 slot 1   ) ISR9288/ISR9096 Voltaire sLB-24D"
          0x0008f104003f10d2 "IB1 (Rack 11 slot 2   ) ISR9288/ISR9096 Voltaire sLB-24D"
          0x0008f104003f10d3 "IB1 (Rack 11 slot 2   ) ISR9288/ISR9096 Voltaire sLB-24D"
          0x0008f104003f10bf "IB1 (Rack 11 slot 12  ) ISR9288/ISR9096 Voltaire sLB-24D"

          # Spines
          0x0008f10400400e2d "IB1 (Rack 11 spine 1   ) ISR9288 Voltaire sFB-12D"
          0x0008f10400400e2e "IB1 (Rack 11 spine 1   ) ISR9288 Voltaire sFB-12D"
          0x0008f10400400e2f "IB1 (Rack 11 spine 1   ) ISR9288 Voltaire sFB-12D"
          0x0008f10400400e31 "IB1 (Rack 11 spine 2   ) ISR9288 Voltaire sFB-12D"
          0x0008f10400400e32 "IB1 (Rack 11 spine 2   ) ISR9288 Voltaire sFB-12D"

          # GUID   Node Name
          0x0008f10400411a08 "SW1  (Rack  3) ISR9024 Voltaire 9024D"
          0x0008f10400411a28 "SW2  (Rack  3) ISR9024 Voltaire 9024D"
          0x0008f10400411a34 "SW3  (Rack  3) ISR9024 Voltaire 9024D"
          0x0008f104004119d0 "SW4  (Rack  3) ISR9024 Voltaire 9024D"

AUTHOR
       Ira Weiny
              < ira.weiny@intel.com >




                                                                                                                                                                                             IBQUERYERRORS(8)
