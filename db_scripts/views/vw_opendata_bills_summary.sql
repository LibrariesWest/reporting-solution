---------------------------------------------------------------
-- view: vw_opendata_bills_summary
---------------------------------------------------------------

-- drop view vw_opendata_bills_summary;
create or replace view vw_opendata_bills_summary as
select
    to_char(b.date_billed, 'YYYY') as year_billed,
    b.bill_authority as bill_authority,
    b.reason as bill_reason,
    round(count(*), -1) as number_of_bills,
    round(sum(amount), -1) as total_billed
from vw_bills b
where b.date_billed >= (now() - interval '2 years')
and b.bill_library in (select code from libraries)
group by year_billed, bill_authority, bill_reason
order by year_billed, bill_authority, bill_reason;