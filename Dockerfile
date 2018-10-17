FROM ubuntu:16.04
MAINTAINER "sriprasanna.p@gmail.com"
RUN /bin/bash -c 'apt-get update -y && apt-get install nginx -y'
CMD ["nginx", "-g", "daemon off;"]
