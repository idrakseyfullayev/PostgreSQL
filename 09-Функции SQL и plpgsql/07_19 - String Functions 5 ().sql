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

SELECT STRPOS('high', 'ig');

SELECT SUBSTRING('ABC', 1, 1);
SELECT SUBSTRING('Idrak Seyfullayev', 3, 2);
SELECT SUBSTRING('Seyfullayev', 4, 4);


SELECT SUBSTR('alphabet', 3, 1);
SELECT SUBSTR('alphabet', 3, 2);

SELECT TRIM('ABCCC', 'c');
SELECT TRIM('ABCCC', 'C');
SELECT TRIM('ABCCC', 'A');
SELECT TRIM('ABCCC', 'CA');
SELECT TRIM('ABCCC', 'AC');

SELECT TRIM('x' FROM 'xTomxx');
SELECT TRIM(BOTH 'x' FROM 'xTomxx');

SELECT UPPER('hI tHERE');
SELECT UPPER('hi there');
SELECT UPPER('HI THERE');
