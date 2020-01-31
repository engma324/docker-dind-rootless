# docker-dind-rootless
Rootless docker in docker with lxc-user-nic as the network stack.

## Usage
dockerd with no TCP ports and unix socket shared on a volume:
```
$ docker run -d --name docker-rootless --privileged \
        -v dind-socket:/home/rootless/sock \
        engma324/docker-dind-rootless \
        dockerd --experimental --host=unix:///home/rootless/sock/docker.sock
```

For TCP with TLS usage refer to the official docker repo.
