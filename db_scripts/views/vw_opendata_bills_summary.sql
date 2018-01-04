---------------------------------------------------------------
-- view: vw_opendata_bills_summary
---------------------------------------------------------------

-- drop view vw_opendata_bills_summary;
create or replace view vw_opendata_bills_summary as
select
    to_char(b.date_billed, 'YYYY-MM') as month_billed,
    b.bill_authority as bill_authority,
    b.reason as bill_reason,
    count(*) as number_of_bills,
    sum(amount) as total_billed
from vw_bills b
where b.date_billed >= '7-Jun-2016'
group by month_billed, bill_authority, bill_reason
order by month_billed, bill_authority, bill_reason;
