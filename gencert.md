gencert(8)                                                                                                                                                                                         gencert(8)



NAME
       gencert - Generate a test NSS database for mod_nss


SYNOPSIS
       gencert <destdir>


DESCRIPTION
       A tool used to generate a self-signed CA as well as server and user certificates for mod_nss testing.

       This is used to generate a default NSS database for the mod_nss Apache module. It does not test to see if an existing database already exists, so use with care.

       gencert will generate a new NSS database with the password "httptest".

       It generates a self-signed CA with the subject "CN=Certificate Shack, O=example.com, C=US"

       It also generates a certificate suitable for servers with the subject "CN=<FQDN>, O=example.com, C=US", and a user certificate with the subject "E=alpha@<FQDN>, CN=Frank Alpha, UID=alpha, OU=People,
       O=example.com, C=US".

       The nicknames it uses are:

              CA:                   cacert
              Server certificate:   Server-Cert
              User cert:            alpha


OPTIONS
       <destdir>
              Specifies the destination directory where the NSS databases will be created.


BUGS
       Report bugs to http://bugzilla.redhat.com.


AUTHORS
       Rob Crittenden <rcritten@redhat.com>.


COPYRIGHT
       Copyright (c) 2011 Red Hat, Inc. This is licensed under the Apache License, Version 2.0 (the "License"); no one may use this file except in compliance with the License. A copy  of  this  license  is
       available at http://www.apache.org/licenses/LICENSE-2.0.

       Unless  required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
       implied.  See the License for the specific language governing permissions and limitations under the License.



Rob Crittenden                                                                                    Jul 1 2013                                                                                       gencert(8)
