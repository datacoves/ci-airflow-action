FROM datacoves/ci-airflow:0.4.0

COPY entrypoint.sh /entrypoint.sh
COPY dagbag_validator.py /dagbag_validator.py
ENTRYPOINT [ "/entrypoint.sh" ]
