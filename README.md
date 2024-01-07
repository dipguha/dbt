# The Complete dbt (Data Build Tool) Bootcamp: Zero to Hero

## Lecture 11: The modern data stack
- Extract - Transform (outside database as db cost was quite high) - load
- Evolutionof modern data stack
  - SMP (Multiple CPUs, Memory, Disk). Veritical scaling possible.
  - MPP
    - Data transfer becomes faster
    - Routing tech got introduced
    - Scale out/horizontal scaling
  - Compute and storage separation
  - Row oriented to column oriented databases

## Lecture 17: dbt Overview
- Transform - T
- Apply software engineering practices of version control, testing and CI/CD

## Lecture 18: Use case and input data model overview
- As an Analytics Engineer in Airbnb
  - Loading, cleansing and exposing data
  - Writing tests, automation and documentation
- DBT, Snowflake, Preset (BI Tool)
- Requirements
  - Modelling changes are easy to follow and revert
  - Explicit dependencies between models
  - Explore dependencies between models
  - Data quality tests
  - Error reporting
  - Incrementatal load of fact tables
  - Track history of dimension tables
  - Easy to access documentation

## Lecture 19: dbt Overview
- Github: https://github.com/nordquant/complete-dbt-bootcamp-zero-to-hero

## Lecture 20: Snowflake registration
- Standard edition
- AWS US East Ohio
- Choose user name and password to get srarted

## Lecture 22: Importing Airbnb data into Snowflake
- Create role transform
- Create warehouse compute_wh
- Create user dbt and assign role transform
- Create database and schema airbnb.raw
- Grant All privileges on warehouse, database, schema(current and future in database airbnb), tables (current and future in raw schema)
- Tables
  - raw_hosts
  - raw_listings
  - raw_reviews
  - full_moon_date

## Lecture 23: Set up instructions
- brew install python@3.11 virtualenv
- mkdir ~/.dbt

## Lecture 26: Setting up Python and PIP on Mac
- Tools
  - iTerm2
  - Homebrew
  - fig.io for autocompletion
- Install Python 3.11 and Python virtualenv package
- Create a virtual env
- Activate virtual env
  ```bash
    mkdir course
    cd course
    brew install python@3.11 virtualenv
    virtualenv venv --python=python3.11
    . venv/bin/activate
  ``` 

## Lecture 27: dbt installation
```bash
  pip install dbt-snowflake=1.5.0
  dbt
``` 

## Lecture 28: dbt1.5 project and connect to Snowflake
```bash
  mkdir ~/.dbt
  dbt init dbtlearn
  ls
  cd dbtlearn
  dbt debug
``` 
- Choose Snowflake as database and provide account number
- user: dbt, password: , role: transform, warehouse: COMPUTE_WH, database: AIRBNB, schema: DEV, thread: 1
- /.dbt/profiles.yml created

## Lecture 30:
- dbt_project.yml
  - project level configuration
  - model level config

## Lecture 33: Install and configure DBT Power user extension
- Extension: dbt power user v0.20.0 
- code - settings - files - Associations - add items - (*.sql - jinga-sql)
- Select appropriate Python interpreter
- dbt slack channel, tools-dbt-power-user

## Lecture 35: Datasets and Data flow overview
- Models
  - src_hosts
  - src_listings
  - src_reviews

## Lecture 37: Models overview
- Models are basic building blocks of business logic
- Materialized as tables, views
- Live in the sql files in models folder
- Models can reference each other and use templates and macros

## Lecture 38: CTE Common table expression
- Break complex queries into simple queries
```sql
  with <name of the result set> (column names)
  as (cte_query)
  <reference the cte>

  with raw_listings as (select * from raw.listings)
  select id as listing_id, name as listing_name, url from raw_listings
```

## Lecture 39: Creating first model, Airbnb listings
- write the CTE in Snowflake first
- Create src folder within models folder
- Create src_listings.sql with CTE expression
- dbt run (from dbtlearn folder)
- Create a view dev.src_listings as Dev is the target schema

## Lecture 42: Materialization overview
- Materialization (how models are stored and managed in the db) types
  - View
  - Table
  - Incremental
  - Ephemeral

## Lecture 43: Model dependencies and ref tag
- Create a new folder dim under models
- Create file dim_listings_cleansed.sql
- jinga is template engine for Python

## Lecture 44: Table type and project level config
- dbt_project.yml: defines default materialization
- dim: materialized: table

## Lecture 45: Incremental materialization
- After made the changes use dbt run
- dbt run --full-refresh

## Lecture 46: Ephemeral materiaization
- Change the dbt_project.yml and make src level as ephemeral
- target folder has the raw sql which can be used for debugging purpose

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:
