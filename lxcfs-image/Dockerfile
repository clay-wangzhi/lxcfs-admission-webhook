FROM centos:7
RUN yum -y update
RUN yum -y install fuse-devel pam-devel wget install gcc automake autoconf libtool make python3 && \
    yum clean all
RUN pip3 install meson jinja2 ninja

ENV LXCFS_VERSION 5.0.0
RUN wget https://linuxcontainers.org/downloads/lxcfs/lxcfs-$LXCFS_VERSION.tar.gz && \
	mkdir /lxcfs && tar xzvf lxcfs-$LXCFS_VERSION.tar.gz -C /lxcfs  --strip-components=1 && \
	cd /lxcfs && meson setup -Dinit-script=systemd --prefix=/usr build/ && \
    meson compile -C build/
RUN cp /usr/lib64/libfuse.so.2.9.2 /lxcfs/libfuse.so.2.9.2 && \
    cp /usr/lib64/libulockmgr.so.1.0.1 /lxcfs/libulockmgr.so.1.0.1


COPY start.sh /
CMD ["/start.sh"]
