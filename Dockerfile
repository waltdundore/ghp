# Base
FROM centos:centos7.9.2009

# Prep
RUN yum -y install nc net-tools nmap file tcpdump unzip
RUN adduser -u 1000 -g 10 centos
RUN adduser -u 1010 -g 10 web
WORKDIR /home/centos


# 01
RUN mkdir flag_dir && touch flag_dir/FLAG1_Rx172nH

# 02
RUN mkdir -p .ghp/ && echo FLAG2_xr14Tc > .ghp/flag

# 03
RUN cat /dev/random | head -100 > /tmp/.flag3 && echo 'FLAG3_R9pp32c' >> /tmp/.flag3 && cat /dev/random | head -100 >> /tmp/.flag3


# 04
RUN adduser -u 1001 -g 10 www && sed -i '/^wheel:/ s/$/www,FLAG4_r9S7b3/' /etc/group

# 05
RUN echo FLAG5_L00p5 > /home/www/file && chown www /home/www/file && chmod 660 /home/www/file && chmod a+rx /home/www && chgrp wheel /home/www/file && touch /home/www/private && chmod 600 /home/www/private


# 06
ADD web.zip /home/web/web.zip
ADD secret.zip /home/centos/secret.zip

# 07


# 08
RUN mkdir -p /tmp/.rot13 && echo "FLAG8_R12v9a" | tr 'A-Za-z' 'N-ZA-Mn-za-m' >> /tmp/.rot13/flag8

# 09 - external

# 10
ADD flag.dmp flag.dmp

#13
RUN echo "ghp@dundore.net" | tr 'A-Za-z' 'N-ZA-Mn-za-m' >> /tmp/.13_email

# User
USER centos


# Command
CMD nc -lkp 31337 -c 'echo FLAG_11314' & nc -lkp 8080 -c 'cat /tmp/.flag_http' & bash

# Ports
EXPOSE 31337 8080
