#! /usr/bin/python3

#   (C)   2012  Canonical  Ltd.   #  Author:  Martin  Pitt  <mar‐
tin.pitt@ubuntu.com> # # This program is free software;  you  can
redistribute  it  and/or  modify  # it under the terms of the GNU
General Public License as published by # the Free Software  Foun‐
dation;  either  version  2 of the License, or # (at your option)
any later version.

import argparse import subprocess import  sys  import  os  import
logging import apt

import UbuntuDrivers.detect

def parse_args():
    ’’’Parse command line arguments.’’’

    # build help for commands
    commands = []
    command_help = ’Available commands:’
    for c in globals():
        if c.startswith(’command_’):
            name = c.split(’_’, 1)[1]
            commands.append(name)
            command_help   +=   ’    %s:   %s’   %  (name,  glob‐
als()[c].__doc__)

    parser  =   argparse.ArgumentParser(description=’List/install
driver packages for Ubuntu.’,
            epilog=command_help,  formatter_class=argparse.RawDe‐
scriptionHelpFormatter)
    parser.add_argument(’command’,  metavar=’<command>’,   choic‐
es=commands,
            help=’See below’)
    parser.add_argument(’‐‐package‐list’, metavar=’PATH’,
            help=’Create file with list of installed packages (in
autoinstall mode)’)

    return parser.parse_args()

def command_list(args):
    ’’’Show all driver packages which apply to the  current  sys‐
tem.’’’

    packages = UbuntuDrivers.detect.system_driver_packages()
    print(’0.join(packages))

    return 0

def command_devices(args):
    ’’’Show  all  devices  which need drivers, and which packages
apply to them.’’’

    drivers = UbuntuDrivers.detect.system_device_drivers()
    for device, info in drivers.items():
        print(’== %s ==’ % device)
        for k, v in info.items():
            if k == ’drivers’:
                continue
            print(’%‐9s: %s’ % (k, v))

        for pkg, pkginfo in info[’drivers’].items():
            info_str = ’’
            if pkginfo[’from_distro’]:
                info_str += ’ distro’
            else:
                info_str += ’ third‐party’
            if pkginfo[’free’]:
                info_str += ’ free’
            else:
                info_str += ’ non‐free’
            if pkginfo.get(’builtin’):
                info_str += ’ builtin’
            if pkginfo.get(’recommended’):
                info_str += ’ recommended’
            print(’%‐9s: %s ‐%s’ % (’driver’, pkg, info_str))
        print(’’)

def command_autoinstall(args):
    ’’’Install drivers that are appropriate for automatic instal‐
lation.’’’

    cache = apt.Cache()

    packages = UbuntuDrivers.detect.system_driver_packages(cache)
    packages = UbuntuDrivers.detect.auto_install_filter(packages)
    if not packages:
        print(’No drivers found for automatic installation.’)
        return

    # ignore packages which are already installed
    to_install = []
    for p in packages:
        if not cache[p].installed:
            to_install.append(p)

    if not packages:
        print(’All drivers for automatic installation are already
installed.’)
        return

    ret = subprocess.call([’apt‐get’, ’install’, ’‐o’,
        ’DPkg::options::=‐‐force‐confnew’, ’‐y’] + to_install)

    # create package list
    if ret == 0 and args.package_list:
        with open(args.package_list, ’a’) as f:
            f.write(’0.join(to_install))
            f.write(’0)

    return ret

def command_debug(args):
    ’’’Print all available information and debug data about driv‐
ers.’’’

    logging.basicConfig(level=logging.DEBUG, stream=sys.stdout)

    print(’=== log messages from detection ===’)
    aliases = UbuntuDrivers.detect.system_modaliases()
    cache = apt.Cache()
    packages = UbuntuDrivers.detect.system_driver_packages(cache)
    auto_packages     =    UbuntuDrivers.detect.auto_install_fil‐
ter(packages)

    print(’=== modaliases in the system ===’)
    for alias in aliases:
        print(alias)

    print(’=== matching driver packages ===’)
    for package, info in packages.items():
        p = cache[package]
        try:
            inst = p.installed.version
        except AttributeError:
            inst = ’<none>’
        try:
            cand = p.candidate.version
        except AttributeError:
            cand = ’<none>’
        if package in auto_packages:
            auto = ’ (auto‐install)’
        else:
            auto = ’’

        info_str = ’’
        if info[’from_distro’]:
            info_str += ’  [distro]’
        else:
            info_str += ’  [third party]’
        if info[’free’]:
            info_str += ’  free’
        else:
            info_str += ’  non‐free’
        if ’modalias’ in info:
            info_str += ’  modalias: ’ + info[’modalias’]
        if ’syspath’ in info:
            info_str += ’  path: ’ + info[’syspath’]
        if ’vendor’ in info:
            info_str += ’  vendor: ’ + info[’vendor’]
        if ’model’ in info:
            info_str += ’  model: ’ + info[’model’]

        print(’%s: installed: %s   available: %s%s%s ’  %  (pack‐
age, inst, cand, auto,  info_str))

# # main #

args = parse_args()

# run the function corresponding to the specified command command
= globals()[’command_’ + args.command] sys.exit(command(args))

