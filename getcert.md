certmonger(1)                                                                              General Commands Manual                                                                              certmonger(1)



NAME
       getcert


SYNOPSIS
        getcert request [options]
        getcert resubmit [options]
        getcert start-tracking [options]
        getcert status [options]
        getcert stop-tracking [options]
        getcert list [options]
        getcert list-cas [options]
        getcert refresh-cas [options]


DESCRIPTION
       The getcert tool issues requests to a org.fedorahosted.certmonger service on behalf of the invoking user.  It can ask the service to begin enrollment, optionally generating a key pair to use, it can
       ask the service to begin monitoring a certificate in a specified location for expiration, and optionally to refresh it when expiration nears, it can list the set of certificates that the service  is
       already monitoring, or it can list the set of CAs that the service is capable of using.

       If no command is given as the first command-line argument, getcert will print short usage information for each of its functions.

       If getcert is invoked by a user with UID 0, and there is no system bus available, getcert will attempt to launch a temporary copy of the certmonger daemon to handle its requests.


COMMON ARGUMENTS
       If  CERTMONGER_PVT_ADDRESS is set in the environment, getcert contacts the service directly at the specified location.  All commands can take either the -s or -S arguments, which instruct getcert to
       contact the org.fedorahosted.certmonger service on the session or system bus, if no value is set.  By default, getcert consults the org.fedorahosted.certmonger service attached to the system bus.


BUGS
       Please file tickets for any that you find at https://fedorahosted.org/certmonger/


SEE ALSO
       certmonger(8) getcert-add-ca(1) getcert-add-scep-ca(1) getcert-list-cas(1)  getcert-list(1)  getcert-modify-ca(1)  getcert-refresh-ca(1)  getcert-refresh(1)  getcert-remove-ca(1)  getcert-request(1)
       getcert-resubmit(1) getcert-start-tracking(1) getcert-status(1) getcert-stop-tracking(1) certmonger-certmaster-submit(8) certmonger-dogtag-ipa-renew-agent-submit(8) certmonger-dogtag-submit(8) cert‐
       monger-ipa-submit(8) certmonger-local-submit(8) certmonger-scep-submit(8) certmonger_selinux(8)



certmonger Manual                                                                              3 November 2009                                                                                  certmonger(1)
