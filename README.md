# The Complete dbt (Data Build Tool) Bootcamp: Zero to Hero

## Github repo
- https://github.com/nordquant/complete-dbt-bootcamp-zero-to-hero
- Practice exam: https://www.qanalabs.com/courses/dbt-developer

## Lecture 4: Maslow's pyramid of data
- Data collection: Capture relevant data
- Data Wrangling: Clean and transform, mapping
- Data integration: Load into DWH
- BI and Analytics
- Artificial Intelligence

## Lecture 5: The Data maturity model
- Data collection: Variety, velocity and volume
- Data duplication, cleansing, missing zip code, 
  - Tranform from operational format to DWH format
- Data Integration
  - Staging area to Analytics area
    -  Full or incremental

## Lecture 6: ETL vs ELT
- Storage and computing was expensive so the transform happened outside DWH
- Extract and load are done by Fivetran and Stitch, Transform is done by DBT

## Lecture 7: Datawarehouse
- Database optimized for read operations, analytics workload using SQL
- Helps with dimensions, facts and denormalization
- On premise: Oracle, IBM, Teradata
- Cloud: Snowflake, Redshift, Bigquery

## Lecture 8: External tables and Cloud DWH
- Amazon S3

## Lecture 9: Data Lakes
- On prem: HDFS
- Cloud: S3, Azure Datalakes

## Lecture 10: Data Lakehouse
- 

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

## Lecture 12: The Basics of SCD
- Data that changes infrequently and unpredictably
- SCD Type 0
  - Not updating the DWH table when a dimension change (e.g. fax data)
- SCD Type 1
  - Updating the DWH table when a dimension changes, overwriting the original value (e.g. air condition)
- SCD Type 2
  - Keeping full history, adding additional (historic data) rows for each dimension change (e.g. price)
- SCD Type 3
  - Keeping limited data history - adding separate columns for original and current value (e.g. previous state and current state of flat type)

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

## Lecture 47: Seeds and cources
- Differnce between sources and seeds
- Understand source freshness
- Integrate source into our project

## Lecture 48: Seeds and sources overview
- Seeds are local files that you upload to the DWH from dbt
- Sources is an abstract layer on the top of input tables
- Source freshness can be checked automatically

## Lecture 49: Seeds
- Update the seeds folder with the full moon data file
- dbt seed
- Create mart folder

## Lecture 50:
- sources.yml are defined within models forlder
- change src_listing.sql with src abstraction {{ 'airbnb', listings}}
- dbt compile

## Lecture 51: Source freshness
- Change the sources.yml file and add freshness condition
- dbt source freshness

## Lecture 52: Snapshots
- How dbt handles type-2 slowly changing dimensions
- Understand snapshot strategies
- Create snapshots on top of listings and hpsts models

## Lecture 53: Snapshot overview
- Someone changes email id
- dbt_valid_from and dbt_valid_to columns are used
- Current version is with dbt_valid_to is null
- Strategies
  - Timestamp: A unique key and an updated_at field is defined on the source model. These columns are used for determining changes
  - Check: Any change in a set of columns (or all columns) will be picked up as an update

## Lecture 54: Creating a snapshot
- dbt snapshot
- dbt create a snapshot table and adds a number of new columns (dbt_scd_id, dbt_updated_at, dbt_valid_from, dbt_valid_to)

## Lecture 55: Tests
- How tests can be defined
- Configure built-in genetic tests
- Create own singular tests

## Lecture 56: Tests overview
- Two types of tests
  - Singular: SQL queries stored in tests which are expected to return an empty resultset
  - Generic: unique, not_null, accepted_value, Relationship
    - Custom generic tests can be defined


## Lecture 57: Generic tests
- schema.yml file under models
- tests, documentation, extra 
- target folder has the SQL statements
```sql
  dbt test
```

## Lecture 58: Singular tests
- New sql file under tests folder
```sql
  dbt test --help
  dbt test --select dim_listings_cleansed
```

## Lecture 59: Macros, custom tests and packages
- How macros are created
- Use macros to implement generic tests
- Find and install third party dbt packages

## Lecture 60: Macros overview
- Macros are ninja templates created in the macros folder
- There are many built-in macros in dbt
- Macros can be used in model definition and tests
- A special macro, tests, can be used for used for implementing generic tests

## Lecture 61: Writing custom generic tests
- dbt test --select dim_listing_cleansed

## Lecture 64: Installing 3rd party packages
- https://hub.getdbt.com/
- Install dbt_utils by including below code in packages.yml file ()
  ```sql
    dbt deps
  ```
- use surrogate_key package to generate primary key
  - fct_reviews.sql
  - dbt_utils.surrogate_key([listing_id, review_date, reviewer_name, review_text])
  - dbt run --full-refresh --select fct_reviews (incremental model fails with dbt run when we have schema change)


## Lecture 65: Documentation objectives
- How to document models
- Documentation generator and server
- Add assets and markdown to the documentation
- Dev vs production documentation serving

## Lecture 66: Documentation overview
- Documentation can be defined in two ways
  - In yaml files
  - In standalone mark down files
- DBT ships with a lightweight documentation server
- overview.md is used for customizing the landing page

## Lecture 67: Writing basic documentation
- description tag in schema.yml is used for documentation
```bash
  dbt docs generate
  dbt docs serve
```
- goes to all .yml files, looks for description tag and generate documentation
- target/catalog.json, index.html

## Lecture 68: Markdown based docs
- create docs.md in models folder
- link with description tag in schema.yml file
- Overview page
  - overview.md in models folder
- new folder assets
  - dbt_project.yml: asset-paths: ["assets]

## Lecture 69: The lineage graph, DAG
- dbt run --help
- dbt run --select src_hosts+

## Lecture 71: Analyses, hooks and exposures
- How to store ad-hoc analytical queries in dbt
- work with dbt hooks to manage table permissions
- Build a dahboard in Preset
- DBT exposure to document the dashboard

## Lecture 72: Analyses
- Run sql command without creating model
- dbt compile

## Lecture 73: Hooks
- Hooks are SQLs that are executed at predefined times
- Hooks can be configured on the project, subfolder or model level
- Hook types
  - on_run_start
  - on_run_end
  - pre-hook
  - post-hook
- hooks setting on dbt_project.yml file

## Lecture 74: Setting up BI dashboard in Snowflake and Preset
- preset.io
- Sign up using email
- Login -> Data - Databases - Create new
- Database name, User name, Password, Account, Warehouse, role
- Create dataset - database, schema, see table schema
- Chart - select dataset - bar chart
- Save
- Create dashboard - add the chart - Save

## Lecture 76: Exposure
- Create dashboards.yml in model folder
- dbt docs generate
- Can view as lineage graph in dbt

## Lecture 80: Great Expectations overview
- dbt-expectations
  - Install in packages.yml
  - dbt deps
- marts, facts and dimensions are important tables

## Lecture 81: Comparing row countes between models
- schema.yml
- dim_listings_w_hosts

## Lecture 82: Looking for outliers
- 

## Lecture 83: Test warnings
- Price more than 5000
- We can warn instead of error

## Lecture 84: Validating column types

## Lecture 85: Monitor categorical variabls in the source data
- sources.yml
```sql
  dbt test --select source:airbnb.listings
```

## Lecture 85: Debugging test
```sql
  dbt --debug test --select source:airbnb.listings
```
- Get the sql from target folder

## Lecture 93: DBT best practices
- Data engineering and data governance team
- Data Platform that collects and Integrates data with 20 source systems
- Referred as Business development data platform
  - Data is used to build product and services
  - It's not a reporting platform
  - Train machine learning models
- Data steward
  - Bridge function between business and engineering
  - Access data, understands and trusts data sets we build
  - Artefacts: data glossary, data catalogue, process to measure and improve data quality
- Important part
  - Modular feature to build models
  - Business logic is broken down into small chunks so easy to write tests
  - Dependency between models is taken care of
  - Lineage and documentation are first-class citizen
  - Put into a container and use CI/CD pipeline
  - Advice
    - Position as an Experiment
    
