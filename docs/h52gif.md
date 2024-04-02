h52gif(1)                                                                                  General Commands Manual                                                                                  h52gif(1)



NAME
       h52gif - Converts an HDF5 file to a GIF file.

SYNOPSIS
       h52gif h5_file gif_file -i h5_image [ -p h5_palette ]

DESCRIPTION
       h52gif accepts as input the HDF5 file h5_file and the names of images and associated palettes within that file as input and produces the GIF file gif_file, containing those images, as output.

       h52gif expects at least one h5_image. You may repeat
              -i h5_image [-p h5_palette]
       up to 50 times, for a maximum of 50 images.

OPTIONS
       -i h5_image
              Image option, specifying the name of an HDF5 image or dataset containing an image to be converted

       -p h5_palette
              Palette option, specifying the name of an HDF5 dataset containing a palette to be used in an image conversion

SEE ALSO
       h5dump(1), h5ls(1), h5diff(1), h5repart(1), h5import(1), gif2h5(1), h5perf(1)



                                                                                                                                                                                                    h52gif(1)
