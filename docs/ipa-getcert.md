certmonger(1)                                                                              General Commands Manual                                                                              certmonger(1)



NAME
       ipa-getcert


SYNOPSIS
        ipa-getcert request [options]
        ipa-getcert resubmit [options]
        ipa-getcert start-tracking [options]
        ipa-getcert status [options]
        ipa-getcert stop-tracking [options]
        ipa-getcert list [options]
        ipa-getcert list-cas [options]
        ipa-getcert refresh-cas [options]


DESCRIPTION
       The ipa-getcert tool issues requests to a org.fedorahosted.certmonger service on behalf of the invoking user.  It can ask the service to begin enrollment, optionally generating a key pair to use, it
       can ask the service to begin monitoring a certificate in a specified location for expiration, and optionally to refresh it when expiration nears, it can list the set of certificates that the service
       is already monitoring, or it can list the set of CAs that the service is capable of using.

       If no command is given as the first command-line argument, ipa-getcert will print short usage information for each of its functions.

       The ipa-getcert tool behaves identically to the generic getcert tool when it is used with the -c IPA option.

       certmonger  supports  retrieving  trusted certificates from IPA CAs.  See getcert-request(1) and getcert-resubmit(1) for information about using the -F and -a options to specify where those certifi‐
       cates should be stored.


BUGS
       Please file tickets for any that you find at https://fedorahosted.org/certmonger/


SEE ALSO
       certmonger(8) getcert(1) getcert-add-ca(1) getcert-add-scep-ca(1) getcert-list-cas(1) getcert-list(1)  getcert-modify-ca(1)  getcert-refresh-ca(1)  getcert-refresh(1)  getcert-remove-ca(1)  getcert-
       request(1) getcert-resubmit(1) getcert-start-tracking(1) getcert-status(1) getcert-stop-tracking(1) certmonger-certmaster-submit(8) certmonger-dogtag-ipa-renew-agent-submit(8) certmonger-dogtag-sub‐
       mit(8) certmonger-ipa-submit(8) certmonger-local-submit(8) certmonger-scep-submit(8) certmonger_selinux(8)



certmonger Manual                                                                              3 November 2009                                                                                  certmonger(1)
