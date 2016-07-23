#!/bin/bash

rm -f /tmp/*.pid
service ssh start

# Add spree dependencies before we start Spark in cluster mode
if [[ ! -f $SPARK_HOME/conf/spark-defaults.conf ]]; then
  cp $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf
  echo "spark.extraListeners org.apache.spark.JsonRelay" >> $SPARK_HOME/conf/spark-defaults.conf
  echo "spark.jars.packages org.hammerlab:spark-json-relay:2.0.0" >> $SPARK_HOME/conf/spark-defaults.conf
fi

# Start Apache Spark in cluster mode
$SPARK_HOME/sbin/start-all.sh

/bin/bash -c "$*"
