use performance_demo;

drop procedure if exists doLoadWarehouse;
drop procedure if exists doLoadOrders;

DELIMITER //
CREATE PROCEDURE doLoadOrders()
BEGIN
DECLARE order_id INT DEFAULT 1;
DECLARE order_line_id INT DEFAULT 1;
DECLARE i INT DEFAULT 1;
WHILE (order_id <= 10000) DO

   INSERT INTO `orders` (order_id_pk, order_code) values (order_id, concat('order', order_id));
   SET i=1;
   WHILE (i <= 3) DO
    INSERT INTO `order_lines` (order_line_id_pk, order_id_fk, order_qtty) values (order_line_id, order_id, 56 );
    SET order_line_id = order_line_id+1;
    SET i=i+1;
END WHILE;
   SET order_id = order_id+1;
END WHILE;
END;
//

DELIMITER //
CREATE PROCEDURE doLoadWarehouse()
BEGIN
DECLARE warehouse INT DEFAULT 1;
DECLARE i INT DEFAULT 1;

WHILE (warehouse <= 10) DO

   SET i = 1;

    WHILE (i <= 100000) DO
        INSERT INTO `warehouses` (warehouse_name, warehouse_time) values (CONCAT('warehouse',warehouse),
        from_unixtime(unix_timestamp('2000-1-1') + floor(rand() * (unix_timestamp('2000-12-31') - unix_timestamp('2023-1-1') + 1))));
        SET i = i+1;

END WHILE;


   SET warehouse = warehouse+1;

END WHILE;
END;
//
