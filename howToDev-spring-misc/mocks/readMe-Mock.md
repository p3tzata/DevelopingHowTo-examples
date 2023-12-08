Install local mysql and postgres for needs of export/dump DBs.


### Postgres - export and import for mock.
1. Install PostgresSQL, download here: https://www.postgresql.org/download/macosx/
2. on DBeaver: Local Client -> Choose /Library/PostgreSQL/XX/bin
3. Export with DBeaver
   - right click on schema demo -> Tools -> Backup -> select all without public schemas.
   - click next and:
     - check `format: plain`
     - check `Use sql INSERT...`
4. Add on top of sql dump file - `\connect postgres;`
5. Add load files like `2_load_orders.sql`
6. Place sql dump file in `mocks/postgres-16-initdb.d/`

### Postgres - insert demo data

### Mysql - export and import for mock.
1. In case we add new database, add it in `1_index.sql`
2. Make separated dump file for single database, like `2_mysql-dump-command_line_isolation.sql`
    - in any separated dump file add use {database} like `use command_line_isolation;`
3. Add load procedures in `3_create_load_procedures.sql`
4. Call load procedures in `4_call_load_procedures.sql`
5. Place all separated dump file and 1_index.sql in `mocks/mysql-8-initdb.d`


