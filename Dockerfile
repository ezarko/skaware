FROM oraclelinux:7.1

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN yum -y install git curl make gcc gcc-c++ kernel-devel

COPY skarnet-builder /skarnet-builder

RUN chown -R nobody:nogroup /skarnet-builder

USER nobody
ENV HOME /skarnet-builder
WORKDIR /skarnet-builder

CMD ["/skarnet-builder/build-wrapper"]
