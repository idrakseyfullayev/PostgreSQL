SELECT SPLIT_PART('2017-12-31','-', 1); -- Split a string on a specified delimiter and return nth substring
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

SELECT STRPOS('high', 'ig'); -- Location of specified substring (same as position(substring in string), but note the reversed argument order)

SELECT SUBSTRING('ABC', 1, 1); -- Extract a substring from a string
SELECT SUBSTRING('Idrak Seyfullayev', 3, 2);
SELECT SUBSTRING('Seyfullayev', 4, 4);


SELECT SUBSTR('alphabet', 3, 1); -- Extract substring (same as substring(string from from for count))
SELECT SUBSTR('alphabet', 3, 2);

SELECT TRIM('ABCCC', 'c'); -- Remove the longest string that contains specified characters from the left, right or both of the input string
SELECT TRIM('ABCCC', 'C');
SELECT TRIM('ABCCC', 'A');
SELECT TRIM('ABCCC', 'CA');
SELECT TRIM('ABCCC', 'AC');

SELECT TRIM('x' FROM 'xTomxx');
SELECT TRIM(BOTH 'x' FROM 'xTomxx'); -- Remove the longest string containing only the characters (a space by default) from the start/end/both ends of the string

SELECT UPPER('hI tHERE'); -- Convert a string to uppercase
SELECT UPPER('hi there');
SELECT UPPER('HI THERE');
