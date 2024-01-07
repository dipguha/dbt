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

## Lecture 23: 

## Lecture 17: 

## Lecture 17: 

## Lecture 17: 
