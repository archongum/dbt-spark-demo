from dagster import Definitions, load_assets_from_modules
from dagster_dbt import DbtCliClientResource

from my_dagster_project import assets
from my_dagster_project.assets import DBT_PROJECT_PATH, DBT_PROFILES

resources = {
    "dbt": DbtCliClientResource(
        project_dir=DBT_PROJECT_PATH,
        profiles_dir=DBT_PROFILES,
    ),
}

defs = Definitions(assets=load_assets_from_modules([assets]), resources=resources)
