FROM java:8-jre

ENV SAUCE_VERSION 4.3.11

WORKDIR /usr/local/sauce-connect

RUN apt-get update -qqy && apt-get install -qqy wget
RUN wget https://saucelabs.com/downloads/sc-$SAUCE_VERSION-linux.tar.gz -O - | tar -xz

WORKDIR /usr/local/sauce-connect/sc-$SAUCE_VERSION-linux

EXPOSE 8032

CMD ["./bin/sc", "-P", "8000", "-u", $SAUCE_USERNAME, "-k", $SAUCE_ACCESS_KEY]
