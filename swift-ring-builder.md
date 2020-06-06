swift-ring-builder(1)                                                                          OpenStack Swift                                                                          swift-ring-builder(1)



NAME
       swift-ring-builder - OpenStack Swift ring builder


SYNOPSIS
       swift-ring-builder <builder_file> <commands> <arguments> <...>


DESCRIPTION
       The  swift-ring-builder utility is used to create, search and manipulate the swift storage ring. The ring-builder assigns partitions to devices and writes an optimized Python structure to a gzipped,
       pickled file on disk for shipping out to the servers. The server processes just check the modification time of the file occasionally and reload their  in-memory  copies  of  the  ring  structure  as
       needed.  Because of how the ring-builder manages changes to the ring, using a slightly older ring usually just means one of the three replicas for a subset of the partitions will be incorrect, which
       can be easily worked around.

       The ring-builder also keeps its own builder file with the ring information and additional data required to build future rings. It is very important to keep multiple backup copies  of  these  builder
       files.  One  option  is  to  copy  the  builder files out to every server while copying the ring files themselves.  Another is to upload the builder files into the cluster itself. Complete loss of a
       builder file will mean creating a new ring from scratch, nearly all partitions will end up assigned to different devices, and therefore nearly all data stored will have to be replicated to new loca‐
       tions. So, recovery from a builder file loss is possible, but data will definitely be unreachable for an extended time.

       If  invoked as 'swift-ring-builder-safe' the directory containing the builder file provided will be locked (via a .lock file in the files parent directory).  This provides a basic safe guard against
       multiple instances of the swift-ring-builder (or other utilities that observe this lock) from attempting to write to or read the builder/ring files while operations are in progress. This can be use‐
       ful in environments where ring management has been automated but the operator still needs to interact with the rings manually.



SEARCH
       <search-value>
            Can be of the form:
            d<device_id>r<region>z<zone>-<ip>:<port>/<device_name>_<meta>

            Any part is optional, but you must include at least one, examples:

               d74              Matches the device id 74
               z1               Matches devices in zone 1
               z1-1.2.3.4       Matches devices in zone 1 with the ip 1.2.3.4
               1.2.3.4          Matches devices in any zone with the ip 1.2.3.4
               r1z1:5678        Matches devices in zone 1 present in region 1 using port 5678
               z1:5678          Matches devices in zone 1 using port 5678
               :5678            Matches devices that use port 5678
               /sdb1            Matches devices with the device name sdb1
               _shiny           Matches devices with shiny in the meta data
               _'snet: 5.6.7.8' Matches devices with snet: 5.6.7.8 in the meta data
               [::1]            Matches devices in any zone with the ip ::1
               z1-[::1]:5678    Matches devices in zone 1 with ip ::1 and port 5678

            Most specific example:

               d74z1-1.2.3.4:5678/sdb1_"snet: 5.6.7.8"

            Nerd explanation:

               All items require their single character prefix except the ip, in which case the - is optional unless the device id or zone is also included.



OPTIONS
       -y, --yes
              Assume a yes response to all questions


COMMANDS
       <builder_file>
            Shows information about the ring and the devices within.


       search  <search-value>
            Shows information about matching devices.


       add z<zone>-<ip>:<port>/<device_name>_<meta> <weight>
       add r<region>z<zone>-<ip>:<port>/<device_name>_<meta> <weight>
       add -r <region> -z <zone> -i <ip> -p <port> -d <device_name> -m <meta> -w <weight>
            Adds  a  device  to  the  ring  with the given information. No partitions will be assigned to the new device until after running 'rebalance'. This is so you can make multiple device changes and
            rebalance them all just once.


       create <part_power> <replicas> <min_part_hours>
            Creates <builder_file> with 2^<part_power> partitions and <replicas>.  <min_part_hours> is number of hours to restrict moving a partition more than once.


       list_parts <search-value> [<search-value>] ..
            Returns a 2 column list of all the partitions that are assigned to any of the devices matching the search values given. The first column is the assigned partition number and the  second  column
            is  the number of device matches for that partition. The list is ordered from most number of matches to least. If there are a lot of devices to match against, this command could take a while to
            run.


       rebalance
            Attempts to rebalance the ring by reassigning partitions that haven't been recently reassigned.


       remove <search-value>
            Removes the device(s) from the ring. This should normally just be used for a device that has failed. For a device you wish to decommission, it's best to set its weight to  0,  wait  for  it  to
            drain all its data, then use this remove command. This will not take effect until after running 'rebalance'.  This is so you can make multiple device changes and rebalance them all just once.


       set_info <search-value> <ip>:<port>/<device_name>_<meta>
            Resets  the  device's  information. This information isn't used to assign partitions, so you can use 'write_ring' afterward to rewrite the current ring with the newer device information. Any of
            the parts are optional in the final <ip>:<port>/<device_name>_<meta> parameter; just give what you want to change. For instance set_info d74 _"snet: 5.6.7.8" would just update the meta data for
            device id 74.


       set_min_part_hours <hours>
            Changes  the  <min_part_hours> to the given <hours>. This should be set to however long a full replication/update cycle takes. We're working on a way to determine this more easily than scanning
            logs.


       set_weight <search-value> <weight>
            Resets the device's weight. No partitions will be reassigned to or from the device until after running 'rebalance'. This is so you can make multiple device changes and rebalance them  all  just
            once.


       validate
            Just runs the validation routines on the ring.


       write_ring
            Just  rewrites the distributable ring file. This is done automatically after a successful rebalance, so really this is only useful after one or more 'set_info' calls when no rebalance is needed
            but you want to send out the new device information.


       Quick list: add create list_parts rebalance remove search set_info
                   set_min_part_hours set_weight validate write_ring

       Exit codes: 0 = ring changed, 1 = ring did not change, 2 = error





DOCUMENTATION
       More in depth documentation about the swift ring and also OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/overview_ring.html  https://docs.openstack.org/swift/lat‐
       est/admin_guide.html#managing-the-rings and https://docs.openstack.org/swift/latest/



Linux                                                                                             8/26/2011                                                                             swift-ring-builder(1)
