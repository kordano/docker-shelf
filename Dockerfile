FROM ubuntu:latest

ADD ./opt /opt

# Update the APT cache
RUN apt-get update

# Install and setup project dependencies
RUN apt-get install -y curl git wget unzip

# prepare for Java download
RUN apt-get install -y software-properties-common
RUN apt-get -y install openjdk-6-jre-headless
ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64

# grab leiningen
RUN curl https://raw.github.com/technomancy/leiningen/stable/bin/lein -o /usr/local/bin/lein
RUN chmod +x /usr/local/bin/lein
ENV LEIN_ROOT=yes
RUN lein

# grab project
RUN git clone https://github.com/kordano/lambda-shelf.git /opt/lambda-shelf

# define port
EXPOSE 8080

# get dependencies
RUN /opt/get-shelf-deps

# create uberjar with leiningen
RUN /opt/build-shelf

CMD ["/opt/start-shelf"]
