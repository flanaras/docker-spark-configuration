FROM flanaras/docker-spark-hadoop:2.2.0-2.7.1-8
MAINTAINER flanaras

USER root

ADD spark-conf $SPARK_HOME/conf

ENTRYPOINT ["/etc/bootstrap.sh"]
