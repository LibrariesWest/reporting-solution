---------------------------------------------------------------
-- view: vw_opendata_bills
---------------------------------------------------------------

-- drop view vw_opendata_bills;
create or replace view vw_opendata_bills as
select
    to_char(b.date_billed, 'YYYY-MM-DD') as date_billed,
    b.bill_authority as bill_authority,
    b.bill_library as bill_library,
	b.item_type as item_type,
    b.reason as bill_reason,
    count(*) as number_of_bills,
    sum(amount) as total_billed
from vw_bills b
group by date_billed, bill_authority, bill_library, item_type, bill_reason
order by date_billed, bill_authority, bill_library, item_type, bill_reason;
