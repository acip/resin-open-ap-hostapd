FROM resin/rpi-raspbian:jessie

RUN apt-get -q update && apt-get install -yq  dropbear --no-install-recommends && apt-get clean && rm -rf /var/lib/apt/lists/*

echo "root:root" | chpasswd

COPY . /app
RUN chmod +x /app/init.sh
CMD ["/app/init.sh"]