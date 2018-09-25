---------------------------------------------------------------
-- view: vw_dashboard_collection_replacementpaid
---------------------------------------------------------------

-- drop view vw_dashboard_collection_replacementpaid;
create or replace view vw_dashboard_collection_replacementpaid as
select
	fn_librarytoauthority(lp.policy_name) as authority,
	lp.policy_name as library,
	i.id as item_id,
	c.title, 
	c.isbn, 
	ip.policy_name as current_location,
	(select count(*) from vw_items where authority = fn_librarytoauthority(lp.policy_name) and catalogue_key = i.catalogue_key and current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')) as number_copies
from item i
join policy ip on ip.policy_number = i.current_location and ip.policy_type = 'LOCN'
join policy lp on lp.policy_number = i.library and lp.policy_type = 'LIBR'
join 
    (select 
		distinct catalogue_key, 
		call_sequence, 
		copy_number
    from billpayment p
    join bill b on b.bill_number = p.bill_number and b.user_key = p.user_key
    join policy brp on brp.policy_number = b.reason and brp.policy_type = 'BRSN'
    join policy ptp on ptp.policy_number = p.payment_type and ptp.policy_type = 'PTYP'
    where brp.policy_name in ('LOST', 'DAMAGED', 'BFR')
    and ptp.policy_name not in ('CANCEL', 'FORGIVEN')
	and p.payment_date > (now() - interval '2 years')) as paid -- all items that have had replacement payments
on paid.catalogue_key = i.catalogue_key and paid.call_sequence = i.call_sequence and paid.copy_number = i.copy_number
join vw_catalogue c on i.catalogue_key = c.catalogue_key;