FROM local/spark-base:latest

ENV SPARK_HOME="/opt/spark"

# install SPARK 
ARG SPARK_VERSION
ARG HADOOP_VERSION

RUN apt-get update && \
    curl -OJ https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} ${SPARK_HOME} \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mkdir ${SPARK_HOME}/logs

# copy entrypoing script
COPY start-cluster.sh start-cluster.sh

ENV PATH="${SPARK_HOME}/bin:${PATH}"
ENV PYSPARK_DRIVER_PYTHON=python3

SHELL ["/bin/sh", "-c"]
ENTRYPOINT ["start-cluster.sh"]
CMD []

