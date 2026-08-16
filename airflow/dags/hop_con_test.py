from datetime import datetime

import os
import requests

from airflow import DAG
from airflow.providers.standard.operators.python import PythonOperator


def run_hop_workflow():
    response = requests.get(
        "http://hop:8080/hop/execWorkflow",
        params={
            "workflow": "/project/wf/customers_workflow.hwf",
            "runConfig": "local",
            "level": "Basic",
        },
        auth=(
            os.environ["HOP_SERVER_USER"],
            os.environ["HOP_SERVER_PASS"],
        ),
        timeout=300,
    )

    print(f"HTTP status: {response.status_code}")
    print(response.text)

    response.raise_for_status()

    if "<result>ERROR</result>" in response.text:
        raise RuntimeError(f"Hop workflow failed:\n{response.text}")


with DAG(
    dag_id="customers_etl",
    start_date=datetime(2026, 8, 16),
    schedule="* 1 * * *",
    catchup=False,
) as dag:

    run_hop = PythonOperator(
        task_id="run_hop",
        python_callable=run_hop_workflow,
    )