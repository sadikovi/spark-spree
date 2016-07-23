FROM sadikovi/spark:1.6.2

MAINTAINER Ivan Sadikov

RUN apt-get install -y nodejs npm nodejs-legacy libkrb5-dev git language-pack-en
RUN curl https://install.meteor.com/ | sh
RUN npm install -g slim.js

ENV SPREE_TAG 0.2.0
ENV SPREE_HOME /spree

RUN git clone --recursive https://github.com/hammerlab/spree.git
RUN cd $SPREE_HOME && git checkout $SPREE_TAG

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

COPY spree.sh /etc/spree.sh
RUN chown root.root /etc/spree.sh
RUN chmod 700 /etc/spree.sh

EXPOSE 3000
ENTRYPOINT ["/etc/bootstrap.sh"]
