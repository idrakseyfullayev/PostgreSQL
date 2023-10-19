SELECT to_char(timestamp '2002-04-20 17:31:12.66', 'HH12:MI:SS'); -- Converts time stamp to string according to the given format.

SELECT to_char(interval '15h 2m 12s', 'HH24:MI:SS'); -- Converts interval to string according to the given format.

SELECT to_char(125, '999'); -- Converts number to string according to the given format; available for integer, bigint, numeric, real, double precision

SELECT 125::text;

SELECT to_char(125.8::real, '999D9');

SELECT to_char(-125.8, '999D99S');

SELECT TO_CHAR(CURRENT_DATE, 'YYYY');

SELECT TO_CHAR(CURRENT_TIMESTAMP, 'YYYY -MM -DD');

SELECT TO_CHAR(NOW(), 'YYYY -MM -DD / HH24:MI');


SELECT customer_id, order_date, TO_CHAR(order_date, 'YYYY') 
FROM ORDERS
ORDER BY customer_id;

SELECT customer_id, order_date, TO_CHAR(order_date, 'MON-DD-YYYY') 
FROM ORDERS
ORDER BY customer_id;

SELECT product_id, product_name, unit_price, TO_CHAR(unit_price, '$999999') 
FROM products
ORDER BY product_id;

SELECT
    TO_CHAR(
        2017,
        '9,999'
    );

SELECT contact_name 
	|| ' paid ' || 
	TO_CHAR(unit_price, '999999 $') 
	|| ' at ' ||
	TO_CHAR(order_date, 'DD')
	|| ' on ' ||
	TO_CHAR(order_date, 'Mon-YYYY')
from customers
JOIN orders USING(customer_id)
JOIN order_details USING(order_id)
ORDER BY contact_name;

SELECT to_date('05 Dec 2000', 'DD Mon YYYY'); -- Converts string to date according to the given format.

SELECT TO_DATE('20170103','YYYYMMDD');
SELECT TO_DATE('20170103','YYYY Mon DD'); -- gives an error

SELECT TO_DATE('2017 Feb 20','YYYY Mon DD');
SELECT TO_DATE('2017/02/30', 'YYYY/MM/DD'); -- gives an error

SELECT to_number('12,454.8-', '99G999D9S'); -- Converts string to numeric according to the given format.

SELECT to_timestamp('05 Dec 2000', 'DD Mon YYYY'); -- Converts string to time stamp according to the given format. (See also to_timestamp(double precision) in Table 9.33.)

SELECT TO_TIMESTAMP(
    '2017-03-31 9:30:20',
    'YYYY-MM-DD HH:MI:SS'
);

SELECT TO_TIMESTAMP('2017     Aug','YYYY MON');

SELECT TO_TIMESTAMP('2017     Aug','FXYYYY MON'); -- gives an error

SELECT TO_TIMESTAMP('2017-02-31 30:8:00', 'YYYY-MM-DD HH24:MI:SS'); -- gives an error




