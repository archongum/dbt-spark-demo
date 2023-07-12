from setuptools import find_packages, setup

setup(
    name="my_dagster_project",
    packages=find_packages(exclude=["my_dagster_project_tests"]),
    install_requires=[
        # dagster + dbt
        "dagster~=1.3.13",
        "dagster-dbt~=0.19.13",
        "dbt-spark[PyHive]~=1.5.0",
    ],
    extras_require={"dev": ["dagit", "pytest"]},
)
