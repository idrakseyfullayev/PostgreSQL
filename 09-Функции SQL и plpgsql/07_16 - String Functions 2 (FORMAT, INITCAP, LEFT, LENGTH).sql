SELECT FORMAT('Hello %s %s','PostgreSQL', 12);
SELECT FORMAT('Hello %s, %1$s, %1$s', 'World');
SELECT FORMAT('Hello %s, %1$s, %s, %2$s', 'World', 'sql');

SELECT INITCAP('hI tHERE');
SELECT INITCAP('hi there');
SELECT INITCAP('hI tHeRe');

SELECT LEFT('Salam', 3);

SELECT LENGTH('Salam')
