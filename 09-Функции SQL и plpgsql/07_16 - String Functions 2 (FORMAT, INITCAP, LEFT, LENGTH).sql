SELECT FORMAT('Hello %s %s','PostgreSQL', 12); -- Format arguments based on a format string
SELECT FORMAT('Hello %s, %1$s, %1$s', 'World');
SELECT FORMAT('Hello %s, %1$s, %s, %2$s', 'World', 'sql');

SELECT INITCAP('hI tHERE'); -- Convert words in a string to title case
SELECT INITCAP('hi there');
SELECT INITCAP('hI tHeRe');

SELECT LEFT('Salam', 3); -- Return the first n character in a string

SELECT LENGTH('Salam'); -- Return the number of characters in a string
