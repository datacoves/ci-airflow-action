FROM datacoves/ci-airflow:0.5.0.202205131508-3e4cf713
# The source code for this image is in https://gitlab.com/datacoves/datacoves/-/tree/main/src/ci

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
