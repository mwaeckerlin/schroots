FROM ubuntu
MAINTAINER mwaeckerlin

VOLUME /var/chroot
VOLUME /etc/schroot

RUN apt-get install -y wget software-properties-common apt-transport-https
RUN apt-add-repository https://dev.marc.waeckerlin.org/repository
RUN wget -O- https://dev.marc.waeckerlin.org/repository/PublicKey | apt-key add -
RUN apt-get update -y
RUN apt-get install -y debian-chroots suse-chroots 
RUN echo "/var/lib/jenkins /var/lib/jenkins none rw,bind 0 0" >> /etc/schroot/default/fstab
RUN setup-debootstrap.sh
RUN setup-susebootstrap.sh

CMD sleep infinity
