FROM docker:19.03-dind-rootless

USER root

RUN apk add --no-cache lxc iptables dnsmasq su-exec \
  && echo "rootless veth lxcbr0 50" > /etc/lxc/lxc-usernet

ENV DOCKERD_ROOTLESS_ROOTLESSKIT_NET lxc-user-nic
ENV DOCKERD_ROOTLESS_ROOTLESSKIT_FLAGS --lxc-user-nic-binary /usr/libexec/lxc/lxc-user-nic

COPY dockerd-lxc-net-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/dockerd-lxc-net-entrypoint.sh \
  && mkdir /home/rootless/sock \
  && chown rootless /home/rootless/sock

ENTRYPOINT ["dockerd-lxc-net-entrypoint.sh"]
