thermald(8)                             System Manager's Manual                            thermald(8)

NAME
       thermald - start Linux thermal daemon

SYNOPSIS
       thermald  [ OPTIONS ]

DESCRIPTION
       thermald  is  a Linux daemon used to prevent the overheating of platforms. This daemon monitors
       temperature and applies compensation using available cooling methods.

       By default, it monitors CPU temperature using available CPU  digital  temperature  sensors  and
       maintains CPU temperature under control, before HW takes aggressive correction action.

       Thermal daemon looks for thermal sensors and thermal cooling drivers in the Linux thermal sysfs
       (/sys/class/thermal) and builds a list of sensors and cooling drivers. Each of the thermal sen‐
       sors  can  optionally be binded to a cooling drivers by the in kernel drivers. In this case the
       Linux kernel thermal core can directly take actions based on the temperature trip  points,  for
       each  sensor and associated cooling device. For example a trip temperature X in a sensor can be
       associates a cooling driver Y. So when the sensor temperature = X, the cooling  driver  "Y"  is
       activated.

       Thermal  daemon  allows one to change this relationship or add new one via a thermal configura‐
       tion file (thermal-conf.xml). This file is automatically  created  (thermal-conf.xml.auto)  and
       used,  if  the  platform has ACPI thermal relationship table.  If not this needs to be manually
       configured.

       For manual configuration refer to the manual page of the thermal-conf.xml.

       In some newer platforms the auto creation of the config file is done by a companion tool  "dpt‐
       fxtract".  This  tool  can be downloaded from "https://github.com/intel/dptfxtract". It is sug‐
       gested as parts of the install process, run dptfxtract.

       There can be multiple configuration files. User can select a configuration  file  via  -config-
       file  option  to  overide the default selection. The default selection picks one of the file in
       the following order:

       - /etc/thermald/thermal-conf.xml.auto

       - /var/run/thermald/thermal-conf.xml.auto

       - /etc/thermald/thermal-conf.xml

       (*Assuming configure prefix=/ is used during build.)

       There is another companion tool "ThermalMonitor", which presents a graphical  front  end.  This
       allows  the  monitoring of sensors and changing of thermal trips to give the user more control.
       The source code of "ThermalMonitor" is a part of the  thermald  github  source,  in  the  tools
       folder.

OPTIONS
       -h, --help
              Show help options.

       --version
              Print thermald version and exit.

       --no-daemon
              Don't become a daemon: Default is daemon mode.

       --loglevel=info
              log severity: info level and up.

       --loglevel=debug
              log severity: debug level and up: Max logging.

       --poll-interval
              Poll interval in seconds: Poll for zone temperature changes.  To disable polling, set to
              zero. Polling can only be disabled, if available temperature sensors can notify tempera‐
              ture change asynchronously.

       --dbus-enable
              Enable Dbus.

       --exclusive-control
              Act as exclusive thermal controller. This will use user-space governor for thermal sysfs
              and take over control.

       --ignore-cpuid-check
              Ignore cpuid check for supported CPU models.

       --config-file
              Specify thermal-conf.xml path and ignore default thermal-conf.xml.

       --ignore-default-control
              Ignore default CPU temperature control. Strictly  follow  thermal-conf.xml  or  thermal-
              conf.xml.auto.   --workaround-enabled Enable special workarounds. This is currently used
              for /dev/mem based power control.  --disable-active-power Disable active  power  manage‐
              ment. This will not set active power limits.

SEE ALSO
       thermal-conf.xml(5)

                                              8 May 2013                                   thermald(8)
