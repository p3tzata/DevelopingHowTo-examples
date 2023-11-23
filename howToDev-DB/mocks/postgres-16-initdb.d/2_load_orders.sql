\connect postgres;

--truncate warehouses
do $$
declare
order_line_id_cnt INT;
begin
order_line_id_cnt:=1;
for counter in 1..100_000 loop
	insert into performance_demo.orders (order_id_pk, order_code) values (counter, CONCAT('order', counter));
for counter_ol in 1..5 loop
			insert into performance_demo.order_lines (order_line_id_pk, order_id_fk, order_qtty) values (order_line_id_cnt, counter, 56);
         order_line_id_cnt:=order_line_id_cnt+1;
end loop;
end loop;
end; $$