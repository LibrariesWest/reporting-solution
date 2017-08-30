---------------------------------------------------------------
-- view: vw_opendata_bills
---------------------------------------------------------------

-- drop view vw_opendata_bills;
create or replace view vw_opendata_bills as
select
    to_char(b.date_billed, 'YYYYMM') as month_billed,
    b.bill_authority as authority,
    b.bill_library as library,
    b.reason as reason,
    count(*) as number_of_bills,
    sum(amount) as total_billed
from vw_bills b
group by month_billed, authority, library, reason
order by month_billed, authority, library, reason;