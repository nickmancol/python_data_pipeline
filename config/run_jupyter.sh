#!/bin/bash

cd ~
mkdir -p .jupyter

# copy the jupyter configuration into home-directory
cp -r ${CONFIG_PATH}/jupyter_notebook_config.py ~/.jupyter/

# copy the jupyter configuration into home-directory
mkdir -p .aws
cp -r ${CONFIG_PATH}/credentials ~/.aws/

cd ${MAIN_PATH}


# edit the python3 kernel, that already imports os,sys and the paths to the app and test
cat > /usr/local/share/jupyter/kernels/python3/kernel.json <<EOKERN
{
    "display_name": "Python 3",
    "language": "python",
    "argv": [
        "python3",
        "-c", "import sys, os; sys.path.insert(0, os.path.dirname(os.environ['LIBS_PATH'])); import libs.nbimport; from IPython.kernel.zmq.kernelapp import main; main()",
        "-f", "{connection_file}"
    ],
    "codemirror_mode": {
        "version": 2,
        "name": "ipython"
    }
}
EOKERN

#moto_server sqs -p 4576 -H localhost > /dev/null &
#aws --endpoint-url=http://localhost:4576 sqs create-queue --queue-name sse_queue --region us-east-1
#moto_server s3 -p 4572 -H localhost > /dev/null &
#aws --endpoint-url=http://localhost:4572 s3 mb s3://sse-bucket --region us-east-1
mkdir notebooks
#cp -r ${CONFIG_PATH}/SSE_Consumer.py ~/.notebooks/
#cp -r ${CONFIG_PATH}/Stream_Processor.py ~/.notebooks/
jupyter lab