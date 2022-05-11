FROM datacoves/ci-airflow:0.5.0.202204221358-bb5d1070
# The source code for this image is in https://gitlab.com/datacoves/datacoves/-/tree/main/src/ci

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
