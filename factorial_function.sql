DECLARE @input int = 10, @Factorial bigint = 1

WHILE @input > 0 BEGIN
  SET @Factorial = @Factorial*@input
  SET @input = @input-1
END
SELECT @Factorial AS FACTORIAL




-- functional factorial calculator

create function Factorial(@input int)
returns bigint
as
begin
declare @Factorial int = 1

 while @input > 0
 begin
	  set @Factorial = @Factorial*@input
	  set @input = @input-1
 end
return @Factorial
end

select dbo.Factorial(5);