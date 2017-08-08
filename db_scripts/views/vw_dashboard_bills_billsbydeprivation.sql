---------------------------------------------------------------
-- view: vw_dashboard_bills_billsbydeprivation
---------------------------------------------------------------

-- drop view vw_dashboard_bills_billsbydeprivation;
create or replace view vw_dashboard_bills_billsbydeprivation as
select
	fn_librarytoauthority(pl.policy_name) as authority,
	pr.policy_name as reason,
    u.imd_decile,
    count(*) as number_of_bills,
    sum(amount_billed) as total_billed
from bill b
join vw_users_geography u on u.user_key = b.user_key
join policy pr on pr.policy_type = 'BRSN' and pr.policy_number = b.reason
join policy pl on pl.policy_type = 'LIBR' and pl.policy_number = b.library
where date_billed > (now() - interval '1 year')
and u.imd_decile is not null
group by fn_librarytoauthority(pl.policy_name), pr.policy_name, u.imd_decile
order by fn_librarytoauthority(pl.policy_name), pr.policy_name, u.imd_decile;