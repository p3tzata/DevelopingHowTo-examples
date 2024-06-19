use performance_demo;

begin;
CALL doLoadOrders();
commit;

begin;
CALL doLoadWarehouse();
commit;