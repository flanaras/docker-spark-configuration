#!/bin/bash

# Pre
/usr/sbin/sshd

# In
$SPARK_HOME/sbin/start-slave.sh spark://master:7077

# Loop
CMD=${1:-"exit 0"}
if [[ "$CMD" == "-d" ]];
then
	service sshd stop
	/usr/sbin/sshd -D -d
else
	/bin/bash -c "$*"
fi
