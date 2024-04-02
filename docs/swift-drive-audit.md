SWIFT-DRIVE-AUDIT(1)                                                                       General Commands Manual                                                                       SWIFT-DRIVE-AUDIT(1)



NAME
       swift-drive-audit - OpenStack Swift drive audit cron job


SYNOPSIS
       swift-drive-audit CONFIG


DESCRIPTION
       Tool that can be run by using cron to watch for bad drives. If errors are detected, it unmounts the bad drive, so that Swift can work around it.


DOCUMENTATION
       More in depth documentation in regards to swift-drive-audit and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/ and https://docs.openstack.org



OpenStack Swift                                                                                  August 2016                                                                             SWIFT-DRIVE-AUDIT(1)
