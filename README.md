# murmur

## Description

This is a barebones docker container built using busybox and a statically
compiled version of murmurd from the official website.

It's configured to look for the configuration file in `/data/murmur.ini`.

## Barebones murmur.ini

The basic `murmur.ini` sufficient to start up the server using the defaults and
save your state to the volume. Make sure the volume you attach contains a
config with at least this as the minimum. 

```ini
# Murmur configuration file.
#

# Path to database. If blank, will search for
# murmur.sqlite in default locations or create it if not found.
database=/data/murmur.sqlite
```

## Usage

The recommended way to run this container is as follows:

```bash
$ docker run -d --name murmur-server -v $HOME/docker/volume_data/murmur:/data \
    -p 64738:64738/tcp -p 64738:64738/udp mattikus/murmur
```

On first run, if you don't already have an existing state database, you'll want
to look at the logs for your container to get the super-user password:

```bash
$ docker logs murmur-server 2>&1 | grep Password
<W>2014-07-27 01:41:31.256 1 => Password for 'SuperUser' set to '(mAq3hkwnkD'
```
