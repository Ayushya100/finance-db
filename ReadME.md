# About Finance Tracker DB
This folder contains the **database schema, views, stored procedures, triggers, and default data** required for the application. The database is **independent of any microservice** and serves as a shared resource.
## Overview
- All SQL scripts, including **schemas, views, stored procedures, and frequent queries**, are maintained here.
- **Knex.js** and **Drizzle ORM** is used for query building in microservices.
- The database repository runs **only when needed**, such as during a schema update.
## Documentation
- **DB Model Documentation:** [Finance Tracker DB Model](https://app.eraser.io/workspace/zBSna17oY9NoSl0HFqjh?origin=share)