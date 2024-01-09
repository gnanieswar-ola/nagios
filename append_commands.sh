#!/bin/bash

# Check if the ceph.cfg file exists
if [ -f /opt/nagios/etc/ceph.cfg ]; then
    # Append the contents of ceph.cfg to commands.cfg
    cat /opt/nagios/etc/ceph.cfg >> /opt/nagios/etc/objects/commands.cfg
fi

# Start Nagios
exec /opt/nagios/bin/nagios /opt/nagios/etc/nagios.cfg

