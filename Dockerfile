FROM flanaras/docker-spark:2.2.0-jre8
MAINTAINER flanaras

USER root

# Custom
##
ENV TEMP_FILE docker-spark-configuration
ENV BRANCH master
RUN curl -s -O -L https://github.com/flanaras/$TEMP_FILE/archive/$BRANCH.zip \
        && unzip $BRANCH.zip \
        && mv $TEMP_FILE-$BRANCH/spark-conf/* $SPARK_HOME/conf \
        && rm -r $TEMP_FILE-$BRANCH $BRANCH.zip
##

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh 
RUN chmod 700 /etc/bootstrap.sh 

ENTRYPOINT ["/etc/bootstrap.sh"]
