# docker-dind-rootless
Rootless docker in docker with lxc-user-nic as network stack.

## Usage
```
$ docker run -d --privileged --net=host \
        -v dind:/home/rootless/sock \
        engma324/docker-dind-rootless
```
By default, dockerd will not listen on any TCP socket. and the UNIX socket is created as /home/rootless/sock/docker.sock.
