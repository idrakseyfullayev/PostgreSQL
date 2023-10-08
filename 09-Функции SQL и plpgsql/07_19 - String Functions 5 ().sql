SELECT SPLIT_PART('2017-12-31','-', 1);
SELECT SPLIT_PART('2017-12-31','-', 2);
SELECT SPLIT_PART('2017-12-31','-', 3);
SELECT SPLIT_PART('Idrak', 'r', 1);
SELECT SPLIT_PART('Idrak', 'r', 2);
SELECT SPLIT_PART('Idrak', 'r', 3);
SELECT SPLIT_PART('Idrak', 't', 1);
SELECT SPLIT_PART('Idrak', 't', 2);
SELECT SPLIT_PART('Idrak', 't', 3);

SELECT product_name FROM products;
SELECT SPLIT_PART(product_name, 'h', 1) FROM products;
SELECT SPLIT_PART(product_name, 'h', 2) FROM products;
