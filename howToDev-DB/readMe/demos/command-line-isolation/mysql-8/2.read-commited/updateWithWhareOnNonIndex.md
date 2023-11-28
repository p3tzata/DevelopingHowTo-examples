# Depends:

- mocks

# See

# Action

### Manual test - update with where on non indexed column

- trigger:
    - A_TX - `SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;SELECT @@transaction_ISOLATION;`
    - B_TX - `SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;SELECT @@transaction_ISOLATION;`

| A_TX (READ COMMITTED)                                       | B_TX (READ COMMITTED)                                      |
|-------------------------------------------------------------|------------------------------------------------------------|
| begin;                                                      | begin;                                                     |                                            
|                                                             |                                                            |
| update orders SET order_code='order100_A_TX' where id=100;  |                                                            |
|                                                             |                                                            |
|                                                             |                                                            | 
|                                                             | update orders SET order_code='order200_B_TX' where id=200; | 
|                                                             |                                                            |
| commit;                                                     | commit;                                                    |

- observe
  - after both commits `select * from orders;`
   - order_code is order100_A_TX, order200_B_TX 


# Help

- DB - `/usr/local/mysql/bin/mysql -h 127.0.0.1 -P 3007 -u root -p command_line_isolation`
- observe transactions - `SELECT trx_state, trx_isolation_level FROM information_schema.innodb_trx;`
