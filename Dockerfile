FROM resin/rpi-raspbian:latest

RUN apt-get -q update && apt-get install -yq  dropbear net-tools iptables hostapd udhcpd nano rfkill iptables iproute dbus --no-install-recommends

RUN echo "root:root" | chpasswd

COPY . /app
RUN chmod +x /app/init.sh
CMD ["/app/init.sh"]