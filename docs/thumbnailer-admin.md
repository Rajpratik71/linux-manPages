thumbnailer-admin(1)                                            Linux User's Manual                                           thumbnailer-admin(1)

NAME
       thumbnailer-admin - Thumbnailer administrative tool

SYNOPSIS
       thumbnailer-admin command [options]

DESCRIPTION
       The thumbnailer-admin program provides a simple administrative tool to access the thumbnailer-service(1), for example, to retrieve a thumb‐
       nail, display statistics, or selectively clear one ore more of the service's internal caches.

   Internal caches
       The thumbnailer service maintains three internal caches:

       Image cache
              The image cache stores images that are expensive to retrieve (namely images downloaded from the image  server  (dash.ubuntu.com)  or
              extracted  from  video  files). Images in this cache are kept at high resolution, up to a limit of max-thumbnail-size (usually 1920)
              pixels in the larger dimension (see thumbnailer-settings(5)). The image cache is used to create thumbnails at smaller sizes that are
              then inserted into the thumbnail cache (to avoid repeated download or extraction of the original images).

       Thumbnail cache
              The thumbnail cache stores images that are scaled to a size that was previously requested by a client. If a client asks for a thumb‐
              nail that was previously generated at the same size, it is returned from this cache.

       Failure cache
              The failure cache contains the keys for media (local or remote) for which no thumbnail could be generated, either  because  a  local
              file  does  not  contain artwork, or because the image server has returned an authoritative answer that no image is available.  If a
              client asks for an image that is in the failure cache, the service does not try to create a thumbnail for some period  of  time,  to
              avoid expensive repeated attempts to retrieve artwork that does not exist.

       Commands that can selectively be applied to these caches use the following cache-id:

       i      Image cache

       t      Thumbnail cache

       f      Failure cache

   Sizes and scaling
       Thumbnails  are  never larger than max-thumbnail-size in the larger dimension (usually 1920, see thumbnailer-settings(5)), even if a larger
       size is requested.

       Commands that create thumbnails expect a size in pixels to be specified as follows:

       widthxheight
              Create a thumbnail scaled to fit a bounding box of width and height, for example, --size 640x480. If only a single dimension is pro‐
              vided, the thumbnail is scaled to fit into a square bounding box of the specified size, for example, -s 256.

              Specifying  a size with one dimension explicitly set to zero leaves that dimension unconstrained. For example, --size 0x480 produces
              a thumbnail no taller than 480 pixels of any width, (subject to the max-thumbnail-size limit).

              Specifying a size of zero (or not specifying any size) is equivalent to specifying max-thumbnail-size in both dimensions.

              Scaling always maintains the aspect ratio of the original image, and ensures that a thumbnail has a size of at least  one  pixel  in
              the smaller dimension.

              Requests for thumbnails that are larger than the original image are automatically reduced to the original image size, that is, orig‐
              inal artwork is never scaled up.

   Media formats and output files
       Most common image formats, such as PNG, JPEG, BMP, and so on, are recognized. For streaming media, the recognized  formats  depend  on  the
       installed gstreamer codecs.

       Thumbnails are always returned in PNG format, regardless of the encoding of the original image. The generated thumbnail file is tagged with
       the requested (not actual) image size. For example,

              thumbnailer-admin get --size=320x240 screen.jpg

       creates a file named screen_320x480.png.

COMMAND OVERVIEW
       thumbnailer-admin clear [cache-id]
              Clear all internal caches.

       thumbnailer-admin stats [cache-id]
              Display cache statistics.

       thumbnailer-admin zero-stats [cache-id]
              Zero statistics counters.

       thumbnailer-admin get file [dir]
              Get a thumbnail from a file.

       thumbnailer-admin get-artist artist album [dir]
              Get an artist thumbnail from the image server.

       thumbnailer-admin get-album artist album [dir]
              Get an album thumbnail from the image server.

       thumbnailer-admin compact
              Compact internal caches.

       thumbnailer-admin shutdown
              Shut down the thumbnailer service.

COMMAND REFERENCE
       thumbnailer-admin --help
       thumbnailer-admin -h
              Display a general help message for all commands.

       thumbnailer-admin clear [cache-id]
              Options:
                     --help
                     -h
                            Show help message.

              Clear all three internal caches. If cache-id is provided, clear only the selected cache.

       thumbnailer-admin stats [cache-id]
              Options:
                     --help
                     -h
                            Show help message.
                     --verbose
                     -v
                            Show histogram of entry sizes.

              Display detailed cache statistics. If cache-id is provided, limit the display to the selected cache.

       thumbnailer-admin zero-stats [cache-id]
              Options:
                     --help
                     -h
                            Show help message.

              Reset the statistics counters and timestamps to zero. If cache-id is provided, reset the statistics only for the selected cache.

       thumbnailer-admin get file [dir]
              Options:
                     --help
                     -h
                            Show help message.
                     --size pixels
                     --s pixels
                            Set the thumbnail size.

              Extract a thumbnail from the specified media file.

              If dir is specified, place the thumbnail into the specified directory (default: current directory).

              The output file name is basename_size.png. For example, for a file song.mp3, the output file name is  song_0x0.png  if  no  specific
              size was provided.

       thumbnailer-admin get-artist artist album [dir]
              Options:
                     --help
                     -h
                            Show help message.
                     --size pixels
                     --s pixels
                            Set the thumbnail size.

              Retrieve  artist artwork for the specified artist and album. The album can be an empty string but, because artist names alone can be
              ambiguous, specifying an album as well may yield a better result.

              If dir is specified, place the thumbnail into the specified directory (default: current directory).

              The output file name is  artist_album_artist_size.png.  For  example,  for  Jethro  Tull's  "Aqualung",  the  file  name  is  Jethro
              Tull_Aqualung_artist_0x0.png if no specific size was provided.

       thumbnailer-admin get-album artist album [dir]
              Options:
                     --help
                     -h
                            Show help message.
                     --size pixels
                     --s pixels
                            Set the thumbnail size.

              Retrieve  album  cover artwork for the specified artist and album. The artist can be an empty string but, because album titles alone
              can be ambiguous, specifying an artist as well may yield a better result.

              If dir is specified, place the thumbnail into the specified directory (default: current directory).

              The output file name  is  artist_album_album_size.png.  For  example,  for  Jethro  Tull's  "Aqualung",  the  file  name  is  Jethro
              Tull_Aqualung_album_0x0.png if no specific size was provided.

       thumbnailer-admin compact [cache-id]
              Options:
                     --help
                     -h
                            Show help message.

              Compact all three internal caches so the take up the smallest possible amount of disk space. If cache-id is provided, clear only the
              selected cache.

              After some time of use, the on-disk size of a cache can be 25–30% larger than its  nominal  size.  Compaction  reclaims  the  wasted
              space,  but  is  slow and, while in progress, other thumbnail requests are delayed until compaction completes.  (It can take tens of
              seconds to compact a cache with a nominal size of 100 MB, depending on the speed of the hardware.)

       thumbnailer-admin shutdown
              Options:
                     --help
                     -h
                            Show help message.

              Shut down the thumbnailer service. This is useful mainly after changing settings (which are read only once when the service starts).

SEE ALSO
       thumbnailer-service(1), thumbnailer-settings(5)

Ubuntu                                                            05 August 2015                                              thumbnailer-admin(1)
