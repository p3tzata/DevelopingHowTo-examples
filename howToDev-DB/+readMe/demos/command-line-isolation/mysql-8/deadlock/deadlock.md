# Depends:

- mocks

# See

# Action

### Manual test - simulate deadlock

- trigger

| A_TX (REPEATABLE-READ)                                                 | B_TX (REPEATABLE-READ)                                                 |
|------------------------------------------------------------------------|------------------------------------------------------------------------|
| begin;                                                                 | begin;                                                                 |                                            
|                                                                        |                                                                        |
| update orders_with_index SET order_code='order100_A_TX' where id=100;  |                                                                        |
|                                                                        |                                                                        |
|                                                                        |                                                                        | 
|                                                                        | update orders_with_index  SET order_code='order200_B_TX' where id=200; | 
|                                                                        |                                                                        |
|                                                                        |                                                                        |
| update orders_with_index  SET order_code='order200_A_TX' where id=200; |                                                                        |
| (LOCK_WAIT)                                                            |                                                                        |
|                                                                        |                                                                        |
|                                                                        | update orders_with_index SET order_code='order100_B_TX' where id=100;  |
|                                                                        | (ERROR 1213 (40001): Deadlock found when trying to get lock;           |
|                                                                        | try restarting transaction)                                            |     
|                                                                        |                                                                        |
| commit;                                                                |                                                                        |
|                                                                        | commit;                                                                |

- observe
  - error `ERROR 1213 (40001): Deadlock found when trying to get lock;`
    - B_TX is dropped;
  - after both commits `select * from orders_with_index;`
      - order_code is order100_A_TX, order200_A_TX

# Help

- DB - `/usr/local/mysql/bin/mysql -h 127.0.0.1 -P 3007 -u root -p command_line_isolation`
- observe transactions - `SELECT trx_state, trx_isolation_level FROM information_schema.innodb_trx;`
- observe locks - ` SELECT OBJECT_SCHEMA, OBJECT_NAME, LOCK_Type, LOCK_MODE, LOCK_DATA  FROM performance_schema.data_locks t`