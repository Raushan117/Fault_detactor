FROM python:3.8
USER root
RUN mkdir /app
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y curl
COPY . /app/
WORKDIR /app/
RUN pip3 install -r requirements.txt
ENV AIRFLOW_HOME="/app/airflow"
ENV AIRFLOW__CORE__DAGBAG_IMPORT_TIMEOUT=1000
ENV AIRFLOW__CORE__ENABLE_XCOM_PICKLING=True
RUN airflow db init 
RUN airflow users create  -e raushankumar906047@gamil.com -f Raushan -l kumar -p admin -r Admin  -u admin
RUN chmod 777 start.sh
RUN apt update -y && apt install awscli -y
ENTRYPOINT [ "/bin/sh" ]
CMD ["start.sh"]
