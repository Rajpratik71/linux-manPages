APKTOOL(1)                                  User Commands                                  APKTOOL(1)

NAME
       apktool - tool for reverse engineering Android apk files

DESCRIPTION
       usage: apktool

       -advance,--advanced
              prints advance information.

       -version,--version
              prints the version then exits

       usage: apktool if|install-framework [options] <framework.apk>

       -p,--frame-path <dir>
              Stores framework files into <dir>.

       -t,--tag <tag>
              Tag frameworks using <tag>.

       usage: apktool d[ecode] [options] <file_apk>

       -f,--force
              Force delete destination directory.

       -o,--output <dir>
              The name of folder that gets written. Default is apk.out

       -p,--frame-path <dir>
              Uses framework files located in <dir>.

       -r,--no-res
              Do not decode resources.

       -s,--no-src
              Do not decode sources.

       -t,--frame-tag <tag>
              Uses framework files tagged by <tag>.

       usage: apktool b[uild] [options] <app_path>

       -f,--force-all
              Skip changes detection and build all files.

       -o,--output <dir>
              The name of apk that gets written. Default is dist/name.apk

       -p,--frame-path <dir>
              Uses framework files located in <dir>.

       For  additional info, see: http://ibotpeaches.github.io/Apktool/ For smali/baksmali info, see:
       http://code.google.com/p/smali/

apktool                                     February 2016                                  APKTOOL(1)
