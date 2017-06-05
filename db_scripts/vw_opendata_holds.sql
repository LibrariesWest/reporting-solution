---------------------------------------------------------------
-- view: vw_opendata_holds
---------------------------------------------------------------

-- drop view vw_opendata_holds;
create or replace view vw_opendata_holds as
select
    lp.policy_name as hold_library,
    fn_librarytoauthority(lp.policy_name) as hold_authority,
    ip.policy_name as item_library,
    fn_librarytoauthority(ip.policy_name) as item_authority,
    ipp.policy_name as pickup_library,
    fn_librarytoauthority(ipp.policy_name) as pickup_authority,
    to_char(h.date_placed, 'YYYYMM') as month_placed,
    round(avg(h.date_available - h.date_placed)) as days,
    cp.policy_name as client,
    count(h.key) as holds
from hold h
join users u on u.user_key = h.user_key
join item i on i.catalogue_key = h.catalogue_key and i.call_sequence = h.call_sequence and i.copy_number = h.copy_number
join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = h.library
join policy ip on ip.policy_type = 'LIBR' and ip.policy_number = h.item_library
join policy ipp on ipp.policy_type = 'LIBR' and ipp.policy_number = h.pickup_library
join policy cp on cp.policy_type = 'CTYP' and cp.policy_number = h.client_used
where h.date_available is not null
group by month_placed, hold_library, hold_authority, ip.policy_name, item_authority, ipp.policy_name, pickup_authority, client;