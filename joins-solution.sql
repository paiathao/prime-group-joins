-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

-- 2. Get all orders and their line items.
SELECT * FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id;

-- 3. Which warehouses have cheetos?
SELECT "warehouse"."warehouse", "products"."description" FROM "products"
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products"."description" = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse", "products"."description" FROM "products"
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products"."description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", count ("orders"."id")FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "addresses".id = "orders".address_id
GROUP BY "customers"."first_name";

-- 6. How many customers do we have?
SELECT count(*) AS "customers_total" FROM "customers";

-- 7. How many products do we carry?
SELECT count(*) AS "products_total" FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT sum("quantity") AS "pepsi_quatity" FROM "line_items"
LEFT JOIN "products" ON "line_items"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi';