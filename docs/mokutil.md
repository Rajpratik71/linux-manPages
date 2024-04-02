MOKUTIL(1)                                                    General Commands Manual                                                   MOKUTIL(1)

NAME
       mokutil - utility to manipulate machine owner keys

SYNOPSIS
       mokutil [--list-enrolled | -l]
               ([--mokx | -X])
       mokutil [--list-new | -N]
               ([--mokx | -X])
       mokutil [--list-delete | -D]
               ([--mokx | -X])
       mokutil [--import keylist| -i keylist]
               ([--hash-file hashfile | -f hashfile] | [--root-pw | -P] |
                [--simple-hash | -s] | [--mokx | -X])
       mokutil [--delete keylist | -d keylist]
               ([--hash-file hashfile | -f hashfile] | [--root-pw | -P] |
                [--simple-hash | -s] | [--mokx |- X])
       mokutil [--revoke-import]
               ([--mokx | -X])
       mokutil [--revoke-delete]
               ([--mokx | -X])
       mokutil [--export | -x]
       mokutil [--password | -p]
               ([--hash-file hashfile | -f hashfile] | [--root-pw | -P] |
                [--simple-hash | -s])
       mokutil [--clear-password | -c]
               ([--simple-hash | -s])
       mokutil [--disable-validation]
       mokutil [--enable-validation]
       mokutil [--sb-state]
       mokutil [--test-key keyfile | -t keyfile]
               ([--mokx | -X])
       mokutil [--reset]
               ([--hash-file hashfile | -f hashfile] | [--root-pw | -P] |
                [--simple-hash | -s] | [--mok | -X])
       mokutil [--generate-hash=password | -gpassword]
       mokutil [--ignore-db]
       mokutil [--use-db]
       mokutil [--import-hash hash]
               ([--hash-file hashfile | -f hashfile] | [--root-pw | -P] |
                [--simple-hash | -s] | [--mokx | -X])
       mokutil [--delete-hash hash]
               ([--hash-file hashfile | -f hashfile] | [--root-pw | -P] |
                [--simple-hash | -s] | [--mokx | -X])
       mokutil [--set-verbosity (true | false)]
       mokutil [--pk]
       mokutil [--kek]
       mokutil [--db]
       mokutil [--dbx]

DESCRIPTION
       mokutil is a tool to import or delete the machines owner keys (MOK) stored in the database of shim.

OPTIONS
       -l, --list-enrolled
              List the keys the already stored in the database

       -N, --list-new
              List the keys to be enrolled

       -D, --list-delete
              List the keys to be deleted

       -i, --import
              Collect the followed files and form a enrolling request to shim. The files must be in DER format.

       -d, --delete
              Collect the followed files and form a deleting request to shim. The files must be in DER format.

       --revoke-import
              Revoke the current import request (MokNew)

       --revoke-delete
              Revoke the current delete request (MokDel)

       -x, --export
              Export the keys stored in MokListRT

       -p, --password
              Setup the password for MokManager (MokPW)

       -c, --clear-password
              Clear the password for MokManager (MokPW)

       --disable-validation
              Disable the validation process in shim

       --enrolled-validation
              Enable the validation process in shim

       --sb-state
              Show SecureBoot State

       -t, --test-key
              Test if the key is enrolled or not

       --reset
              Reset MOK list

       --generate-hash
              Generate the password hash

       --hash-file
              Use the password hash from a specific file

       -P, --root-pw
              Use the root password hash from /etc/shadow

       -s, --simple-hash
              Use the old SHA256 password hash method to hash the password
              Note: --root-pw invalidates --simple-hash

       --ignore-db
              Tell shim to not use the keys in db to verify EFI images

       --use-db
              Tell shim to use the keys in db to verify EFI images (default)

       -X, --mokx
              Manipulate the MOK blacklist (MOKX) instead of the MOK list

       -i, --import-hash
              Create an enrolling request for the hash of a key in DER format. Note that this is not the password hash.

       -d, --delete-hash
              Create an deleting request for the hash of a key in DER format. Note that this is not the password hash.

       --set-verbosity
              Set the SHIM_VERBOSE to make shim more or less verbose

       --pk   List the keys in the public Platform Key (PK)

       --kek  List the keys in the Key Exchange Key Signature database (KEK)

       --db   List the keys in the secure boot signature store (db)

       --dbx  List the keys in the secure boot blacklist signature store (dbx)

