# author: amoblin <amoblin@gmail.com>
# file name: Dockerfile
# description: Docker build file for generate develop environment
# create date: 2014-11-04 14:26:47
# This file is created from $MARBOO_HOME/media/starts/Dockerfile
# 本文件由 $MARBOO_HOME/media/starts/Dockerfile　复制而来

FROM centos:latest

MAINTAINER amoblin <amoblin@gmail.com>
RUN yum install -y zsh git emacs tmux vim rubygems ruby
RUN yum install -y gcc make openssh-server
# development tools
RUN yum groupinstall 'Development Tools'
# install oh-my-zsh
RUN curl -L http://install.ohmyz.sh | sh

# gollum
RUN yum install -y ruby-devel libicu-devel zlib-devel
RUN gem install gollum-site
