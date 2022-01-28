FROM datacoves/ci-airflow:0.4.0

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
