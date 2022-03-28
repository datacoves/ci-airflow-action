FROM datacoves/ci-airflow:0.4.0.202203281352-1d5924c7
# The source code for this image is in https://gitlab.com/datacoves/datacoves/-/tree/main/src/ci

LABEL com.datacoves.ci.library.version.dbt="0.21.1"
LABEL com.datacoves.ci.library.version.dbt-coves="0.21.1a20"
LABEL com.datacoves.ci.library.version.apache-airflow="2.2.1"
LABEL com.datacoves.ci.library.version.dag-factory="0.8.0-26"
LABEL com.datacoves.ci.library.version.airflow-dbt="0.4.0-2"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
