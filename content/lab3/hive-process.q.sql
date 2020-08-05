CREATE EXTERNAL TABLE IF NOT EXISTS orders (
  order_id                   STRING,
  order_item_id              STRING,
  product_id                 STRING,
  seller_id                  STRING,
  shipping_limit_date        DATE,
  price                      DOUBLE,
  freight_value              DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '${INPUT}/order/';

CREATE EXTERNAL TABLE IF NOT EXISTS product (
  product_id                  STRING,
  product_category_name       STRING,
  product_name_lenght         int,
  product_description_lenght  int,
  product_photos_qty          int,
  product_weight_g            int,
  product_length_cm           int,
  product_height_cm           int,
  product_width_cm            int
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '${INPUT}/product/';

CREATE TABLE IF NOT EXISTS category_price_sum_avg AS
SELECT P.product_category_name, SUM(O.price) AS sum_price, AVG(O.price) AS avg_price
FROM orders O
JOIN product P ON (O.product_id = P.product_id)
GROUP BY P.product_category_name
ORDER BY avg_price DESC;

INSERT OVERWRITE DIRECTORY '${OUTPUT}/category_price_sum_avg2'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
SELECT * from category_price_sum_avg;


