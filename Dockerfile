#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

ARG PHP_VERSION=7.4.0

FROM phusion/baseimage:bionic-1.0.0
FROM php:${PHP_VERSION}-alpine

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

ARG PHP_VERSION=7.4.0

RUN DEBIAN_FRONTEND=noninteractive
RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

#
#--------------------------------------------------------------------------
# Software's Installation
#--------------------------------------------------------------------------
#

RUN echo 'DPkg::options { "--force-confdef"; };' >> /etc/apt/apt.conf

#####################################
# Composer:
#####################################

# Install composer and add its bin to the PATH.
RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer

# Source the bash
RUN . ~/.bashrc
