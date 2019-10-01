swift-account-reaper(1)                                                                        OpenStack Swift                                                                        swift-account-reaper(1)



NAME
       swift-account-reaper - OpenStack Swift account reaper


SYNOPSIS
       swift-account-reaper [CONFIG] [-h|--help] [-v|--verbose] [-o|--once]


DESCRIPTION
       Removes data from status=DELETED accounts. These are accounts that have been asked to be removed by the reseller via services remove_storage_account XMLRPC call.

       The  account  is  not  deleted immediately by the services call, but instead the account is simply marked for deletion by setting the status column in the account_stat table of the account database.
       This account reaper scans for such accounts and removes the data in the background. The background deletion process will occur on the primary account server for the account.

       The options are as follows:

           -v
           --verbose
               log to console
           -o
           --once
               only run one pass of daemon



DOCUMENTATION
       More in depth documentation in regards to swift-object-auditor and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/



SEE ALSO
       account-server.conf(5)



Linux                                                                                             8/26/2011                                                                           swift-account-reaper(1)
