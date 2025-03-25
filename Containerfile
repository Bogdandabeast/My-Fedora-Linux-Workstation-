FROM ghcr.io/ublue-os/sericea-main:latest

RUN dnf config-manager --add-repo https://pkg.cloudflareclient.com/cloudflare-warp-ascii.repo
RUN dnf install -y cloudflare-warp && dnf clean all
RUN echo "ResolveUnicastSingleLabel=yes" | sudo tee -a /etc/systemd/resolved.conf
RUN systemctl enable systemd-resolved

RUN bootc container lint 

#COPY [unpackaged application] to do
#COPY [configuration files] to do
#RUN [config scripts] to do




#COPY build.sh /tmp/build.sh
#RUN mkdir -p /var/lib/alternatives && \
#    /tmp/build.sh && \
#    ostree container commit


