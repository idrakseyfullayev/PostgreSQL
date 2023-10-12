SELECT REGEXP_MATCHES('ABC', '^(A)(..)$', 'g'); -- Match a POSIX regular expression against a string and returns the matching substrings

SELECT 
    REGEXP_MATCHES('Learning #Geeksforgeeks #geekPower', 
         '#([A-Za-z0-9_]+)', 
        'g');

SELECT REGEXP_REPLACE('John Doe', '(.*) (.*)', '\2, \1'); -- Replace substrings that match a POSIX regular expression by a new substring

SELECT REPEAT('*', 5); -- 	Repeat string the specified number of times

SELECT REPLACE('ABC', 'B', 'A'); -- Replace all occurrences in a string of substring from with substring to
SELECT REPLACE('Azerbaycan', 'baycan', 'i Yurdu');

SELECT product_name FROM products;
SELECT REPLACE(product_name, 'C', 'A') FROM products; 

SELECT REVERSE('ABC'); -- 	Return reversed string.
SELECT REVERSE('Idrak');
SELECT REVERSE('012345');

SELECT product_name FROM products;
SELECT REVERSE(product_name) FROM products;

SELECT RIGHT('ABC', 2); -- Return last n characters in the string. When n is negative, return all but first |n| characters.
SELECT RIGHT('ABC', 1);
SELECT RIGHT('Idrak', 4);

SELECT RPAD('ABC', 6, 'xo'); -- Pad on the right of a string with a character to a certain length
SELECT RPAD('Azer', 7, 'baycan');

SELECT RTRIM('abcxxzx', 'xyz'); -- Remove the longest string that contains specified characters from the right of the input string
