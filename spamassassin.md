SPAMASSASSIN(1)                                                                      User Contributed Perl Documentation                                                                      SPAMASSASSIN(1)



NAME
       spamassassin - extensible email filter used to identify spam

DESCRIPTION
       SpamAssassin is an intelligent email filter which uses a diverse range of tests to identify unsolicited bulk email, more commonly known as "spam".  These tests are applied to email headers and
       content to classify email using advanced statistical methods.  In addition, SpamAssassin has a modular architecture that allows other technologies to be quickly wielded against spam and is designed
       for easy integration into virtually any email system.

SYNOPSIS
       For ease of access, the SpamAssassin manual has been split up into several sections.  If you're intending to read these straight through for the first time, the suggested order will tend to reduce
       the number of forward references.

       Extensive additional documentation for SpamAssassin is available, primarily on the SpamAssassin web site and wiki.

       You should be able to view SpamAssassin's documentation with your man(1) program or perldoc(1).

   OVERVIEW
           spamassassin              SpamAssassin overview (this section)

   CONFIGURATION
           Mail::SpamAssassin::Conf  SpamAssassin configuration files

   USAGE
           spamassassin-run          "spamassassin" front-end filtering script
           sa-learn                  train SpamAssassin's Bayesian classifier
           spamc                     client for spamd (faster than spamassassin)
           spamd                     spamassassin server (needed by spamc)

   DEFAULT PLUGINS
           Mail::SpamAssassin::Plugin::AskDNS
           Mail::SpamAssassin::Plugin::AutoLearnThreshold
           Mail::SpamAssassin::Plugin::Bayes
           Mail::SpamAssassin::Plugin::BodyEval
           Mail::SpamAssassin::Plugin::Check
           Mail::SpamAssassin::Plugin::DKIM
           Mail::SpamAssassin::Plugin::DNSEval
           Mail::SpamAssassin::Plugin::FreeMail
           Mail::SpamAssassin::Plugin::HTMLEval
           Mail::SpamAssassin::Plugin::HTTPSMismatch
           Mail::SpamAssassin::Plugin::Hashcash
           Mail::SpamAssassin::Plugin::HeaderEval
           Mail::SpamAssassin::Plugin::ImageInfo
           Mail::SpamAssassin::Plugin::MIMEEval
           Mail::SpamAssassin::Plugin::MIMEHeader
           Mail::SpamAssassin::Plugin::Pyzor
           Mail::SpamAssassin::Plugin::Razor2
           Mail::SpamAssassin::Plugin::RelayEval
           Mail::SpamAssassin::Plugin::ReplaceTags
           Mail::SpamAssassin::Plugin::SPF
           Mail::SpamAssassin::Plugin::SpamCop
           Mail::SpamAssassin::Plugin::URIDNSBL
           Mail::SpamAssassin::Plugin::URIDetail
           Mail::SpamAssassin::Plugin::URIEval
           Mail::SpamAssassin::Plugin::VBounce
           Mail::SpamAssassin::Plugin::WLBLEval
           Mail::SpamAssassin::Plugin::WhiteListSubject

WEB SITES
           SpamAssassin web site:     http://spamassassin.apache.org/
           Wiki-based documentation:  http://wiki.apache.org/spamassassin/

USER MAILING LIST
       A users mailing list exists where other experienced users are often able to help and provide tips and advice.  Subscription instructions are located on the SpamAssassin web site.

CONFIGURATION FILES
       The SpamAssassin rule base, text templates, and rule description text are loaded from configuration files.

       Default configuration data is loaded from the first existing directory in:

       /var/lib/spamassassin/3.004000
       /usr/share/spamassassin
       /usr/share/spamassassin
       /usr/local/share/spamassassin
       /usr/share/spamassassin

       Site-specific configuration data is used to override any values which had already been set.  This is loaded from the first existing directory in:

       /etc/mail/spamassassin
       /usr/etc/mail/spamassassin
       /usr/etc/spamassassin
       /usr/local/etc/spamassassin
       /usr/pkg/etc/spamassassin
       /usr/etc/spamassassin
       /etc/mail/spamassassin
       /etc/spamassassin

       From those three directories, SpamAssassin will first read files ending in ".pre" in lexical order and then it will read files ending in ".cf" in lexical order (most files begin with two numbers to
       make the sorting order obvious).

       In other words, it will read init.pre first, then 10_default_prefs.cf before 50_scores.cf and 20_body_tests.cf before 20_head_tests.cf.  Options in later files will override earlier files.

       Individual user preferences are loaded from the location specified on the "spamassassin", "sa-learn", or "spamd" command line (see respective manual page for details).  If the location is not
       specified, ~/.spamassassin/user_prefs is used if it exists.  SpamAssassin will create that file if it does not already exist, using user_prefs.template as a template.  That file will be looked for
       in:

       /etc/mail/spamassassin
       /usr/etc/mail/spamassassin
       /usr/share/spamassassin
       /etc/spamassassin
       /etc/mail/spamassassin
       /usr/local/share/spamassassin
       /usr/share/spamassassin

TAGGING
       The following two sections detail the default tagging and markup that takes place for messages when running "spamassassin" or "spamc" with "spamd" in the default configuration.

       Note: before header modification and addition, all headers beginning with "X-Spam-" are removed to prevent spammer mischief and also to avoid potential problems caused by prior invocations of
       SpamAssassin.

   TAGGING FOR SPAM MAILS
       By default, all messages with a calculated score of 5.0 or higher are tagged as spam.

       If an incoming message is tagged as spam, instead of modifying the original message, SpamAssassin will create a new report message and attach the original message as a message/rfc822 MIME part
       (ensuring the original message is completely preserved and easier to recover).

       The new report message inherits the following headers (if they are present) from the original spam message:

       From: header
       To: header
       Cc: header
       Subject: header
       Date: header
       Message-ID: header

       The above headers can be modified if the relevant "rewrite_header" option is given (see "Mail::SpamAssassin::Conf" for more information).

       By default these message headers are added to spam:

       X-Spam-Flag: header
           Set to "YES".

       The headers that added are fully configurable via the "add_header" option (see "Mail::SpamAssassin::Conf" for more information).

       spam mail body text
           The SpamAssassin report is added to top of the mail message body, if the message is marked as spam.

   DEFAULT TAGGING FOR ALL MAILS
       These headers are added to all messages, both spam and ham (non-spam).

       X-Spam-Checker-Version: header
           The version and subversion of SpamAssassin and the host where SpamAssassin was run.

       X-Spam-Level: header
           A series of "*" charactes where each one represents a full score point.

       X-Spam-Status: header
           A string, "(Yes|No), score=nn required=nn tests=xxx,xxx autolearn=(ham|spam|no|unavailable|failed)" is set in this header to reflect the filter status.  For the first word, "Yes" means spam and
           "No" means ham (non-spam).

       The headers that added are fully configurable via the "add_header" option (see "Mail::SpamAssassin::Conf" for more information).

INSTALLATION
       The spamassassin command is part of the Mail::SpamAssassin Perl module.  Install this as a normal Perl module, using "perl -MCPAN -e shell", or by hand.

       Note that it is not possible to use the "PERL5LIB" environment variable to affect where SpamAssassin finds its perl modules, due to limitations imposed by perl's "taint" security checks.

       For further details on how to install, please read the "INSTALL" file from the SpamAssassin distribution.

DEVELOPER DOCUMENTATION
           Mail::SpamAssassin
               Spam detector and markup engine

           Mail::SpamAssassin::ArchiveIterator
               find and process messages one at a time

           Mail::SpamAssassin::AutoWhitelist
               auto-whitelist handler for SpamAssassin

           Mail::SpamAssassin::Bayes
               determine spammishness using a Bayesian classifier

           Mail::SpamAssassin::BayesStore
               Bayesian Storage Module

           Mail::SpamAssassin::BayesStore::SQL
               SQL Bayesian Storage Module Implementation

           Mail::SpamAssassin::Conf::LDAP
               load SpamAssassin scores from LDAP database

           Mail::SpamAssassin::Conf::Parser
               parse SpamAssassin configuration

           Mail::SpamAssassin::Conf::SQL
               load SpamAssassin scores from SQL database

           Mail::SpamAssassin::Message
               decode, render, and hold an RFC-2822 message

           Mail::SpamAssassin::Message::Metadata
               extract metadata from a message

           Mail::SpamAssassin::Message::Node
               decode, render, and make available MIME message parts

           Mail::SpamAssassin::PerMsgLearner
               per-message status (spam or not-spam)

           Mail::SpamAssassin::PerMsgStatus
               per-message status (spam or not-spam)

           Mail::SpamAssassin::PersistentAddrList
               persistent address list base class

           Mail::SpamAssassin::Plugin
               SpamAssassin plugin base class

           Mail::SpamAssassin::Plugin::Hashcash
               perform hashcash verification tests

           Mail::SpamAssassin::Plugin::RelayCountry
               add message metadata indicating the country code of each relay

           Mail::SpamAssassin::Plugin::SPF
               perform SPF verification tests

           Mail::SpamAssassin::Plugin::URIDNSBL
               look up URLs against DNS blocklists

           Mail::SpamAssassin::SQLBasedAddrList
               SpamAssassin SQL Based Auto Whitelist

BUGS
       See <http://issues.apache.org/SpamAssassin/>

AUTHORS
       The SpamAssassin(tm) Project <http://spamassassin.apache.org/>

COPYRIGHT
       SpamAssassin is distributed under the Apache License, Version 2.0, as described in the file "LICENSE" included with the distribution.



perl v5.16.3                                                                                      2018-10-15                                                                                  SPAMASSASSIN(1)
