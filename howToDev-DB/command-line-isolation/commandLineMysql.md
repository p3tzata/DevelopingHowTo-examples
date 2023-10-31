### This command line depends on local installed mysql client(installed on the OS)

Start A-TX

- `/usr/local/mysql/bin/mysql -h 127.0.0.1 -P 3007 -u root -p command-line-isolation`
    - `SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;` - set desire isolation level
    - `SELECT @@transaction_ISOLATION;`
    - `begin;`
    - `...`
    - `commit;`

Start B-TX

- `/usr/local/mysql/bin/mysql -h 127.0.0.1 -P 3007 -u root -p command-line-isolation`
    - like A-TX;

Start monitoring TX

- `/usr/local/mysql/bin/mysql -h 127.0.0.1 -P 3007 -u root -p command-line-isolation`
  - `SELECT trx_state, trx_isolation_level  FROM information_schema.innodb_trx;`

### Help

- setting isolation level must be set before begin statement.