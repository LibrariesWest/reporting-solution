---------------------------------------------------------------
-- view: vw_charges_chargeshistory
---------------------------------------------------------------

-- drop view vw_charges_chargeshistory;
create or replace view vw_charges_chargeshistory as 
select * from vw_chargeshistory
union all
select *, null, null, null from vw_charges;