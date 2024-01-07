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

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:

## Lecture 28:
