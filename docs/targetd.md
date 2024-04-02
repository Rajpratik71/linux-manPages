targetd(8)                                                                                 System Manager's Manual                                                                                 targetd(8)



NAME
       targetd

DESCRIPTION
       targetd is a service to allow the remote configuration of block device volumes and file systems within dedicated pools. Block devices can be exported to other hosts via iSCSI, and filesystems can be
       exported via NFS.

USAGE
       Run targetd as root.

CONFIGURATION
       targetd uses /etc/target/targetd.yaml for configuration. It is in YAML format.  targetd currently uses scalar values and collection values, see example for details.

   CONFIGURATION FILE SETTINGS
       block_pools
       Sets the LVM Volume Group(s) that targetd will use to allocate volumes. Defaults to "vg-targetd".

       Alternatively, targetd can allocate thinp (thin-provisioned) volumes out of a thinpool LV. These should be listed as "<vgname>/<poolname>", with the VG and thinpool LV  names  separated  by  a  "/".
       These should already be created; targetd will not create VGs or thinpool LVs.

       fs_pools
       Sets the mount point(s) that targetd will use to export filesystems over NFS. Defaults to none.

       user
       password
       Sets the username and password required to use the remote API. "user" defaults to admin, but password must be set prior to using targetd.

       target_name
       Sets the iSCSI target name that targetd will use. Default is iqn.2003-01.org.linux-iscsi.<hostname>:targetd.

       ssl
       ssl_key
       ssl_cert
       Settings for enabling SSL/TLS encryption.  ssl defaults to off.  If enabled, it will default to looking for key and cert files named targetd_key.pem and targetd_cert.pem in /etc/target.  These paths
       may also be specified, using the ssl_key and ssl_cert config settings.

       Key and self-signed cert may be generated using openssl:

       openssl genrsa -out targetd_key.pem 2048
       openssl req -new -x509 -key targetd_key.pem -out targetd_cert.pem -days 9999

FILES
       /etc/target/targetd.yaml
       /etc/target/targetd_key.pem
       /etc/target/targetd_cert.pem

SEE ALSO
       The remote API is defined at
       <https://github.com/agrover/targetd/blob/master/API.md>.

       targetcli(8), lvm(8), lsmcli(8)

AUTHOR
       Written by Andy Grover <agrover@redhat.com>.

REPORTING BUGS
       Report bugs via <targetd-devel@lists.fedorahosted.org>
       or <https://github.com/agrover/targetd/issues>



                                                                                                                                                                                                   targetd(8)
