PATATOR(1)                                                         User Commands                                                        PATATOR(1)

NAME
       Patator - multi-purpose brute-forcer

SYNOPSIS
       patator.py module --help

DESCRIPTION
        Patator is a multi-purpose brute-forcer, with a modular design and a flexible usage.

   Available modules:
       + ftp_login
              Brute-force FTP

       + ssh_login
              Brute-force SSH

       + telnet_login
              Brute-force Telnet

       + smtp_login
              Brute-force SMTP

       + smtp_vrfy
              Enumerate valid users using SMTP VRFY

       + smtp_rcpt
              Enumerate valid users using SMTP RCPT TO

       + finger_lookup
              Enumerate valid users using Finger

       + http_fuzz
              Brute-force HTTP

       + pop_login
              Brute-force POP3

       + pop_passd
              Brute-force poppassd (http://netwinsite.com/poppassd/)

       + imap_login
              Brute-force IMAP4

       + ldap_login
              Brute-force LDAP

       + smb_login
              Brute-force SMB

       + smb_lookupsid
              Brute-force SMB SID-lookup

       + rlogin_login
              Brute-force rlogin

       + vmauthd_login
              Brute-force VMware Authentication Daemon

       + mssql_login
              Brute-force MSSQL

       + oracle_login
              Brute-force Oracle

       + mysql_login
              Brute-force MySQL

       + mysql_query
              Brute-force MySQL queries

       + pgsql_login
              Brute-force PostgreSQL

       + vnc_login
              Brute-force VNC

       + dns_forward
              Forward lookup names

       + dns_reverse
              Reverse lookup subnets

       + snmp_login
              Brute-force SNMP v1/2/3

       + unzip_pass
              Brute-force the password of encrypted ZIP files

       + keystore_pass
              Brute-force the password of Java keystore files

       + umbraco_crack
              Crack Umbraco HMAC-SHA1 password hashes

       + tcp_fuzz
              Fuzz TCP services

       + dummy_test
              Testing module

Patator                                                              July 2016                                                          PATATOR(1)
