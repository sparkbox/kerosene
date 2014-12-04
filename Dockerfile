###################### 
#
# Dockerfile which sets up the latest Sparkbox Developer instance.
#
# Build an image
# `docker build --rm=true -t tinder:latest - < Dockerfile`
#
# Example startup
# `docker run -ti -v ~/projects:/projects sparkbox/tinder:latest`
###################### 

FROM ubuntu:latest

MAINTAINER Ryan Cromwell <ryan@heysparkbox.com>

###################### 
# Ubuntu Packages
###################### 
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl git patch gawk g++ gcc make libc6-dev patch libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev

###################### 
# Sparkuser
###################### 
RUN useradd -ms /bin/bash sparkuser

###################### 
# RVM
###################### 
USER sparkuser
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN /bin/bash -l -c "curl -L get.rvm.io | bash -s stable"

###################### 
# Ruby 2.1
###################### 
USER sparkuser
RUN /bin/bash -l -c "rvm install 2.1"
RUN /bin/bash -l -c "echo 'gem: --no-ri --no-rdoc' > ~/.gemrc"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

###################### 
# NODE
###################### 
USER root
RUN /bin/bash -l -c "curl -sL https://deb.nodesource.com/setup | bash -"
RUN apt-get install -y nodejs

USER sparkuser
ONBUILD ENV USER sparkuser
ONBUILD RUN /bin/bash -l -c "source /home/$USER/.rvm/scripts/rvm"

###################### 
# TODO
###################### 
# libsass
# mysql
# postgres
# solr
# redis
# bower
# grunt
# coffee-script
# divshot
# zsh
