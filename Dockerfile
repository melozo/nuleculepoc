FROM projectatomic/atomicapp:0.6.4

MAINTAINER Red Hat, Inc. <container-tools@redhat.com>

LABEL io.projectatomic.nulecule.providers="docker" \
      io.projectatomic.nulecule.specversion="0.0.2" \
      RUN="docker run -it --rm \${OPT1} --privileged -v \${PWD}:/atomicapp -v /run:/run -v /:/host --net=host --name \${NAME} -e USER -e SUDO_USER -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE} \${OPT2} run \${OPT3}" \
      STOP="docker run -it --rm \${OPT1} --privileged -v \${PWD}:/atomicapp -v /run:/run -v /:/host --net=host --name \${NAME} -e USER -e SUDO_USER -e NAME=\${NAME} -e IMAGE=\${IMAGE} \${IMAGE} \${OPT2} stop \${OPT3}"


ADD /Nulecule /Dockerfile README.md /application-entity/
ADD /artifacts /application-entity/artifacts
