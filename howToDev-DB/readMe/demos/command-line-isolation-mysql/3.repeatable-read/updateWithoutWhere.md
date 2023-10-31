# Action

### Manual test - A_TX update without where, B_TX try to update some rows

- trigger:
    - A_TX - `SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;SELECT @@transaction_ISOLATION;`
    - B_TX - `SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;SELECT @@transaction_ISOLATION;`

| A_TX (REPEATABLE READ)                  | B_TX (REPEATABLE READ)                                                                       |
|-----------------------------------------|----------------------------------------------------------------------------------------------|
|                                         | select count(1) from orders where order_code='order'; #Make sure count(1)>0                  |
| begin;                                  | begin;                                                                                       |
| update orders SET order_code='orderOK'; |                                                                                              |
|                                         | update orders SET order_code='order9999999' where order_code='order'; # trx_state: LOCK WAIT |
| commit; # updated all rows to 'orderOK' |                                                                                              | 
|                                         | commit; # Query OK, 0 rows affected (0.00 sec)                                               |

- observe:
    - `SELECT trx_state, trx_isolation_level  FROM information_schema.innodb_trx;`
        - see status `LOCK WAIT` for B_TX
        - A_TX update all rows to 'orderOK'
        - B_TX 0 rows updated;

# Help

- DB - `/usr/local/mysql/bin/mysql -h 127.0.0.1 -P 3007 -u root -p command-line-isolation`
    