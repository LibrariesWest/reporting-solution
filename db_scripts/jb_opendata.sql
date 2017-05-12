--------------------------------------------------------------------
-- job: open data
-- this set of SQL scripts exports libraries west open data
-- to a set folder.  this is intended to be run on a nightly basis
-- to provide regular extracts which will be published to the 
-- libraries west open data repository.
-- this script assumes a directory on the c drive called opendata
--------------------------------------------------------------------

-- 1.  Users by mutiple deprivation index and authority




-- 2.  Users by ward and authority




-- 3.  Issues by day, by item type, by library




-- 4.  Current transits
-- the current transits export is one that should not overwrite previous data as it is
-- a snapshot of the current situation.  for each time it's run create a datestamped file
copy(select * from vw_transits) to "c:\dbdata\opendata\transits.csv" csv

-- 5.  Bills by month by library by type



-- 6.  Holds by day, by item type, by library, by user multiple deprivation index

