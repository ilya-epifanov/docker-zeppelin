FROM smartislav/spark:2.1.0

RUN apt-get -y update \
 && apt-get -y install --no-install-recommends wget \
 && wget http://apache.hippo.nl/zeppelin/zeppelin-0.7.0/zeppelin-0.7.0-bin-all.tgz -O /tmp/zeppelin.tgz \
 && mkdir /zeppelin \
 && tar zxf /tmp/zeppelin.tgz -C /zeppelin --strip-components 1 \
 && apt-get remove -y wget \
 && apt-get clean -y \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH=/zeppelin/bin:$PATH

CMD "zeppelin.sh"
