winpr-makecert(1)                                                                                  FreeRDP                                                                                  winpr-makecert(1)



NAME
       winpr-makecert - A tool to create X.509 certificates.

SYNOPSIS
       winpr-makecert  [-rdp]  [-silent]  [-live]  [-format { crt | pem | pfx }] [-p password] [-n common_name] [-y years] [-m months] [-len length] [-# serial] [-a { md5 | sha1 | sha256 | s384 | sha512 }]
       [-path outputpath] [outputname]

DESCRIPTION
       winpr-makecert is a tool for generating X.509 certificates modeled after the Windows command MakeCert. winpr-makecert aims to be command line compatible with MakeCert however  not  all  options  are
       supported or implemented yet.

       Unimplemented features are not described here. They are marked as "Unsupported" in winpr-makecerts help.

       In  contrast to it's Windows counterpart winpr-makecert does, unless the -live option is given, always creates and save a certificate.  If outputname isn't set it is tried to determine the host name
       of the computer the command is run on.
       Warning: if the file already exists it will be overwritten without asking.

       Without further options the generated certificates have the following properties:

       * 2048 bit long
       * sha256 as hash algorithm
       * the detected host name is used as common name
       * a time stamp is used as serial number
       * validity period of one year
       * saved in the current working directory in crt format

OPTIONS
       -rdp   Dummy parameter. Can be used to quickly generate a certificate with default properties without specifying any further parameters.

       -silent
              Don't print the generated certificate to stdout.

       -f format
              Three formats are supported: crt, pem and pfx.
              crt outputs the key and the certificate in a separate file each with the file endings .key and .crt.
              pem outputs the key and certificate into a single file with the file ending pem.
              And pfx outputs key and certificate into a  pkcs12 file with the ending .pfx.

       -p password
              Password to use if the pfx format is used as format.

       -live  Don't write the key/certificate to disk. When used from the command line this can be thought as "dummy" mode.

       -n common_name
              The common name to use in the certificate.

       -m months
              Validity period in months.

       -y years
              Validity period in years. If months and years are specified the specified month parameter will take precedence.

       -len length
              Key length in bits to use.

       -a { md5 | sha1 | sha256 | s384 | sha512 }
              The hashing algorithm to use.

       -# serial
              The serial number to use for the certificate.

       -path  A directory where the certificate should be created in.

       outputname
              The base name of the created file(s). A suffix, the format specific suffix is appended to this name.

EXAMPLES
       winpr-makecert -rdp

       Creates a certificate with the default properties, saved to a file in the current working directory in crt format named like the host. If the host is named  freerdp  the  created  files  are  called
       freerdp.key and freerdp.crt.


       winpr-makecert -len 4096 -a sha384 -path /tmp -# 22 -m 144 -y 1 -format crt mycert

       The  command  above  creates the file /tmp/mycert.pem containing a key and a certificate with a length of 4096. It will use sha384 as hash algorithm.  The certificate has the serial number 22 and is
       valid for 12 years (144 months).

EXIT STATUS
       0      Successful program execution.

       1      Otherweise.


SEE ALSO
       MakeCert help page ⟨https://msdn.microsoft.com/library/windows/desktop/aa386968.aspx⟩


AUTHOR
       FreeRDP <team@freerdp.com>



2.0.0-rc4                                                                                         2017-01-11                                                                                winpr-makecert(1)
