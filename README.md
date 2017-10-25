# docker-spark-configuration

This repository creates docker images to create a spark cluster. Look specifically at each branch. All containers should be connected in a user-defined network in order to allow easy name resolving within docker.

## Branches
* spark-master
* spark-worker


### spark-master
The branch spark-master creates an image with a spark standalone master and uses the configurations located on origin/master spark-conf folder. The network alias for this container should be master in order for the workers to be able to connect.

### spark-worker
The branch spark-worker creates an image that automatically runs spark-slave and try to connect to a node called master. Uses the configurations located on origin/master spark-conf folder.

