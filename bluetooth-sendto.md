BLUETOOTH-SENDTO(1)                                             Linux User's Manual                                            BLUETOOTH-SENDTO(1)

NAME
       bluetooth-sendto - GTK application for transferring files over Bluetooth

SYNOPSIS
       bluetooth-sendto [--device=XX:XX:XX:XX:XX:XX [--name=NAME]] [file...]

DESCRIPTION
       bluetooth-sendto  will  display  a  dialog  for  transferring  files over Bluetooth.  bluetooth-sendto is part of gnome-bluetooth, see also
       http://live.gnome.org/GnomeBluetooth

OPTIONS
       --device
              Define the device address to send the file(s) to.  If omitted a chooser will be displayed.

       --name Define the device name to send the file(s) to.  If omitted it will be auto detected.

       file   The file(s) to send to the device.  If omitted a chooser will be displayed.

AUTHOR
       Marcel Holtmann <marcel@holtmann.org>

LICENSE
       bluetooth-sendto is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as  published
       by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABIL‐
       ITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free  Software  Foundation,
       Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

gnome-bluetooth                                                     May 6, 2012                                                BLUETOOTH-SENDTO(1)
