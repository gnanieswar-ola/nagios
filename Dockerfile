# Use the Nagios base image
FROM jasonrivers/nagios:latest

# Install Git, Vim, and required tools
RUN apt-get update && \
    apt-get install -y git vim && \
    apt-get install -y ceph-common && \
    apt-get install -y python3 && \
    ln -s /usr/bin/python3 /usr/bin/python

# Clone the repository with additional Nagios plugins
RUN git clone https://github.com/ceph/ceph-nagios-plugins.git /tmp/ceph-nagios-plugins

# Change directory to ceph-nagios-plugins
WORKDIR /tmp/ceph-nagios-plugins

# Install 'make' command
RUN apt-get install -y make

# Execute 'make install'
RUN make install

# Copy the plugins from the cloned repository to the Nagios libexec directory
RUN cp src/* /opt/nagios/libexec/

