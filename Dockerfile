FROM flanaras/docker-spark:2.2.0-jre8
MAINTAINER flanaras

USER root

# Custom
##

##

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh 
RUN chmod 700 /etc/bootstrap.sh 

ENTRYPOINT ["/etc/bootstrap.sh"]
