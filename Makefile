SHELL=/bin/bash

# build base image
build-base:
	docker build ./image_base -t spark_base:latest	

# build the venv for Python dependencies
build-venv: 
	python -m venv pyspark_venv
	pyspark_venv/bin/pip install -r requirements.txt
	pyspark_venv/bin/venv-pack --force -p pyspark_venv/ -o mounted_dirs/jobs/pyspark_conda_env.tar.gz

# build the cluster
build: build-base build-venv
	docker-compose build 

# start the spark cluster (also build)
start:
	docker-compose up

restart: start

# start the spark cluster in detached mode
start-detach: 
	docker-compose up --detach

restart-detach: start-detach 

# stop the spark cluster 
stop: 
	docker-compose stop

# stop the Spark cluster and remove all volumes
down: 
	docker-compose down --volumes