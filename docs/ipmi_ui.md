ipmi_ui(1)                                                                            Crude interface to an IPMI system                                                                            ipmi_ui(1)



NAME
       ipmi_ui - Crude interface to an IPMI system


SYNOPSIS
       ipmiui [-dmsg] [-dmem] [-c] connection-1[connection-2]

       The connections are specified as either:

       smi smi-num

       or

       lan IP-addr port [IP-addr-2 port-2] auth privilege username password


DESCRIPTION
       The  ipmi_ui  program  connects  to  an IPMI system, and allows access to IPMI entities and sensors and OpenIPMI controls.  It's rather crude, and primarily for testing OpenIPMI, but it has some use
       beyond that so it is provided.

       Normally, ipmi_ui starts up in a full-screen format.  The left window shows the output of commands, the right window shows the logs from OpenIPMI.  Both windows are scrollable with page up and  page
       down keys, press the "F1" key to choose the the left window to scroll, the "F2" key to choose the right window to scroll.

       Note that you must set your environment TERM variable properly for your terminal, or ipmi_ui will display garbage on the screen.

       Note  that you can put two connection specifications on the command line, and ipmi_ui will make two connection.  You can only do this if the connections are to the same IPMI domain through different
       management controllers.  Also, each LAN connection may have two IP addresses.  These are two different addresses to the same management controller.  So you may have a total of 4 IP addresses  to  an
       IPMI domain, two management controllers and two IP adresses to each management controller.


OPTIONS
       -dmsg  Turn on message debugging, this will dump all messages to the log window.

       -dmem  Turn on memory debugging, this will cause memory allocation and deallocations to be checked.  When the program terminates, it will dump all memory that was not properly freed (leaked).

       -snmp  Enable the SNMP trap handler.  ipmi_ui must be compiled with SNMP code enabled for this option to be available.

       -c     Run the program in command-line mode.  This is useful for scripting.  All output goes to standard output, there is no windowing.


       smi-num
              The SMI number to connect to, for systems with more than on system interface.  Generally, this is '0'.


       IP-addr
              The IP address of the LAN interface.


       port   The UDP port of the LAN interface, general 623.


       IP-addr-2
              Some  systems support multiple IP connections, this specified the second address and is optional.  If specified, OpenIPMI will use both IP addresses and fail over to the working one if one of
              them fails.


       port-2 The port for the second IP connection, generally 623.


       auth   The authorization to use for the connection, either "none", "straight", "md5", or "md2".


       privilege
              The privilege to use for the connection, either "callback", "user", "operator", or "admin".  Note that some IPMI operations will fail without the correct privilege.


       username
              The user name to use for the connection.  If using this anonymous user, this should be the empty string "".


       password
              The password to use for the connection.


ENTITIES
       Entities are listed by their entity id (the type of entity they are) and their entity instance.  Entities may be active or inactive in the system, the standard IPMI algorithm for determining this is
       used.  Commands on entities are:


       entities
              List all the entities in the system.  The output is the entity specifier, followed by an optional entity name in parenthesis, followed by "present" or "not present".


       check_presence
              For the check of presence for all entities.


       fru entity
              List the FRU information associated with the entity.


       dump_fru is_logical device_address device_id lun private_bus channel
              Dump raw information from the specified FRU device.


SENSORS
       Sensors define input devices that OpenIPMI can monitor.


       sensors entity
              List  all the sensors that monitor the given entity.  The output is the sensor specifier (the entity specifier followed by the sensor name, with spaces converted to ~). followed by the sensor
              name.


       sensor sensor
              Pull up the given sensor and display all its information.  In full-screen mode, the sensor will be re-queried every second.


       rearm global [assertion-mask deassertion-mask]
              Rearm the given sensor.  If global is 1, then the whole sensor is rearmed.  If global is 0, then the assertion-mask and deassertion-mask must be specified telling which thresholds  or  states
              to rearm.


       events_enable events scanning assertion-bitmask deassertion-bitmask
              Enable  or  disable events for the given sensor.  events turns events on or off from the sensor (0 or 1).  scanning turns scanning on or off for the sensor (0 or 1).  assertion-bitmask speci-
              fies the bitmask of thresholds or states that should be enabled or disabled when a thrshold or state is asserted.  It is a bunch of 0's and 1's, where the first one is for threshold/state  0,
              the second for threshold/state 1, etc.  deassertion-bitmask specifies the bitmask of thresholds or states that should be enabled or disabled when a thrshold or state is deasserted.


CONTROLS
       Controls are output devices that can control things like LEDs, power, reset lines and such.


       controls entity
              List all the controls that control the given entity.  The output is the control specifier (the entity specifier followed by the control name, with spaces converted to ~). followed by the con-
              trol name.


       control control
              Pull up the given control and display it's current state.


       set_control val1 [val2 ...]
              Change the value of a control.  Note that for controls with multiple values, every value must be specified.



EVENTS
       Events are asynchronous messages from sensors that tell the user that a sensor has done something.  Events are generally stored in a system event log (SEL); OpenIPMI will fetch the events  from  the
       SELs in the system.

       Since multiple SELs may exist, an event is specified by the MC it came from in the format "(channel addr)" and a log number.  The same log number may exist in multiple MCs.

       Events are displayed in the log window as they come in.  If they can be correlated with a sensor, they will be display with as much information as possible.


       delevent channel mc-addr log-num
              Delete the given event.  Note that many SELs do not support individual deletes, so this may only delete the local copy of the event, not the one in the SEL.  In this case, to delete events in
              the SEL, you must delete all the events in the SEL and wait about 10 seconds for OpenIPMI to do a full SEL clear.


       clear_sel
              Delete all events in the SEL.  This process may take some time, so if you do this and quit immediately it may not be complete.


       list_sel
              List all events in the local copy of the SELs.  This is only the local copy, if the copies in the actual have change, this won't be reflected.


       get_sel_time channel mc-num
              Get the time in the SEL for the given MC.



MANAGMENT CONTROLLERS (MCs)
       In OpenIPMI, you normally don't deal with management controllers.  They are considered internal to the system.  However, for debugging, information about them is provided.


       mcs    List all the MCs in the system and whether they are active.  MCs are displayed in the format "(channel address)".


       mc channel mc-addr
              Display a boatload of information about the MC, mostly coming from the get device id command.


       mccmd channel mc-addr LUN NetFN Cmd [data ...]
              Send an IPMI command to the given MC.  The MC must exist and be active to do this.


       mc_reset channel mc-addr [warm | cold]
              Send a warm or cold reset command to the given MC.  The action the MC takes is system-specific.


       scan channel mc-addr
              Scan for an MC at the given address.  If the MC exists but OpenIPMI didn't know about it, it will be added.  If the MC no longer exists, then it will be removed.


       mc_events_enable channel mc-num enabled
              Enable or disable event generation for the given MC.


       mc_events_enabled channel mc-num
              Prints out if the events are enabled for the given MC.



LAN Parameter Configuration
       OpenIPMI has functions that make it easier to configure the LAN parameters of a LAN connection.  Note that the LAN parameters have a lock that OpenIPMI attempts to use.  If you read the LAN  parame-
       ters, they will be locked until you either write them or clear the lock.


       readlanparm channel mc-num channel
              Read lanparm information from an MC and display it in the display window.


       viewlanparm
              Show current lanparm information in the display window.


       writelanparm channel mc-num channel
              Write the current LANPARM information to an MC.  Note that this must be the MC that the parameters were read from.


       clearlanparmlock [channel mc-num channel]
              Clear a LANPARM lock.  If the MC is given, then the LANPARM lock is directly cleared.  If not given, then the LANPARM lock for the current parms is cleared.


       setlanparm config [selector] value
              Set the given config item to the value.  The optional selector is used for items that take a selector, like "auth" or any of the items in "destination".


Platform Event Filter (PEF)
       OpenIPMI  contains  function  to  help manage the PEF settings on a BMC.  Note that the PEF parameters have a lock that OpenIPMI attempts to use.  If you read the PEF parameters, they will be locked
       until you either write them or clear the lock.


       readpef channel mc-num
              Read the PEF information from an MC.


       clearpeflock [channel mc-num]
              Clear a PEF lock.  If the MC is given, then the PEF lock on that MC is directly cleared.  If no MC is given, then the current PEF's lock is cleared.


       viewpef
              Show current pef information in the display window.


       writepef channel mc-num
              Write the current PEF information to an MC.


       setpef config [selector] value
              Set the given config item to the value.  The optional selector is used for items that take a selector, like anything in the event filters, alert policies, or alert strings.


       pet connection channel ip-addr mac_addr eft-selector policy-num apt-selector lan-dest-selector
              Set up the connection for the domain to send PET traps from the given connection to the given IP/MAC address over the given channel.  This does all the LAN and PEF configuration  required  to
              configure a system to send event traps.



CONNECTIONS
       OpenIPMI  can  maintain  multiple connections to a single domain.  It will generally only use one of these at a time (although the other will constantly be under test).  This is the "active" connec-
       tion.  You can query and set which connection is active.

       The connection number is the connection from the command line.  You can specify two connections on the command line (the part beginning with "lan", "smi", etc.).  The first connection you specify is
       connection zero, the second is connection 1.


       is_con_active connection
              Print out if the given connection is active or not.


       activate_con connection
              Activate the given connection.



OTHER COMMANDS
       msg channel IPMB-addr LUN NetFN Cmd [data ...]
              Send an IPMI command to the given IPMB address.  This is available in case the given MC cannot be found or enabled.


       sdrs channel mc-addr do-sensors
              Dump all the sdrs from the given MC.  If do-sensors is true, then dump the device SDR.  If it is false, dump the main SDR repository on the MC.


       scan channel IPMB-addr
              Perform an IPMB bus scan for the given IPMB, to try to detect an MC at the given address.  IPMB bus scanning can be slow, this can help speed things up if you already know the address.


       quit   Leave the program.


       reconnect
              Attempt to disconnect and reconnect to the IPMI controller.  This is primarily for testing.


       display_win
              Set the display window (left window) for scrolling, just in case the "F1" key doesn't work.


       log_win
              Set the log window (right window) for scrolling, just in case the "F2" key doesn't work.


       help   Dump some terse help output about all the commands.



ERROR OUTPUT
       All error output goes to the log window.


SEE ALSO
       ipmilan(8)


KNOWN PROBLEMS
       Our name is legion.


AUTHOR
       Corey Minyard <cminyard@mvista.com>



OpenIPMI                                                                                           05/13/03                                                                                        ipmi_ui(1)
