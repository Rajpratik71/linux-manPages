nss_pcache(8)                                                                                                                                                                                   nss_pcache(8)



NAME
       nss_pcache - Helper program used to store token password pins


SYNOPSIS
       nss_pcache <semid> <fips on/off>


DESCRIPTION
       A helper program used by the Apache httpd mod_nss plug-in to store the NSS PKCS #11 token password pins between restarts of Apache.

       Whenever  an  Apache  httpd  process  configured  to  use  the  mod_nss  plug-in  is  started, this program will be automatically invoked via reference to the mod_nss configuration file stored under
       /etc/httpd/conf.d/nss.conf which contains the following default entry:

              #   Pass Phrase Helper:
              #   This helper program stores the token password pins between
              #   restarts of Apache.
              #
              #   NOTE:  Located at '/usr/sbin/nss_pcache' prior
              #          to 'mod_nss-1.0.8-22'.
              #
              NSSPassPhraseHelper /usr/libexec/nss_pcache


OPTIONS
       <semid>
              The semaphore which corresponds to the mod_nss plug-in registered with the Apache httpd process during startup.

       <fips on/off>
              Specifies whether FIPS mode should be enabled, on, or disabled, off.  By default, FIPS mode is disabled, and no variable is specified in  /etc/httpd/conf.d/nss.conf.   To  enable  FIPS  mode,
              establish password access for the specified NSS security databases, and specify the following variable in  /etc/httpd/conf.d/nss.conf:

                  NSSFIPS on


BUGS
       Report bugs to http://bugzilla.redhat.com.


AUTHORS
       Rob Crittenden <rcritten@redhat.com>.


COPYRIGHT
       Copyright  (c)  2013  Red  Hat, Inc. This is licensed under the Apache License, Version 2.0 (the "License"); no one may use this file except in compliance with the License. A copy of this license is
       available at http://www.apache.org/licenses/LICENSE-2.0.

       Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express  or
       implied.  See the License for the specific language governing permissions and limitations under the License.



Rob Crittenden                                                                                   May 10 2017                                                                                    nss_pcache(8)
