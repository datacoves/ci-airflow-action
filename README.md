# ci-airflow-action

A GitHub Action to @run [dbt](https://www.getdbt.com) and [dbt-coves](https://www.datacoves.com) commands, as well as test [Apache Airflow](https://airflow.apache.org/) DAGs integrity in a Docker container. You can use [dbt commands](https://docs.getdbt.com/reference/dbt-commands) such as `run`, `test` and `debug`. This action captures the dbt console output for use in subsequent steps. 
## Supported versions

| Library  | Version  |
|---|---|
| dbt  | 1.1.1 |
| dbt-coves  | 1.1.1a1  |
| apache-airflow  | 2.3.1  |
| dag-factory  | 0.8.0-32  |
| airflow-dbt  | 0.4.0-2  |

## Usage

```yml
    - name: DBT Run
      uses: datacoves/ci-airflow-action@v1.1
      with:
        command: "dbt run --profiles-dir ."
      env:
        DBT_USER: ${{ secrets.DBT_USER }}
        DBT_PASSWORD: ${{ secrets.DBT_PASSWORD }}
```
### Outputs

The result of the dbt command is either `failed` or `passed` and is saved into the result output if you want to use it in a next step:

```yml
    - name: DBT Run
      id: dbt-run
      uses: datacoves/ci-airflow-action@v1.1
      with:
        command: "dbt run --profiles-dir ."
      env:
        DBT_USER: ${{ secrets.DBT_USER }}
        DBT_PASSWORD: ${{ secrets.DBT_PASSWORD }}
    - name: Get the result
      if: ${{ always() }}
      run: echo "${{ steps.dbt-run.outputs.result }}"
      shell: bash
```
The result output is also saved in the `DBT_RUN_STATE` environment variable. The location of the dbt console log output can be accessed via the environment variable `DBT_LOG_PATH`. See the "Suggested workflow" section on how to use these.

### General Setup

This action assumes that your dbt project is in the top-level directory of your repo, such as this [sample dbt project](https://github.com/fishtown-analytics/jaffle_shop). If your dbt project files are in a folder, you can specify it as such:

```yml
    - name: DBT Run
      uses: datacoves/ci-airflow-action@v1.1
      with:
        command: "dbt run --profiles-dir ."
        project_folder: "dbt_project"
      env:
        DBT_USER: ${{ secrets.DBT_USER }}
        DBT_PASSWORD: ${{ secrets.DBT_PASSWORD }}
```
**Important:** dbt projects use a `profiles.yml` file to connect to your dataset. **ci-airflow-action** currently requires `.config/profiles.yml` to be in your repo unless changed using the `--profiles-dir` argument or the `DBT_PROFILES_DIR` environment variable.

## Airflow validation usage

```yml
    env:
      DATACOVES__REPO_PATH: /path/to/repo
      DATACOVES__YAML_DAGS_FOLDER: /path/to/airflow/yaml/files
      AIRBYTE__EXTRACT_LOCATION: /path/to/airbyte/extracted/files
      AIRFLOW__CORE__DAGS_FOLDER: /path/to/airflow/dags/location
      AIRFLOW__CORE__DAGBAG_IMPORT_TIMEOUT: 300
      TEST_MODE: "True" # Necessary to avoid connection issues between Airflow and Airbyte

    steps:
      - name: Test DAG structure integrity (DagBag Loading)
        uses: datacoves/ci-airflow-action@v1.1
        with:
            command: "python /usr/app/load_dagbag.py"
      
      - name: Test DBT Sources against DAGs' YAML files
        uses: datacoves/ci-airflow-action@v1.1
        with:
          dbt_project_folder: "transform"
          command: "python /usr/app/test_dags.py"
        
```

## Thanks

This repo was inspired on https://github.com/mwhitaker/dbt-action. Thanks to [Michael Whitaker](https://github.com/mwhitaker).

## Suggested workflow and other tips

Here is a [sample workflow](https://github.com/mwhitaker/dbt-action-sample) that sends dbt console logs by email.

## License

[MIT](LICENSE)