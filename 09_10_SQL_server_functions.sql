--Server Functions

--String Functions
Select ascii(first_name) from employees; -- prints ascii value for first character of first name of each employee

select '65' as ASCII,char(65) as ASCII_To_CHAR;

select charindex('m','Himanshu') as Index_Of_M; --case insensitive

select concat(first_name,' ',last_name) as Name from employees;
select (first_name+' '+last_name) as Name from employees;
select concat_ws(' ',first_name,last_name) as Name from employees; --first parameter is a delimeter

--in SSMS each character takes 2 bytes if it is declared as Nvarchar
select concat_ws(' ',first_name,last_name) as Name ,datalength(concat_ws(' ',first_name,last_name)) as Size_In_Bytes from employees;

select difference('hi','ui') from employees; --gives how much similarity in the sound of passed parameter result is (0-4) 0 as weak in sound and 4 is extremely strong same sound

DECLARE @de DATETIME = '12/01/2018';  
SELECT FORMAT (@de, 'd', 'en-US') AS 'US English Result',  
       FORMAT (@de, 'd', 'in') AS 'India Result',  
       FORMAT (@de, 'd', 'fr') AS 'France Result';
Select format(10012018,'##-##-####') as DateGiven;

Select Left (first_name,3) as LeftMost3 from employees;
Select Right(first_name,3) as RightMost3 from employees;

SELECT  lower(first_name) as NameInLower from Employees;
SELECT  upper(first_name) as NameInUpper from Employees;

SELECT  ltrim('    Himanshu') as LeftTrim;;
SELECT  rtrim('Himanshu     ') as RightTrim;;
SELECT TRIM('     Himanshu     ') AS TrimmedString;

SELECT  nchar(4) as NumberCodeToUniCode;

SELECT  patindex('__ma%','Himanshu') as MatchedAtIndex;

SELECT QUOTENAME('Himanshu','"'); -- used to write the first parameter withing some quotes

SELECT REPLACE('Himanshu', 'Him', 'Mon'); --Replace Him with Mon

SELECT REPLICATE('Himanshu ',5);

SELECT REVERSE('Himanshu');

SELECT SOUNDEX('Himanshu');

SELECT SPACE(10);

--add spaces in front of string if lenght of first parameter is less than the length specified in 2nd parameter, 3rd parameter is values after decimal
SELECT STR(185,10,2);

--remove 3 characters from index 5 and put HTML at index 5
SELECT STUFF('SQL Tutorial', 5, 3, 'HTML');

--extract 3 characters from index 5
SELECT SUBSTRING('SQL Tutorial', 5, 3) AS ExtractString;

SELECT TRANSLATE('Monday', 'Mon', 'Qun'); --Replace M with Q,o woth u and n with n

SELECT UNICODE('Atlanta'); --Return unicode of first character

--Numeric Functions
SELECT Abs(-243.5) AS AbsNum; --return absolute value

SELECT ACOS(0.25); --return angle in radians works as cos^-1 (input)
SELECT ASIN(0.25); --return angle in radians works as sin^-1 (input)
SELECT ATAN(2.5);  --return angle in radians works as tan^-1 (input)

SELECT AVG(Salary) AS AverageSalary FROM Employees;

SELECT CEILING(25.1) AS CeilValue; --next minimum value that is just greater than the integer part
SELECT FLOOR(25.75) AS FloorValue; --next minimum value that is just smaller than the integer part

SELECT Count(*) FROM EMPLOYEES;

SELECT COS(2); --gives value of cos(angle in radian)
SELECT SIN(2); --gives value of sin(angle in radian)
SELECT TAN(2); --gives value of tan(angle in radian)

SELECT DEGREES(1.5); --convert radian to degrees
SELECT RADIANS(180); --convert degree to radian

SELECT EXP(1); --return e^input in exp(input)

SELECT LOG(2,2); --return log value 1st paramter is value and 2nd is base
Select log(2);  --return natural log value
select log10(10); --return log base 10 of input

SELECT max(salary) from employees;
SELECT min(salary) from employees;

Select pi(); --return value of pi

SELECT power(3,4); --3 raise to power 4

select rand(); --parameter is optional

SELECT ROUND(235.415,2) AS RoundValue; --second parameter is upto how many digits we want to round off

SELECT SIGN(255.5); --return 1 if input>0, -1 if input<0 , 0 if input==0

SELECT SQRT(64);
SELECT SQUARE(5);

SELECT sum(salary) from employees;

-- DATE functions
Select current_timestamp;
SELECT GETDATE(); --current database date and time

SELECT DATEADD(year, 1, '2019/08/25') AS DateAdd; --add 1 year to provided date
SELECT DATEDIFF(year, '2006/08/25', '2011/08/25') AS DateDiff; --return diff between given dates 3rd parameter - 2nd parameter

SELECT DATEFROMPARTS(2018, 10, 31) AS DateFromParts; --return date from parts
SELECT DATEPART(month, '2017/08/25') AS DatePartInt; --return 1st parameter from given date

--return the value based on 1st parameter if it is month return month name in provided date else return year/day
SELECT DATENAME(month, '2017/08/25') AS DatePartString; 

SELECT DAY('2017/08/25') AS DayOfMonth; --return day of a month for a date
SELECT MONTH('2017/08/25') AS Month; --return month from date
SELECT YEAR('2017/08/25') AS Year; --return year from given date

SELECT GETDATE(); --current database date and time

SELECT GETUTCDATE(); --current universal time

SELECT ISDATE('2017-08-25'); --check whether provided date is valid or not

SELECT SYSDATETIME() AS SysDateTime; --current system date and time

--ADVANCED Functions
SELECT CAST(25.65 AS int); --convert a datatype into specified data type, here converting decimal to int
SELECT CONVERT(varchar(20), 25.65); --convert a value to specific data type also provide 3rd attribute style 

SELECT COALESCE(NULL, 1, 2, 'Himanshu'); --return first non null value in a list

SELECT CURRENT_USER; --return the name of current database user

SELECT IIF(500<1000, 5, 10); -- return 2nd parameter if 1st parameter yields true else 3rd parameter

SELECT ISNULL(2, 'Himanshu'); --return 1st value of it it is not null else 2nd value

SELECT ISNUMERIC('dsf'); --check whether if input is number or not return 1 or 0 1 if number else 0

SELECT NULLIF('Hello', 'Hello'); -- return null if both expression are true else return first expression

SELECT SESSION_USER; --name of the current user in sql server database

SELECT SYSTEM_USER; --login name information for the current user