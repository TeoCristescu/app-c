FROM devhub-docker.cisco.com/iox-docker/ir800/base-rootfs

COPY src /opt/src/
RUN opkg update &&\
    opkg install iox-toolchain && \
    opkg install gdb

RUN mkdir /opt/apps && \
    gcc /opt/src/display-date-time.c -o /opt/apps/display-date-time && \
    gcc /opt/src/loop_app.c -o /opt/apps/loop_app

CMD ["/opt/apps/display-date-time"] 

