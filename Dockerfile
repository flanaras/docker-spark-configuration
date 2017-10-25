FROM flanaras/docker-spark:2.2.0-jre8
MAINTAINER flanaras

USER root

# Custom
##
RUN hdfs dfs -mkdir /shared && \
        hdfs dfs -mkdir /shared/events
##

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh 
RUN chmod 700 /etc/bootstrap.sh 

ENTRYPOINT ["/etc/bootstrap.sh"]
