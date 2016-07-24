# Spark + Spree

This is docker image of `Spark` + `Spree` setup. For more info refer to
[Spark](https://spark.apache.org/) and [Spree](https://github.com/hammerlab/spree) websites.

- Apache Spark 1.6.2
- Spree 0.2.0

## Pull or build
You can pull image from docker hub directly
```shell
docker pull sadikovi/spark-spree:0.2.0
```

If image in docker hub is not available, or you want to build images locally, just run commands
below to create them:
- 1. Building image for Spark 1.6.2
```shell
docker build --tag=sadikovi/spark:1.6.2 ./spark
```
- 2. Building image for Spree 0.2.0:
```shell
docker build --tag=sadikovi/spark-spree:0.2.0 ./spree
```

## Start container
Run command to start container:
```
docker run -it -p 8080:8080 -p 4040:4040 -p 3000:3000 sadikovi/spark-spree:0.2.0 bash
```
For remapping ports in case some of them are already taken, refer to docker documentation.

Once container has started, Spark UI should be available at
[http://localhost:8080](http://localhost:8080). Note that you run it on Windows or OS X, you might
need to use boot2docker IP instead of localhost: `docker-machine ip default`.

To restart container run (for more info refer to docker documentation):
```
docker start CONTAINER_NAME
docker attach CONTAINER_NAME
```

## Start Spree
To start **Spree** execute `/etc/spree.sh` in container. This starts Meteor + Mongo DB and `slim`
server. First start might take quite a while, because Meteor needs to set up project and download
project dependencies. Subsequent times script should run fairly quickly. You can check that
everything is running by running:
```shell
ps aux | grep meteor
ps aux | grep mongod
ps aux | grep slim
```

After this Spree UI should be available at [http://localhost:3000](http://localhost:3000). Spree
shows Spark applications that are run in both local mode and cluster mode.

## Try it
Start `spark-shell` and run some simple Spark job to see live update in Spree.
```
$SPARK_HOME/bin/spark-shell
...
scala> val df = sqlContext.range(0, 100)
scala> df.count()
```

## When something goes wrong
What usually happens is that `slim` does not start the very first time, in this case try 
re-running `/etc/spree.sh` again, and check that it is running by `ps aux | grep slim`.

You can always start Spree manually following documentation on repository page. Note that all
dependencies are already installed:
```shell
cd $SPREE_HOME/ui
# this will start meteor and mongo db
meteor &
# this will start slim
slim &
```

Sometimes `slim` takes a little bit of time to start, you can restart it by running:
```shell
cd $SPREE_HOME/ui
slim
```
