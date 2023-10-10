SELECT TRUNC(12.3); -- Truncate a numeric value to a whole number of the specified 
																-- decimal places
SELECT trunc(42.8);

SELECT 	trunc(42.4382, 3); -- truncate to decimal places
SELECT 	trunc(42.4382, 4);
SELECT 	trunc(42.4382, 6);

SELECT width_bucket(5.35, 0.024, 10.06, 5); -- width_bucket(operand dp, b1 dp, b2 dp,
                                                                         --count int)
											-- return the bucket number to which 
											-- operand would be assigned in a 
											-- histogram having count equal-width 
											-- buckets spanning the range b1 to b2; 
											-- returns 0 or count+1 for an input 
											-- outside the range
											
SELECT width_bucket(now(), array['yesterday', 'today', 'tomorrow']::timestamptz[]);
											-- return the bucket number to which 
											-- operand would be assigned given an 
											-- array listing the lower bounds of 
											-- the buckets; returns 0 for an input
											-- less than the first lower bound; 
											-- the thresholds array must be sorted,
											-- smallest first, or unexpected results
											-- will be obtained


SELECT acos(1); -- inverse cosine
SELECT asin(1); -- inverse sine
SELECT atan(1); -- 	inverse tangent
SELECT atan2(1, 2); -- inverse tangent of y/x
SELECT cos(1); -- cosine
SELECT cot(1); -- cotangent 
SELECT sin(1); -- 	sine
SELECT tan(1); -- tangent

SELECT POWER(sin(1), 2) + POWER(cos(1), 2);

