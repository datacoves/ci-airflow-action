FROM datacoves/ci-airflow:0.5.202205191422-4f63a7f7
# The source code for this image is in https://gitlab.com/datacoves/datacoves/-/tree/main/src/ci

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
