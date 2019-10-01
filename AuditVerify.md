AuditVerify(1)                                                                    PKI Signed Audit Log Verification Command                                                                    AuditVerify(1)



NAME
       AuditVerify - Command-Line utility for verifying Certificate System signed audit logs.


SYNOPSIS
       AuditVerify -d <dbdir> -n <signing_certificate_nickname> -a <logListFile> [-P cert/key_db_prefix] [-v]


DESCRIPTION
       The  AuditVerify  command  provides  command-line utility to verify that signed audit logs were signed with the appropriate CS audit private signing key and that the audit logs have not been compro‐
       mised.  Auditors can verify the authenticity and integrity of signed audit logs using the AuditVerify tool. This tool uses the public key of the signed audit log signing certificate  to  verify  the
       digital  signatures  embedded in a signed audit log file. The tool result indicates either that the signed audit log was successfully verified or that the signed audit log was not successfully veri‐
       fied. An unsuccessful verification warns the auditor that the signature failed to verify, indicating the log file may have been tampered with (compromised).

       Note: An auditor can be any user that has the privilege to peruse the pki audit logs.


OPTIONS
       -d <dbdir>
              Specifies the directory containing the security databases with the imported audit log signing certificate. This directory is almost always the auditor's own personal certificate databases  in
              a personal directory, such as ~jsmith/auditVerifyDir/.


       -n <signing_certificate_nickname>
              Gives the nickname of the certificate used to sign the log files. The nickname is whatever was used when the log signing certificate was imported into that database.


       [-P cert/key_db_prefix]
              Optional. The prefix to prepend to the certificate and key database filenames. If used, a value of empty quotation marks (“”) should be specified for this argument, since the auditor is using
              separate certificate and key databases from the Certificate System instance and it is unlikely that the prefix should be prepended to the new audit security database files.


       -a <logListFile>
              Specifies the file which contains the comma-separate list of file paths (in chronological order) of the signed audit logs to be verified.  This file should be created in a directory which  is
              writeable by the auditor, such as a special auditing directory like ~jsmith/auditDir.  The contents of the logListFile are the full paths to the audit logs. For example:

               /var/log/pki/pki-ca/ca/signedAudit/ca_audit,/var/log/pki/pki-ca/ca/signedAudit/ca_audit.20030227102711,/var/log/pki/pki-ca/ca/signedAudit/ca_audit.20030226094015


       [-v]   Optional. Specifies verbose output.


Setting up the Auditor's Database
       AuditVerify needs access to a set of security databases (usually the auditor's personal security databases) containing the signed audit log signing certificate and its chain of issuing certificates.
       One of the CA certificates in the issuance chain must be marked as trusted in the database.

       Auditors should import the audit signing certificate into their personal certificate database before running AuditVerify. The auditor should not use the security databases of the Certificate  System
       instance  that  generated  the  signed audit log files. If there are no readily accessible certificate and key database, the auditor must create a set of certificate and key databases and import the
       signed audit log signing certificate chain.

       To create the security databases and import the certificate chain:


   Create a special directory in the auditor's home directory to use to perform the verification. For example:
       mkdir ~jsmith/auditVerifyDir


   Use the certutil tool to create an empty set of certificate databases in the auditor's home directory.
       certutil -d ~jsmith/auditVerifyDir -N


   Download the CA certificate from the CA's Retrieval page. The certificates can be obtained from the CA in ASCII format.
       https://server.example.com:ca_https_port/ca/ee/ca/


   Import the CA certificate and log signing certificate into the databases and set trust of the certificates
       If the CA certificate is in a file called cacert.txt and the log signing certificate is in a file called logsigncert.txt, then the certutil can be used to set the trust for the  new  audit  security
       database directory pointing to those files, as follows:

       certutil -d ~jsmith/auditVerifyDir/ -A -n "CA Certificate" -t "CT,CT,CT" -a -i cacert.txt

       certutil -d ~jsmith/auditVerifyDir -A -n "Log Signing Certificate" -t ",,P" -a -i logsigncert.txt

       Note: The signedAudit directory kept by the subsystem is not writeable by any user, including auditors.


Operation
       After a separate audit database directory has been configured, do the following:

   Create a text file containing a comma-separated list of the log files to be verified. The name of this file is referenced in the AuditVerify command.
       For  example,  this file could be logListFile in the ~jsmith/auditVerifyDir/ directory. The contents are the comma-separated list of audit logs to be verified, such as "auditlog.1213, auditlog.1214,
       auditlog.1215."


   If the audit databases do not contain prefixes and are located in the user home directory, such as ~jsmith/.mozilla, and the signing certificate nickname is Log Signing  Certificate  ,  the  AuditVerify
       command is run as follows:
       AuditVerify -d ~jsmith/auditVerifyDir -n Log Signing Certificate -a ~jsmith/auditVerifyDir/logListFile -P "" -v

       Note: It has been observed that if audit signing is enabled after system is first started, the first audit signature would not be verified. What happens is that the signature starts calculating from
       it's in-memory audit log message when it signs, and since log signing is turned on mid-way (not from a fresh new log file), the previous content were not signed along for calculating the first  sig‐
       nature  (and  rightfully so). When AuditVerify is run, it does not know where the log signing begins, so it assumes it starts from the beginning of the file till the first signature. This is why the
       first signature (if signing is turned on mid-way) will always appear to be incorrect.



AUTHORS
       Christina Fu <cfu@redhat.com>.


COPYRIGHT
       Copyright (c) 2016 Red Hat, Inc. This  is  licensed  under  the  GNU  General  Public  License,  version  2  (GPLv2).  A  copy  of  this  license  is  available  at  http://www.gnu.org/licenses/old-
       licenses/gpl-2.0.txt.


SEE ALSO
       pki(1)



version 10.3                                                                                     July 7, 2016                                                                                  AuditVerify(1)
