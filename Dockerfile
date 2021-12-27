FROM jupyter/pyspark-notebook:spark-3.1.2

USER root

COPY ./jars/ $SPARK_HOME/jars

RUN echo 'spark.driver.extraClassPath /usr/local/jars/*' >> "${SPARK_HOME}/conf/spark-defaults.conf" && \
    echo 'spark.serializer org.apache.spark.serializer.KryoSerializer' >> "${SPARK_HOME}/conf/spark-defaults.conf" 

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt && \
    pip install "jupyterlab>=3" "ipywidgets>=7.6"