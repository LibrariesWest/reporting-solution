---------------------------------------------------------------
-- table: requestved.  load data
---------------------------------------------------------------

truncate requestved;
copy requestved from 'c:\dbdata\symphony\requestved.txt' delimiter '|';