FROM ubuntu:14.04

MAINTAINER Ivan Sadikov

RUN apt-get update && apt-get install -y openjdk-7-jre curl openssh-server
RUN curl http://d3kbcqa49mib13.cloudfront.net/spark-1.6.2-bin-hadoop2.6.tgz | tar xz

ENV SPARK_HOME /spark-1.6.2-bin-hadoop2.6

RUN mkdir -p /var/run/sshd
RUN ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

EXPOSE 4040 8080 8081
