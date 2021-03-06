# Copyright (C) 2015 SUSE Linux GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, see <http://www.gnu.org/licenses/>.

# Summary: Clone the existing installation for use in validation
# Maintainer: Oliver Kurz <okurz@suse.de>

use strict;
use base 'console_yasttest';
use testapi;

sub run {
    my $self = shift;
    assert_script_run 'rm -f /root/autoinst.xml';
    assert_script_run 'yast2 --ncurses clone_system', 400;
    upload_logs '/root/autoinst.xml';

    # original autoyast on kernel cmdline
    upload_logs '/var/adm/autoinstall/cache/installedSystem.xml';
    assert_script_run 'save_y2logs /tmp/y2logs_clone.tar.bz2';
    upload_logs '/tmp/y2logs_clone.tar.bz2';
    save_screenshot;
}

1;

# vim: set sw=4 et:
