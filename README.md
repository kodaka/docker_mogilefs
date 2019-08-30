# README

## How to suit up

Build base-image first.

```console
docker build -t kodaka/mogilefs-base -f docker/Dockerfile-kodaka-mogilefs-base .
```

and now you can:

```console
docker-compose up -d
```

## How to get

see `scripts/test_store_pair.pl`:

```console
perl scripts/test_store_pair.pl
```

FYI: You need to wait a few seconds or minutes for system warming up after composed.
Or you get like this:

```text
no_devices No devices found to store file at scripts/test_store_pair.pl line 16, <Sock_127.0.0.1:7001> line 1.
```
