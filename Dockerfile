FROM busybox:latest
MAINTAINER Matt Kemp <matt@mattikus.com>

# Download statically compiled murmur and install it to /opt
RUN wget http://sourceforge.net/projects/mumble/files/Mumble/1.2.8/murmur-static_x86-1.2.8.tar.bz2/download -O - | bzcat -f | tar -x -C /opt -f -

# Read murmur.ini and murmur.sqlite from /data/
VOLUME ["/data"]

# Forward apporpriate ports
EXPOSE 64738/tcp 64738/udp

# Run murmur
CMD ["/opt/murmur-static_x86-1.2.8/murmur.x86", "-ini", "/data/murmur.ini", "-fg", "-v"]
