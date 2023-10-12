SELECT ASCII('A'); -- Return the ASCII code value of a character or Unicode code point of a UTF8 character
SELECT ASCII('a');

SELECT CHR(65); -- Convert an ASCII code to a character or a Unicode code point to a UTF8 character
SELECT CHAR_LENGTH('SQL Tutorial') AS LengthOfString; -- Return the length of the string:
SELECT CHARACTER_LENGTH('SQL Tutorial') AS LengthOfString;

SELECT CONCAT('SQL ' , 'Tutorial ', ' is ', 'fun!'); -- Concatenate two or more strings into one
SELECT CONCAT_WS(' * ', 'SQL' , 'Tutorial', 'is', 'fun!'); -- Concatenate strings with a separator
SELECT CONCAT ('Post', 'greSQL');
SELECT CONCAT ('Post', ' ', 'greSQL');
SELECT 'Post' || 'greSQL'; -- Concatenate two or more strings into one
SELECT 'Post' || ' ' || 'greSQL';
