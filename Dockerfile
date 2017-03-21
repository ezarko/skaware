FROM oraclelinux:7.1

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN yum -y --enablerepo ol7_latest,ol7_optional_latest install gcc gcc-c++ git glibc-static kernel-devel make tar

COPY skarnet-builder /skarnet-builder

RUN chown -R nobody:nobody /skarnet-builder

USER nobody
ENV HOME /skarnet-builder
WORKDIR /skarnet-builder

CMD ["/skarnet-builder/build-wrapper"]
#docker build --build-arg http_proxy=http://www-proxy.us.oracle.com:80 -t skaware .
#docker run -it -v `pwd`/dist:/skarnet-builder/dist -e http_proxy=http://www-proxy.us.oracle.com:80 -e https_proxy=http://www-proxy.us.oracle.com:80 -e HTTP_PROXY=http://www-proxy.us.oracle.com:80 -e HTTPS_PROXY=http://www-proxy.us.oracle.com:80 skaware
