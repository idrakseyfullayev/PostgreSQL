SELECT age('2001-04-10', '1957-06-13'); -- 	Calculate ages between two timestamps and returns a “symbolic” result which uses years and months
SELECT AGE('2017-01-01','2011-06-24');

SELECT AGE(timestamp '1987-03-31'); -- Subtract argument from current_date (at midnight)

SELECT order_id, order_date, AGE(order_date)
FROM orders;

SELECT order_id, order_date, AGE(now(), order_date)
FROM orders

SELECT clock_timestamp(); -- Current date and time (changes during statement execution); see Section 9.9.5

SELECT current_date; -- Return the current date

CREATE TABLE delivery(
    delivery_id serial PRIMARY KEY,
    product varchar(255) NOT NULL,
    delivery_date DATE DEFAULT CURRENT_DATE
);

SELECT CURRENT_TIME; -- Return the current time

SELECT CURRENT_TIME(2); -- Current time of day, with limited precision; see Section 9.9.5

SELECT CURRENT_TIMESTAMP; -- Current date and time (start of current transaction); see Section 9.9.5

SELECT current_timestamp(0); -- Return the current date and time with time zone at which the current transaction starts

-- Get a field of a timestamp or an interval e.g., year, month, day, etc. (DOUBLE PRECISION)
SELECT date_part('century',TIMESTAMP '2017-01-01'); -- əsr
SELECT date_part('year',TIMESTAMP '2017-01-01');
SELECT date_part('quarter',TIMESTAMP '2017-06-16'); -- ilin dörddəbiri
SELECT date_part('month',TIMESTAMP '2017-09-30');
SELECT date_part('decade',TIMESTAMP '2017-09-30'); -- onillik
SELECT date_part('week',TIMESTAMP '2017-09-30');
SELECT date_part('millennium',now()); --minillik
SELECT date_part('day',TIMESTAMP '2017-03-18 10:20:30');

SELECT date_part('hour',TIMESTAMP '2017-03-18 10:20:30') h,
       date_part('minute',TIMESTAMP '2017-03-18 10:20:30') m,
       date_part('second',TIMESTAMP '2017-03-18 10:20:30') s;

SELECT date_part('dow',TIMESTAMP '2017-03-18 10:20:30') dow,
       date_part('doy',TIMESTAMP '2017-03-18 10:20:30') doy; -- To extract the day of week and or day of year from a time stamp, you use the following statement:


--Return a timestamp truncated to a specified precision
SELECT DATE_TRUNC('hour', TIMESTAMP '2017-03-17 04:09:30'); -- The following example truncates a TIMESTAMP value to hour date part:
SELECT date_trunc('minute', TIMESTAMP '2017-03-17 02:09:30');

--You  can count the number of rentals by month by using the date_trunc function as follows:
SELECT
    date_trunc('month', order_date) m,
    COUNT (order_id)
FROM
    orders
GROUP BY
    m
ORDER BY
    m;

--Similarly, you can count the number of rentals by staff per year as follows:
SELECT customer_id, DATE_TRUNC('year', order_date) y, COUNT(order_id)
FROM orders
GROUP BY customer_id, y
ORDER BY customer_id

-- Truncate to specified precision in the specified time zone; see Section 9.9.2
SELECT date_trunc('day', timestamptz '2001-02-16 20:38:40+00', 'Australia/Sydney') 

--Truncate to specified precision; see Section 9.9.2
SELECT date_trunc('hour', interval '2 days 3 hours 40 minutes')






