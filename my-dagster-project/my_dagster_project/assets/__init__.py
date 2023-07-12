import pandas as pd
from dagster import file_relative_path, asset
from dagster_dbt import load_assets_from_dbt_project

DBT_PROJECT_PATH = file_relative_path(__file__, "../../dbt_demo")
DBT_PROFILES = file_relative_path(__file__, "../../dbt_demo/config")

dbt_assets = load_assets_from_dbt_project(
    project_dir=DBT_PROJECT_PATH, profiles_dir=DBT_PROFILES, key_prefix=["dbt_demo"]
)
