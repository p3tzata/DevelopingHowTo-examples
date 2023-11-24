# Composite index - which column should be first - more or less selective or no matter. 

### Depends:
- mocks
- Be sure for big difference in distinct between these two column
`SELECT * FROM INFORMATION_SCHEMA.STATISTICS WHERE table_name = 'warehouses' AND table_schema = 'performance_demo'`


### Manual test - where w.warehouse_name ='warehouse2' аnd w.warehouse_time = '1909-05-26 16:46:08.711'. 

- trigger: 

- observe: 
  - Only with index `CREATE INDEX warehouses_time_name_IDX USING BTREE ON performance_demo.warehouses (warehouse_time,warehouse_name);`
  - Only with index `CREATE INDEX warehouses_name_time_IDX USING BTREE ON performance_demo.warehouses (warehouse_name,warehouse_time);`


# Help

```sql
CREATE INDEX warehouses_name_time_idx ON performance_demo.warehouses USING btree (warehouse_name, warehouse_time);
CREATE INDEX warehouses_time_name_idx ON performance_demo.warehouses USING btree (warehouse_time, warehouse_name);
ALTER TABLE performance_demo.warehouses DROP INDEX warehouses_time_name_IDX;
ALTER TABLE performance_demo.warehouses DROP INDEX warehouses_name_time_IDX;
```