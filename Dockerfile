FROM docker:19.03-dind-rootless

USER root

RUN apk add lxc \
  && echo "rootless veth br0 50" > /etc/lxc/lxc-usernet

ENV DOCKERD_ROOTLESS_ROOTLESSKIT_NET lxc-user-nic
ENV DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS --lxc-user-nic-binary /usr/libexec/lxc/lxc-user-nic --lxc-user-nic-bridge br0

USER rootless
RUN mkdir /home/rootless/sock

CMD ["dockerd", "--experimental", "--host=unix:///home/rootless/sock/docker.sock"]
