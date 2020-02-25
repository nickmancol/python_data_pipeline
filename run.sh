#!/bin/bash

docker build -t python_data_pipeline -f config/python_data_pipeline.Dockerfile .
docker run -ti -v ${PWD}:/usr/local/bin/python_data_pipeline -p 8888:8888 python_data_pipeline