# docker-spark-configuration

This repository creates docker images to create a spark cluster. Look specifically at each branch. All containers should be connected in a user-defined network in order to allow easy name resolving within docker.

## Branches
* master
* spark-master
* spark-worker


### master
This branch contains all the spark configurations for the relevant branches. They will download them from spark-conf an place them into $SPARK\_HOME/conf.

This branch also contains two scripts build-docker and run-docker. 
* **build-docker** builds images with no-cache to avoid caching problems while changing the configuration on the repository. It then checkout to images branches and builds them. If there is uncommitted work that conflicts git checkout will fail and the images won't be build. An appropriate message will be shown as well.
* **run-docker** creates a user defined network to used if it doesn't exit, runs *build-docker* and invokes an image of spark-master and an image of spark-worker.

Go to localhost:8080 for the master ui

#### Docker usage
* *docker ps* to view all running containers.
* *docker attach $HASH$* to attach the console to that image. If it doesn't give any output then press a button and it will show.
* ctl + p, ctl + q to detach from a container.
* docker stop $(docker ps -q) to stop all running containers.

### spark-master
The branch spark-master creates an image with a spark standalone master and uses the configurations located on origin/master spark-conf folder. The network alias for this container should be master in order for the workers to be able to connect.

### spark-worker
The branch spark-worker creates an image that automatically runs spark-slave and try to connect to a node called master. Uses the configurations located on origin/master spark-conf folder.

