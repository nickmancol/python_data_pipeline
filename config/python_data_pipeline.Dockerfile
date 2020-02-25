FROM leandatascience/jupyterlab-ds:latest
ENV MAIN_PATH=/usr/local/bin/python_data_pipeline
ENV LIBS_PATH=${MAIN_PATH}/libs
ENV CONFIG_PATH=${MAIN_PATH}/config
ENV NOTEBOOK_PATH=${MAIN_PATH}/notebooks

EXPOSE 8888
RUN apt-get update && apt-get install -y awscli
RUN pip install boto3
RUN pip install moto[server]
RUN pip install pandas
RUN pip install sseclient
CMD cd ${MAIN_PATH} && sh config/run_jupyter.sh
