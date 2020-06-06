certmonger(1)                                                                              General Commands Manual                                                                              certmonger(1)



NAME
       local-getcert


SYNOPSIS
        local-getcert request [options]
        local-getcert resubmit [options]
        local-getcert start-tracking [options]
        local-getcert status [options]
        local-getcert stop-tracking [options]
        local-getcert list [options]
        local-getcert list-cas [options]
        local-getcert refresh-cas [options]


DESCRIPTION
       The  local-getcert tool issues requests to a org.fedorahosted.certmonger service on behalf of the invoking user.  It can ask the service to begin enrollment, optionally generating a key pair to use,
       it can ask the service to begin monitoring a certificate in a specified location for expiration, and optionally to refresh it when expiration nears, it can list the set of certificates that the ser‐
       vice is already monitoring, or it can list the set of CAs that the service is capable of using.

       If no command is given as the first command-line argument, local-getcert will print short usage information for each of its functions.

       The local-getcert tool behaves identically to the generic getcert tool when it is used with the -c local option.

       certmonger  supports  retrieving  the  list of current and previously-used local CA certificates.  See getcert-request(1) and getcert-resubmit(1) for information about using the -F and -a options to
       specify where those certificates should be stored.


BUGS
       Please file tickets for any that you find at https://fedorahosted.org/certmonger/


SEE ALSO
       certmonger(8) getcert(1) getcert-add-ca(1) getcert-add-scep-ca(1) getcert-list-cas(1) getcert-list(1)  getcert-modify-ca(1)  getcert-refresh-ca(1)  getcert-refresh(1)  getcert-remove-ca(1)  getcert-
       request(1) getcert-resubmit(1) getcert-start-tracking(1) getcert-status(1) getcert-stop-tracking(1) certmonger-certmaster-submit(8) certmonger-dogtag-ipa-renew-agent-submit(8) certmonger-dogtag-sub‐
       mit(8) certmonger-ipa-submit(8) certmonger-local-submit(8) certmonger-scep-submit(8) certmonger_selinux(8)



certmonger Manual                                                                                7 June 2014                                                                                    certmonger(1)
