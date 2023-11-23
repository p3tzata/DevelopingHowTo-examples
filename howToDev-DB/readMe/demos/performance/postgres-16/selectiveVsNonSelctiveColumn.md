# Composite index - which column should be first - more or less selective or no matter. 

### Depends:
- mocks
- Be sure for big difference in distinct between these two column
`select attname, n_distinct from pg_stats where tablename='warehouses'` -1 means the most distinct

### Manual test - where w.warehouse_name ='warehouse2' аnd w.warehouse_time = '1909-05-26 16:46:08.711'. 

- trigger:  
```sql
explain (analyse)
select w.warehouse_name , w.warehouse_time  from warehouses w where 
w.warehouse_name ='warehouse2' and w.warehouse_time = '1909-05-26 16:46:08.711'
```
- observe: 
  - `actual time`
    - Only With `CREATE INDEX warehouses_name_time_idx ON performance_demo.warehouses USING btree (warehouse_name, warehouse_time);`
    - Only With `CREATE INDEX warehouses_time_name_idx ON performance_demo.warehouses USING btree (warehouse_time, warehouse_name);`

### Manual test - where w.warehouse_name ='warehouse2' аnd w.warehouse_time = '1909-05-26 16:46:08.711'.

- trigger:
```sql
explain (analyse)
select w.warehouse_name , w.warehouse_time  from warehouses w where 
w.warehouse_name ='warehouse2' and w.warehouse_time > '1909-05-26 16:46:08.711'
```
- observe:
    - `actual time`
        - Only With `CREATE INDEX warehouses_name_time_idx ON performance_demo.warehouses USING btree (warehouse_name, warehouse_time);`
        - Only With `CREATE INDEX warehouses_time_name_idx ON performance_demo.warehouses USING btree (warehouse_time, warehouse_name);`


# CONCLUSION:
 - warehouses_time_name_idx slide better in `w.warehouse_name ='warehouse2' and w.warehouse_time = '1909-05-26 16:46:08.711'`
 - warehouses_time_name_idx much better in  `w.warehouse_name ='warehouse2' and w.warehouse_time > '1909-05-26 16:46:08.711'`   

# Help


```sql
CREATE INDEX warehouses_name_time_idx ON performance_demo.warehouses USING btree (warehouse_name, warehouse_time);
CREATE INDEX warehouses_time_name_idx ON performance_demo.warehouses USING btree (warehouse_time, warehouse_name);
drop index warehouses_time_name_idx;
drop index warehouses_name_time_idx;
```
