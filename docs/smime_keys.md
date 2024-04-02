smime_keys(1)                                                                                    User Manuals                                                                                   smime_keys(1)



NAME
       smime_keys - Utility to add S/MIME certificate to the internal database used by mutt

SYNOPSIS
       smime_keys <operation>  [file(s) | keyID [file(s)]]

DESCRIPTION
       The  purpose  of  this  tool  is  to manipulate the internal database of S/MIME certificates used by mutt to sign mail messages which will be sent or to verify mail messages received and signed with
       S/MIME

OPTIONS
       init   no files needed, inits directory structure.

       list   lists the certificates stored in database.

       label  keyID required. changes/removes/adds label.

       remove keyID required.

       verify 1=keyID and optionally 2=CRL Verifies the certificate chain, and optionally whether this certificate is included in supplied CRL (PEM format).  Note: to verify all certificates  at  the  same
              time, replace keyID with "all"

       add_cert
              certificate required.

       add_chain
              three files reqd: 1=Key, 2=certificate plus 3=intermediate certificate(s).

       add_p12
              one file reqd. Adds keypair to database.  file is PKCS12 (e.g. export from netscape).

       add_pem
              one file reqd. Adds keypair to database.  (file was converted from e.g. PKCS12).

       add_root
              one file reqd. Adds PEM root certificate to the location specified within muttrc (smime_verify_* command)

NO WARRANTIES
       This  program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Gen-
       eral Public License for more details.

       Mutt Home Page: http://www.mutt.org/



Unix                                                                                               May 2009                                                                                     smime_keys(1)
