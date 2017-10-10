---------------------------------------------------------------
-- view: vw_dashboard_bills_billsbydeprivation
---------------------------------------------------------------

-- drop view vw_dashboard_bills_billsbydeprivation;
create or replace view vw_dashboard_bills_billsbydeprivation as
select
	b.bill_authority,
	b.reason,
    u.imd_decile,
    count(b.bill_number) as number_of_bills,
    sum(b.amount) as total_billed
from vw_bills b
join vw_users_geography u on u.user_key = b.user_key
where b.date_billed > (now() - interval '1 year')
group by b.bill_authority, b.reason, u.imd_decile
order by b.bill_authority, b.reason, u.imd_decile;