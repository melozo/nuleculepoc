FROM projectatomic/atomicapp:0.6.4

MAINTAINER Red Hat, Inc. <container-tools@redhat.com>

LABEL io.projectatomic.nulecule.providers="docker" \
      io.projectatomic.nulecule.specversion="0.0.2"


LABEL INSTALL /usr/bin/docker run -t -i --rm \${OPT1} --privileged -v /:/host --net=host --ipc=host --pid=host -e HOST=/host -e NAME=\${NAME} -e IMAGE=\${IMAGE} -e CONFDIR=\/etc/${NAME} -e LOGDIR=/var/log/\${NAME} -e DATADIR=/var/lib/\${NAME} \${IMAGE} \${OPT2} /bin/install.sh \${OPT3}

LABEL UNINSTALL docker run -t -i --rm --privileged -v /:/host --net=host --ipc=host --pid=host -e
HOST=/host -e NAME=${NAME} -e IMAGE=${IMAGE} -e CONFDIR=/host/etc/${NAME} -e
LOGDIR=/host/var/log/${NAME} -e DATADIR=/host/var/lib/${NAME} -e
SYSTEMD_IGNORE_CHROOT=1 --name ${NAME} ${IMAGE} /bin/uninstall


ADD /Nulecule /Dockerfile README.md /application-entity/
ADD /artifacts /application-entity/artifacts
