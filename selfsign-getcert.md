certmonger(1)                                                                              General Commands Manual                                                                              certmonger(1)



NAME
       selfsign-getcert


SYNOPSIS
        selfsign-getcert request [options]
        selfsign-getcert resubmit [options]
        selfsign-getcert start-tracking [options]
        selfsign-getcert status [options]
        selfsign-getcert stop-tracking [options]
        selfsign-getcert list [options]
        selfsign-getcert list-cas [options]
        selfsign-getcert refresh-cas [options]


DESCRIPTION
       The  selfsign-getcert  tool  issues requests to a org.fedorahosted.certmonger service on behalf of the invoking user.  It can ask the service to begin enrollment, optionally generating a key pair to
       use, it can ask the service to begin monitoring a certificate in a specified location for expiration, and optionally to refresh it when expiration nears, it can list the set of certificates that the
       service is already monitoring, or it can list the set of CAs that the service is capable of using.

       If no command is given as the first command-line argument, selfsign-getcert will print short usage information for each of its functions.

       The selfsign-getcert tool behaves identically to the generic getcert tool when it is used with the -c SelfSign option.

       certmonger's self-signer doesn't use root certificates.  While the -F and -a options will still be recognized, they will effectively be ignored.


BUGS
       Please file tickets for any that you find at https://fedorahosted.org/certmonger/


SEE ALSO
       certmonger(8)  getcert(1)  getcert-add-ca(1)  getcert-add-scep-ca(1)  getcert-list-cas(1)  getcert-list(1) getcert-modify-ca(1) getcert-refresh-ca(1) getcert-refresh(1) getcert-remove-ca(1) getcert-
       request(1) getcert-resubmit(1) getcert-start-tracking(1) getcert-status(1) getcert-stop-tracking(1) certmonger-certmaster-submit(8) certmonger-dogtag-ipa-renew-agent-submit(8) certmonger-dogtag-sub‐
       mit(8) certmonger-ipa-submit(8) certmonger-local-submit(8) certmonger-scep-submit(8) certmonger_selinux(8)



certmonger Manual                                                                              3 November 2009                                                                                  certmonger(1)
