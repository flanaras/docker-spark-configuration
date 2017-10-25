#!/bin/bash

# Pre
/usr/sbin/sshd

# In
## setting spark defaults
cp $SPARK_HOME/conf/metrics.properties.template $SPARK_HOME/conf/metrics.properties

$SPARK_HOME/sbin/start-master.sh
$SPARK_HOME/sbin/start-history-server.sh

# Loop
CMD=${1:-"exit 0"}
if [[ "$CMD" == "-d" ]];
then
	service sshd stop
	/usr/sbin/sshd -D -d
else
	/bin/bash -c "$*"
fi
