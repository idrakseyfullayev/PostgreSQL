--*IF-THEN-ELSE*--
drop function if exists convert_temp_to;
create or replace function convert_temp_to(temperature real, to_celsius bool DEFAULT true) returns real AS $$
declare
	result_temp real;
begin
	if to_celsius then
		result_temp = (5.0/9.0)*(temperature-32);
	else
		result_temp:=(9*temperature+(32*5))/5.0;
	end if;
	
	return result_temp;
end;
$$ language plpgsql;

select convert_temp_to(80);
select convert_temp_to(26.7, false);

--*IF-ELSIF-ELSE*--

drop function if exists get_season;
create or replace function get_season(month_number int) returns text AS $$
declare
	season text;
begin
	if month_number BETWEEN 3 and 5 then
		season = 'Spring';
	elsif month_number BETWEEN 6 and 8 then
		season = 'Summer';
	elsif month_number BETWEEN 9 and 11 then
		season = 'Autumn';
	else
		season = 'Winter';
	end if;
	
	return season;

end;
$$ language plpgsql;

select get_season(12)

	
CREATE OR REPLACE FUNCTION get_season_100(month_number int) RETURNS text AS $$
DECLARE
	season text;
BEGIN
	IF month_number BETWEEN 1 AND 12 THEN
		IF month_number BETWEEN 3 AND 5 THEN
			season := 'Spring';
		ELSEIF month_number BETWEEN 6 AND 8 THEN
			season := 'Summer';
		ELSIF month_number BETWEEN 9 AND 11 THEN
			season := 'Autumn';	
		ELSE
			season := 'Winter';
		END IF;
		RETURN season;
	ELSE
		RETURN 'your give error number';
	END IF;
END;
$$ LANGUAGE PLPGSQL;

SELECT get_season_100(13);

