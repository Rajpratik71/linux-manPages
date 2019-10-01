SWIFT-ACCOUNT-AUDIT(1)                                                                     General Commands Manual                                                                     SWIFT-ACCOUNT-AUDIT(1)



NAME
       swift-account-audit - manually audit OpenStack Swift accounts


SYNOPSIS
       swift-account-audit [options] [url 1] [url 2] ...


DESCRIPTION
       The swift-account-audit cli tool can be used to audit the data for an account.  It crawls the account, checking that all containers and objects can be found.

       You can also feed a list of URLs to the script through stdin.


OPTIONS
       -c concurrency
              Set the concurrency, default 50

       -r ring dir
              Ring locations, default /etc/swift

       -e filename
              File for writing a list of inconsistent URLs

       -d     Also download files and verify md5


EXAMPLES
       /usr/bin/swift-account-audit AUTH_88ad0b83-b2c5-4fa1-b2d6-60c597202076
       /usr/bin/swift-account-audit AUTH_88ad0b83-b2c5-4fa1-b2d6-60c597202076/container/object
       /usr/bin/swift-account-audit -e errors.txt AUTH_88ad0b83-b2c5-4fa1-b2d6-60c597202076/container
       /usr/bin/swift-account-audit < errors.txt
       /usr/bin/swift-account-audit -c 25 -d < errors.txt


DOCUMENTATION
       More in depth documentation in regards to swift-account-audit and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/ and https://docs.openstack.org



OpenStack Swift                                                                                  August 2016                                                                           SWIFT-ACCOUNT-AUDIT(1)
