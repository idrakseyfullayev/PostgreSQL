SELECT overlay('Txxxxas' placing 'hom' from 2 for 4); -- Replace substring

SELECT substring('Thomas' from 2 for 3); -- Extract substring

SELECT substring('Thomas' from '...$'); -- Extract substring matching POSIX regular expression. See Section 9.7 for more information on pattern matching.
SELECT substring('Thomas' from '.$');
SELECT substring('Thomas' from '.....$');

SELECT 	substring('Thomas' from '%#"o_a#"_' for '#'); -- Extract substring matching SQL regular expression. See Section 9.7 for more information on pattern matching.

SELECT REVERSE(SUBSTRING('IDRAK', 3, 3));

SELECT btrim('xyxtrimyyx', 'xy'); -- Remove the longest string consisting only of characters in characters (a space by default) from the start and end of string

SELECT concat('abcde', 2, NULL, 22); --	Concatenate all arguments. NULL arguments are ignored.
SELECT concat_ws(',', 'abcde', 2, NULL, 22); -- Concatenate all but first arguments with separators. The first parameter is used as a separator. NULL arguments are ignored.

SELECT quote_ident('Foo bar'); -- Return the given string suitably quoted to be used as an identifier in an SQL statement string. Quotes are added only if necessary (i.e., if the string contains non-identifier characters or would be case-folded). Embedded quot
SELECT quote_literal(E'O\'Reilly'); -- Return the given string suitably quoted to be used as a string literal in an SQL statement string. Embedded single-quotes and backslashes are properly doubled. Note that quote_literal returns null on null input; if the argument might be null, quote_nullable is often more suitable. See also Example 39-1.
SELECT quote_literal(42.5); -- Coerce the given value to text and then quote it as a literal. Embedded single-quotes and backslashes are properly doubled.
SELECT quote_nullable(NULL); -- Return the given string suitably quoted to be used as a string literal in an SQL statement string; or, if the argument is null, return NULL. Embedded single-quotes and backslashes are properly doubled. See also Example 39-1.
SELECT quote_nullable(42.5); -- Coerce the given value to text and then quote it as a literal; or, if the argument is null, return NULL. Embedded single-quotes and backslashes are properly doubled.

SELECT translate('12345', '143', 'axb'); -- Any character in string that matches a character in the from set is replaced by the corresponding character in the to set. If from is longer than to, occurrences of the extra characters in from are removed.
SELECT translate('12345', '123', 'ax');
