SBSIGLIST(1)                                 User Commands                                SBSIGLIST(1)

NAME
       sbsiglist - Create EFI_SIGNATURE_LIST signature databases

SYNOPSIS
       sbsiglist [options] --owner <guid> --type <type> <sig-file>

DESCRIPTION
       Create an EFI_SIGNATURE_LIST from a signature file Options:

       --owner <guid>
              Signature owner GUID

       --type <type>
              Signature type. One of: x509 sha256

       --output <file>
              write signed data to <file> (default <sig-file>.siglist)

sbsiglist 0.9.2                                May 2019                                   SBSIGLIST(1)
