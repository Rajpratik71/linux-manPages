seeded-in-ubuntu(1)                                           General Commands Manual                                          seeded-in-ubuntu(1)

NAME
       seeded-in-ubuntu - Determine whether a package is safe to upload during a freeze

SYNOPSIS
       seeded-in-ubuntu [options] package...

DESCRIPTION
       Lists all the current daily images containing the specified packages.  Or whether the package is part of the supported seed.

       If it isn't on an image, it should be safe to upload.  During the final freeze, one should avoid packages in the supported seed too.

       An index of the current manifests is downloaded from UbuntuWire.

OPTIONS
       -b, --binary
              The  packages  specified  are  binary packages.  This is faster than source packages, as otherwise we must query LP to determine the
              binary packages that every specified source package builds.

       -u URL, --data-url=URL
              URL for index of seeded packages.  Default: UbuntuWire's service at http://qa.ubuntuwire.org/ubuntu-seeded-packages/seeded.json.gz.

       -h, --help
              Display a help message and exit

EXAMPLES
       All the images that contain unity:

              seeded-in-ubuntu -b unity

AUTHORS
       seeded-in-ubuntu and this manpage were written by Stefano Rivera <stefanor@ubuntu.com>.

       Both are released under the terms of the ISC License.

ubuntu-dev-tools                                                   December 2011                                               seeded-in-ubuntu(1)
