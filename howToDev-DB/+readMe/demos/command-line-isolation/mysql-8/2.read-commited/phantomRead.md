# Depends:

- mocks

# See

```
You will never found phantoms on InnoDB mysql with read commited or more restricted isolation level. It is explained on documentation:
(https://stackoverflow.com/a/8302879)
```

# Action

### Manual test -

- trigger:
    - `SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;`
    - `SELECT @@transaction_ISOLATION;`

| A_TX (read commited)                     | B_TX (read commited)                     |
|------------------------------------------|------------------------------------------|
| begin;                                   | begin;                                   |
|                                          | select * from orders;                    |
| insert into orders values (9, 'order9'); |                                          |
| commit;                                  |                                          |
|                                          | select * from orders; # Seeing 'order9'  |

- observe:
    - `SELECT trx_state, trx_isolation_level  FROM information_schema.innodb_trx;`
    - you will see in second `select * from orders;` order9 even we are in read commited

# Help

- DB - `/usr/local/mysql/bin/mysql -h 127.0.0.1 -P 3007 -u root -p command_line_isolation`
