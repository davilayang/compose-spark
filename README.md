# Tooling: Spark

+ Start a Docker container with Spark
+ Start a SPARK cluster with two workers

## Start a Docker container with Spark

```bash
# build the image with Pyspark==3.1.1
docker build -t tooling-spark_jupyter-server --build-arg SPARK_VERSION=3.1.1 ./image_jupyter
# start the jupyter container
docker run -it --rm -p 8888:8888 \
    -v $(pwd)/notebooks:/app/notebooks \
    -v $(pwd)/data:/app/data \
    tooling-spark_jupyter-server
```

## Start a SPARK standalone cluster with two workers

```bash
# build and start the cluster
docker-compose up --build 

# stop the cluster
docker-compose down --volumes
```

## Access the services

```bash
# start without address bar
google-chrome --new-window --app=http://localhost:8888/lab
google-chrome --incognito --app=http://localhost:8888/lab
```

+ Jupyter Lab at http://localhost:8888
+ Spark master UI at http://localhost:8080
+ Spark worker 1 UI at http://localhost:8081
+ Spark worker 2 UI at http://localhost:8082

## References

Official:  

+ [Spark Overview](https://spark.apache.org/docs/latest/)
+ [Spark Standalone Mode](http://spark.apache.org/docs/latest/spark-standalone.html)

Repos:  

+ [docker-spark](https://github.com/big-data-europe/docker-spark)
+ [docker-spark-cluster](https://github.com/mvillarrealb/docker-spark-cluster)
+ [docker-sbt](https://github.com/mozilla/docker-sbt/blob/main/Dockerfile)
+ [apache/spark, Dockerfile](https://github.com/apache/spark/blob/master/resource-managers/kubernetes/docker/src/main/dockerfiles/spark/Dockerfile)

Articles:  

+ [DIY: Apache Spark & Docker](https://towardsdatascience.com/diy-apache-spark-docker-bb4f11c10d24)
+ [How to install PySpark and Jupyter Notebook in 3 Minutes](https://www.sicara.ai/blog/2017-05-02-get-started-pyspark-jupyter-notebook-3-minutes)
+ [Creating a Spark Standalone Cluster with Docker and docker-compose](https://medium.com/@marcovillarreal_40011/creating-a-spark-standalone-cluster-with-docker-and-docker-compose-ba9d743a157f)
+ [透過 Multiple Stage Builds 編譯出最小的 Docker Image](https://jiepeng.me/2018/06/09/use-docker-multiple-stage-builds)
+ [Apache Spark Cluster on Docker](https://www.kdnuggets.com/2020/07/apache-spark-cluster-docker.html)
+ [Apache Spark on Dataproc vs. Google BigQuery](https://www.kdnuggets.com/2020/07/apache-spark-dataproc-vs-google-bigquery.html)
