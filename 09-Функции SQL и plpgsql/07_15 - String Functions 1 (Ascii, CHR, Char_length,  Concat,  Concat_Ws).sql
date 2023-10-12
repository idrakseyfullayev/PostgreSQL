SELECT ASCII('A'); -- Return the ASCII code value of a character or Unicode code point of a UTF8 character
SELECT ASCII('a');

SELECT CHR(65);
SELECT CHAR_LENGTH('SQL Tutorial') AS LengthOfString;
SELECT CHARACTER_LENGTH('SQL Tutorial') AS LengthOfString;

SELECT CONCAT('SQL ' , 'Tutorial ', ' is ', 'fun!');
SELECT CONCAT_WS(' * ', 'SQL' , 'Tutorial', 'is', 'fun!');
SELECT CONCAT ('Post', 'greSQL')
SELECT CONCAT ('Post', ' ', 'greSQL')
SELECT 'Post' || 'greSQL'
SELECT 'Post' || ' ' || 'greSQL'
