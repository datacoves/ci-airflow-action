FROM datacoves/ci-airflow:0.5.0.202204221358-bb5d1070
# The source code for this image is in https://gitlab.com/datacoves/datacoves/-/tree/main/src/ci

LABEL com.datacoves.ci.library.version.dbt="1.0.1"
LABEL com.datacoves.ci.library.version.dbt-coves="1.0.4a23"
LABEL com.datacoves.ci.library.version.apache-airflow="2.2.2"
LABEL com.datacoves.ci.library.version.dag-factory="0.8.0-26"
LABEL com.datacoves.ci.library.version.airflow-dbt="0.4.0-2"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
