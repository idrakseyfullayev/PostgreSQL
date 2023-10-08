SELECT REGEXP_MATCHES('ABC', '^(A)(..)$', 'g');

SELECT 
    REGEXP_MATCHES('Learning #Geeksforgeeks #geekPower', 
         '#([A-Za-z0-9_]+)', 
        'g');

SELECT REGEXP_REPLACE('John Doe', '(.*) (.*)', '\2, \1');

SELECT REPEAT('*', 5);

SELECT REPLACE('ABC', 'B', 'A');
SELECT REPLACE('Azerbaycan', 'baycan', 'i Yurdu');

SELECT product_name FROM products;
SELECT REPLACE(product_name, 'C', 'A') FROM products; 

SELECT REVERSE('ABC');
SELECT REVERSE('Idrak');
SELECT REVERSE('012345');

SELECT product_name FROM products;
SELECT REVERSE(product_name) FROM products;

SELECT RIGHT('ABC', 2);
SELECT RIGHT('ABC', 1);
SELECT RIGHT('Idrak', 4);

SELECT RPAD('ABC', 6, 'xo');
SELECT RPAD('Azer', 7, 'baycan');

SELECT RTRIM('abcxxzx', 'xyz');
