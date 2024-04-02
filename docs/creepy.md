CREEPY(1)                                                     General Commands Manual                                                    CREEPY(1)

NAME
       CREEPY -  A geolocation information aggregator

DESCRIPTION
       creepy  is  an application that allows you to gather geolocation related information about users from social networking platforms and image
       hosting services. The information is presented in a map inside the application where all the retrieved data is shown accompanied with rele‐
       vant information (i.e. what was posted from that specific location) to provide context to the presentation.

FEATURES
       Map providers available :
              Google Maps - Virtual Maps - Open Street Maps

       Location information retieval from :

       Twitter's tweet location:
              Coordinates when tweet was posted from mobile device.

              Place  (geographical  name)  derived  from  users ip when posting on twitter's web interface. Place gets translated into coordinates
              using geonames.com"

              Bounding Box derived from users ip when posting on twitter's web interface.The less accurate source , a corner of the  bounding  box
              is selected randomly.

              Geolocation information accessible through image hosting services API

              EXIF tags from the photos posted.

       Social networking platforms currently supported:
              Twitter

              Foursquare (only checkins that are posted to twitter).

       Image hosting services currently supported :
              flickr - information retrieved from API

              twitpic.com - information retrieved from API and photo exif tags

              yfrog.com - information retrieved from photo exif tags

              img.ly - information retrieved from photo exif tags

              plixi.com - information retrieved from photo exif tags

              twitrpix.com - information retrieved from photo exif tags

              foleext.com - information retrieved from photo exif tags

              shozu.com - information retrieved from photo exif tags

              pickhur.com - information retrieved from photo exif tags

              moby.to - information retrieved from API and photo exif tags

              twitsnaps.com - information retrieved from photo exif tags

              twitgoo.com - information retrieved from photo exif tags

NOTES
       Automatic caching of retrieved information in order to reduce API calls and the possibility of hitting limit rates.

       GUI with navigable map for better overview of the accumulated information

       4 Maps providers (including Google Maps) to use.

       Open locations in Google Maps in your browser

       Export retrieved locations list as kmz (for Google Earth) or csv files.

       Handling twitter authentication in an easy way using oAuth. User credentials are not shared with the application.

       User/target search for twitter and flickr.

AUTHOR
       creepy was written by Yiannis Kakavas <jkakavas@gmail.com>

       This manual page was written by Daniel Echeverry for the Debian GNU/Linux system (but may be used by others).

SEE ALSO
       The full documentation which includes the keys descriptions is in /usr/share/doc/creepy/README.

                                                                   MAY 08, 2011                                                          CREEPY(1)
