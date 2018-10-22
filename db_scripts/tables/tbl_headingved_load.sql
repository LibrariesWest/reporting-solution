---------------------------------------------------------------
-- table: headingved.  load data
---------------------------------------------------------------

truncate headingved;
copy headingved from 'c:\dbdata\symphony\heading.txt' delimiter '|';