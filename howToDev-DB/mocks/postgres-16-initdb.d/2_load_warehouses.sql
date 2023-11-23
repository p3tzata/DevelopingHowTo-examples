\connect postgres;
--truncate warehouses
do $$
declare
begin
for warehouse in 1..10 loop
	  	for counter_ol in 1..1_000_000 loop
			insert into performance_demo.warehouses (warehouse_name, warehouse_time) values (CONCAT('warehouse', warehouse), timestamp '1800-01-10 20:00:00' +
       random() * (timestamp '1800-01-20 20:00:00' -
                   timestamp '2023-01-10 10:00:00'));
end loop;
end loop;
end; $$