SELECT overlay('Txxxxas' placing 'hom' from 2 for 4);

SELECT substring('Thomas' from 2 for 3);

SELECT substring('Thomas' from '...$');
SELECT substring('Thomas' from '.$');
SELECT substring('Thomas' from '.....$');

SELECT 	substring('Thomas' from '%#"o_a#"_' for '#');

SELECT REVERSE(SUBSTRING('IDRAK', 3, 3));

SELECT btrim('xyxtrimyyx', 'xy');

SELECT concat('abcde', 2, NULL, 22);
SELECT concat_ws(',', 'abcde', 2, NULL, 22);

SELECT quote_ident('Foo bar');
SELECT quote_literal(E'O\'Reilly');
SELECT quote_literal(42.5);
SELECT quote_nullable(NULL);
SELECT quote_nullable(42.5);

SELECT translate('12345', '143', 'axb');
SELECT translate('12345', '123', 'ax');
