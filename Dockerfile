FROM resin/rpi-raspbian:latest

RUN apt-get -q update && apt-get install -yq  dropbear --no-install-recommends && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "root:root" | chpasswd

RUN echo "$PASSWD"

COPY . /app
RUN chmod +x /app/init.sh
CMD ["/app/init.sh"]