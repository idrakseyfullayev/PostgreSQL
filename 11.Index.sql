
CREATE TABLE perf_test
(
	id int,
	reason text COLLATE "C",
	annotation text COLLATE "C"
);

INSERT INTO perf_test(id, reason, annotation)
SELECT s.id, md5(random()::text), null
FROM generate_series(1, 10000000) AS s(id)
ORDER BY random();

UPDATE perf_test
SET annotation = UPPER(md5(random()::text));


SELECT * FROM perf_test
LIMIT 10;

SELECT * 
FROM perf_test
WHERE id = 3700000;

EXPLAIN
SELECT * 
FROM perf_test
WHERE id = 3700000;

CREATE INDEX idx_per_test_id ON perf_test(id);

EXPLAIN
SELECT * 
FROM perf_test
WHERE id = 3700000;

SELECT * 
FROM perf_test
WHERE id = 3700000;

**********************************************************************************

SELECT * 
FROM perf_test
WHERE reason like 'bc%' AND annotation LIKE 'AB%';

EXPLAIN
SELECT * 
FROM perf_test
WHERE reason like 'bc%' AND annotation LIKE 'AB%';

EXPLAIN ANALYZE
SELECT * 
FROM perf_test
WHERE reason like 'bc%' AND annotation LIKE 'AB%';

-- ANALYZE perf_test;

