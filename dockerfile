FROM python: 3.8
USER root
RUN mkdir /app
COPY  ./app/
RUN pip3 install -r requirements.txt
ENV  AIRFLOW_HOME = "/app/airflow"
ENV AIRFLOW_CORE_DAGBAG_IMPORT_TIMEOUT = 1000
ENV AIRFLOW_CORE_ENABLE_XCOM_PIKLING = True
RUN
RUN airflow users create -e raushankumar906047@gmail.com -f Raushan -l Kumar -p admin -r Admin
RUN chmod 777 start.sh
RUN apt update -y && apt install awscli -y
ENTRYPOINT ["/bin/sh"]
CMD ["start.sh"]