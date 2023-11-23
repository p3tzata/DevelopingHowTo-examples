# Depends:

- mocks

# See

```
Ask yourself the following question if you have to use serializable: 
Would it be bad if someone were to INSERT a new row into your data while your transaction is running? Would this interfere with your results in an unacceptable way? If so, use the SERIALIZABLE level.
(https://stackoverflow.com/a/8302879)
```

# Action

### Manual test - locking

- trigger:
    - A_TX - `SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;SELECT @@transaction_ISOLATION;`
    - B_TX - `SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;SELECT @@transaction_ISOLATION;`

| A_TX (serializable)   | B_TX (read commited)                                                       |
|-----------------------|----------------------------------------------------------------------------|
| begin;                | begin;                                                                     |
| select * from orders; |                                                                            |
|                       | insert into orders(99, 'order99'); # trx_state: LOCK WAIT                  |
|                       | ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting transaction |
| commit; #release lock |                                                                            |

- observe:
    - `SELECT trx_state, trx_isolation_level  FROM information_schema.innodb_trx;`
        - see status `LOCK WAIT` for B_TX (read commited)

# Help

- DB - `/usr/local/mysql/bin/mysql -h 127.0.0.1 -P 3007 -u root -p command-line-isolation`
