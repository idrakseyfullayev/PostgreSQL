SELECT EXTRACT(YEAR FROM TIMESTAMP '2016-12-31 13:30:15'); -- Get timestamp subfield; see Section 9.9.1
SELECT EXTRACT(QUARTER FROM TIMESTAMP '2016-12-31 13:30:15');
SELECT EXTRACT(MONTH FROM TIMESTAMP '2016-12-31 13:30:15');
SELECT EXTRACT(DAY FROM TIMESTAMP '2016-12-31 13:30:15');
SELECT EXTRACT(YEAR FROM INTERVAL '6 years 5 months 4 days 3 hours 2 minutes 1 second' );
SELECT extract(month from interval '2 years 3 months');

SELECT isfinite(date '2001-02-16'); -- 	Check if a date, a timestamp, or an interval is finite or not (not +/-infinity)
SELECT isfinite(timestamp 'infinity'); -- Test for finite timestamp (not +/-infinity)

SELECT justify_days(interval '35 days'); -- Adjust interval so 30-day time periods are represented as months
SELECT justify_hours(interval '27 hours'); -- 	Adjust interval so 24-hour time periods are represented as days
SELECT justify_interval(interval '1 mon -1 hour'); -- Adjust interval using justify_days and justify_hours, with additional sign adjustments

SELECT LOCALTIME;-- Return the time at which the current transaction start
SELECT LOCALTIME(2);
SELECT localtime(0);
SELECT localtimestamp;
SELECT localtimestamp(2);

SELECT make_date(2013, 7, 15);
SELECT make_interval(days => 10);
SELECT make_time(8, 15, 23.5);
SELECT make_timestamp(2013, 7, 15, 8, 15, 23.5);
SELECT make_timestamptz(2013, 7, 15, 8, 15, 23.5);
SELECT make_timestamptz(2013, 7, 15, 8, 15, 23.5, 'America/New_York');

SELECT NOW(); -- Return the date and time with time zone at which the current transaction start
SELECT TIMEZONE();
SELECT NOW():: TIMESTAMP;
SELECT (NOW() +interval '1 hour');
SELECT (NOW() + interval '1 day') AS this_time_tomorrow;
SELECT now() - interval '2 hours 30 minutes' AS two_hour_30_min_go;

SELECT statement_timestamp (); -- Return the current date and time at which the current statement executes

SELECT timeofday(); -- Return the current date and time, like clock_timestamp, as a text string)

SELECT transaction_timestamp(); -- Current date and time (start of current transaction); see Section 9.9.5

SELECT TO_DATE() -- Convert a string to a date
SELECT TO_DATE('20170103','YYYYMMDD');
SELECT TO_DATE(REPLACE(text(CURRENT_DATE), '-', ''),'YYYYMMDD');
SELECT TO_DATE('10 Feb 2017', 'DD Mon YYYY');
SELECT TO_DATE('2017/02/30', 'YYYY/MM/DD'); -- gives an error
SELECT TO_DATE('2017/02/03', 'YYYY/MM/DD');
SELECT TO_DATE('2017/02/*03', 'YYYY/MM/*DD');
SELECT TO_DATE('2017/02/03', 'YYYYMMDD'); -- gives an error
SELECT TO_DATE(REPLACE('2017/02/03', '/', ''), 'YYYYMMDD');
SELECT TO_DATE(REPLACE(REPLACE('2017/02/:03', '/', ''), ':', ''), 'YYYYMMDD');

SELECT TO_TIMESTAMP(
    '2017-03-31 9:30:20',
    'YYYY-MM-DD HH:MI:SS'
); -- Convert a string to a timestamp

SELECT TO_TIMESTAMP('2017     Aug','YYYY MON');
SELECT TO_TIMESTAMP('2017     Aug','FXYYYY MON'); -- gives an error
SELECT TO_TIMESTAMP('2017-02-31 30:8:00', 'YYYY-MM-DD HH24:MI:SS'); -- gives an error
SELECT TO_TIMESTAMP('01-01-2017 10:2', 'DD-MM-YYYY SS:MS');

SELECT (DATE '2001-02-16', DATE '2001-12-21') OVERLAPS
       (DATE '2001-10-30', DATE '2002-10-30');


