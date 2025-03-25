#FROM ghcr.io/ublue-os/sericea-main:latest
FROM quay.io/fedora/fedora-bootc:41



#COPY [unpackaged application] to do
#COPY [configuration files] to do
#RUN [config scripts] to do




COPY build.sh /tmp/build.sh
RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit


