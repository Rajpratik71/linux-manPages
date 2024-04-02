ABRT-ACTION-INSTAL(1)                                                                            ABRT Manual                                                                            ABRT-ACTION-INSTAL(1)



NAME
       abrt-action-install-debuginfo - Install debuginfos for build-ids

SYNOPSIS
       abrt-action-install-debuginfo [-vy] [--ids=BUILD_IDS_FILE] [--tmpdir=TMPDIR] [--cache=CACHEDIR[:DEBUGINFODIR1:DEBUGINFODIR2...]] [--size_mb=SIZE] [-e PATH]

DESCRIPTION
       Installs debuginfos for all build-ids listed in BUILD_IDS_FILE to CACHEDIR, using TMPDIR as temporary staging area. Old files in CACHEDIR are deleted until it is smaller than SIZE.

OPTIONS
       -v
           Be more verbose. Can be given multiple times.

       -y
           Noninteractive, assume Yes to all questions

       --ids
           Path to file with list of build ids. Default: build_ids

       --tmpdir
           Path to tmp directory. Default: /tmp/abrt-tmp-debuginfo-RANDOM_SUFFIX

       --cache
           Path to cache directory. Default: /var/cache/abrt-di

       --size_mb
           Default: 4096

       -e,--exact
           Download only specified files

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-ACTION-INSTAL(1)
