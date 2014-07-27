# murmur

## Description

This is a barebones docker container built using busybox and a statically
compiled version of murmurd from the official website.

It's configured to look for the configuration file in `/data/murmur.ini`.

An example configuration file (`murmur.ini.example`) has been provided which
will run the server with the defaults and allow for the server database to be
stored in the same volume.

## Usage

The recommended way to run this container is as follows:

```shell
$ docker run -d --name murmur-server -v $HOME/docker/volume_data/murmur:/data \
    -p 64738:64738/tcp -p 64738:64738/udp mattikus/murmur
```

On first run, if you don't already have an existing state database, you'll want
to look at the logs for your container to get the super-user password:

```shell
docker logs murmur-server 2>&1 | grep Password
<W>2014-07-27 01:41:31.256 1 => Password for 'SuperUser' set to '(mAq3hkwnkD'
```
