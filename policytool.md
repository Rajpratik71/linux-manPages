policytool(1)                               Security Tools                               policytool(1)

NAME
       policytool - Reads and writes a plain text policy file based on user input through the utility
       GUI.

SYNOPSIS
       policytool [ -file ] [ filename ]

       -file
              Directs the policytool command to load a policy file.

       filename
              The name of the file to be loaded.

       Examples:

       Run the policy tool administrator utility:

       policytool

       Run the policytool command and load the specified file:

       policytool -file mypolicyfile

DESCRIPTION
       The policytool command calls an administrator's GUI that enables system administrators to
       manage the contents of local policy files. A policy file is a plain-text file with a .policy
       extension, that maps remote requestors by domain, to permission objects. For details, see
       Default Policy Implementation and Policy File Syntax at
       http://docs.oracle.com/javase/8/docs/technotes/guides/security/PolicyFiles.html

OPTIONS
       -file
              Directs the policytool command to load a policy file.

SEE ALSO
       • Default Policy Implementation and Policy File Syntax at
         http://docs.oracle.com/javase/8/docs/technotes/guides/security/PolicyFiles.html

       • Policy File Creation and Management at
         http://docs.oracle.com/javase/8/docs/technotes/guides/security/PolicyGuide.html

       • Permissions in Java SE Development Kit (JDK) at
         http://docs.oracle.com/javase/8/docs/technotes/guides/security/permissions.html

       • Java Security Overview at
         http://docs.oracle.com/javase/8/docs/technotes/guides/security/overview/jsoverview.html

       • Java Cryptography Architecture (JCA) Reference Guide at
         http://docs.oracle.com/javase/8/docs/technotes/guides/security/crypto/CryptoSpec.html

JDK 8                                        03 March 2015                               policytool(1)
