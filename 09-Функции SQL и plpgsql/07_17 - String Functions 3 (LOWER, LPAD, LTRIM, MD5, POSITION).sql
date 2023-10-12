SELECT LOWER('hI tHeRe'); -- Convert a string to lowercase
SELECT LOWER('HI THERE');
SELECT LOWER('TOM');

SELECT LPAD('7235', 8, '20'); -- Pad on the left a a string with a character to a certain length

SELECT LTRIM('00123', '001'); -- Remove the longest string that contains specified characters from the left of the input string

SELECT MD5('ABC'); -- Return MD5 hash of a string in hexadecimal

SELECT POSITION('Tutorial' IN 'GeeksForGeeks Tutorial'); -- Return the location of a substring in a string
SELECT POSITION('B' in 'A B C')
SELECT POSITION('ak' IN 'Idrak')
