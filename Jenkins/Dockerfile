FROM jenkins/agent:alpine-jdk11

USER root

RUN apk add python3 
RUN apk add py3-pip 
RUN apk update 
RUN apk add docker 
RUN apk add docker-compose 
RUN mkdir -p /run/docker.sock
RUN dockerd &

USER jenkins
