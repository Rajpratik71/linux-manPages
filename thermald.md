thermald(8)                                                                              System Manager's Manual                                                                              thermald(8)

NAME
       thermald - start Linux thermal daemon

SYNOPSIS
       thermald  [ OPTIONS ]

DESCRIPTION
       thermald is a Linux daemon used to prevent the overheating of platforms. This daemon monitors temperature and applies compensation using available cooling methods.

       By default, it monitors CPU temperature using available CPU digital temperature sensors and maintains CPU temperature under control, before HW takes aggressive correction action.

       Thermal daemon looks for thermal sensors and thermal cooling drivers in the Linux thermal sysfs (/sys/class/thermal) and builds a list of sensors and cooling drivers. Each of the thermal sensors
       can optionally be binded to a cooling drivers by the in kernel drivers. In this case the Linux kernel thermal core can directly take actions based on the temperature trip points, for each sensor
       and associated cooling device. For example a trip temperature X in a sensor can be associates a cooling driver Y. So when the sensor temperature = X, the cooling driver "Y" is activated.

       Thermal  daemon allows to change this relationship or add new one via a thermal configuration file (thermal-conf.xml). This file is automatically created and used, if the platform has ACPI ther‐
       mal relationship table. If not this needs to be manually configured.

       When there is a sensor, which has no associate cooling device, via configuration file or thermal relationship table, then this sensor is tested for relationship with CPU load dynamically  up  to
       maximum 3 times. If there is no relationship, then it is added to a black list of unbinded sensors and not tried again.

       Optionally  thermal  daemon can act as an exclusive thermal controller by using thermal sysfs and acting as a user space governor.  In this case kernel thermal core is not active and decision is
       taken by thermal daemon only.

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
              Poll interval in seconds: Poll for zone temperature changes.  To disable polling, set to zero. Polling can only be disabled, if available temperature sensors can notify temperature change
              asynchronously.

       --dbus-enable
              Enable Dbus.

       --exclusive-control
              Act as exclusive thermal controller. This will use user-space governor for thermal sysfs and take over control.

SEE ALSO
       thermal-conf.xml(5)

                                                                                                8 May 2013                                                                                    thermald(8)
