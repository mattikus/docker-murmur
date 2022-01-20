FROM busybox:latest AS builder
LABEL MAINTAINER="Matt Kemp <matt@mattikus.com>"

ENV version=1.4.230

# Download statically compiled murmur and install it to /opt/murmur
WORKDIR /opt
RUN wget "https://github.com/mumble-voip/mumble/releases/download/${version}/murmur-static_x86-${version}.tar.bz2" \
        -O murmurd.tar.bz2 && \
    bzcat murmurd.tar.bz2 | tar -x -f - && \
    rm murmurd.tar.bz2 && \
    mv murmur-static_x86-${version} /opt/murmur

FROM busybox:latest

# Grab murmurd from builder stage
COPY --from=builder /opt/murmur /opt/murmur

# Copy in our slightly tweaked INI which points to our volume
COPY murmur.ini /etc/murmur.ini

# Forward apporpriate ports
EXPOSE 64738/tcp 64738/udp

# Read murmur.ini and murmur.sqlite from /data/
VOLUME ["/data"]

# Run murmur
ENTRYPOINT ["/opt/murmur/murmur.x86", "-fg", "-v"]
CMD ["-ini", "/etc/murmur.ini"]
