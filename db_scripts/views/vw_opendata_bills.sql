---------------------------------------------------------------
-- view: vw_opendata_bills
---------------------------------------------------------------

-- drop view vw_opendata_bills;
create or replace view vw_opendata_bills as
select
    to_char(b.date_billed, 'YYYYMM') as month_billed,
    b.bill_authority as bill_authority,
    b.bill_library as bill_library,
    b.reason as bill_reason,
    count(*) as number_of_bills,
    sum(amount) as total_billed
from vw_bills b
group by month_billed, bill_authority, bill_library, bill_reason
order by month_billed, bill_authority, bill_library, bill_reason;