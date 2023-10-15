SELECT date '2001-09-28' + 7; -- Add a number of days to a date

SELECT date '2001-09-28' + interval '1 hour'; --  Add an interval to a date

SELECT date '2001-09-28' + current_time;

SELECT date '2001-09-28' + time '03:00'; -- Add a time-of-day to a date

SELECT interval '1 day' + interval '1 hour'; -- Add intervals

SELECT timestamp '2001-09-28 01:00' + interval '23 hours'; -- Add an interval to a timestamp

SELECT time '01:00' + interval '3 hours'; -- Add an interval to a time

SELECT - interval '23 hours'; -- Negate an interval

SELECT date '2001-10-01' - date '2001-09-28'; -- Subtract dates, producing the number of days elapsed

SELECT date '2001-10-01' - 7; -- Subtract a number of days from a date

SELECT date '2001-09-28' - interval '1 hour'; -- Subtract an interval from a date

SELECT time '05:00' - time '03:00'; -- Subtract times

SELECT time '05:00' - interval '2 hours'; -- Subtract an interval from a timestamp

SELECT interval '1 day' - interval '1 hour'; -- Subtract intervals

SELECT timestamp '2001-09-29 03:00' - timestamp '2001-07-27 12:00'; --  Subtract timestamps (converting 24-hour intervals into days, similarly to justify_hours())

SELECT interval '1 second' * 900; -- Multiply an interval by a scalar

SELECT interval '1 day' * 21;

SELECT interval '1 hour' * 3.5; 

SELECT interval '1 hour' / 1.5; -- Divide an interval by a scalar










