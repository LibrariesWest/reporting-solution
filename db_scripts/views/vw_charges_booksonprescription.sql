---------------------------------------------------------------
-- view: vw_charges_booksonprescription
---------------------------------------------------------------

-- drop view vw_charges_booksonprescription;
create or replace view vw_charges_booksonprescription as
select
	ch.key,
	ch.date_charged,
	ch.user_key,
	ch.library,
	bop.type,
	bop.title,
	bop.isbn,
	ch.number_of_renewals
from vw_charges_chargeshistory ch
join vw_catalogue c on c.catalogue_key = ch.catalogue_key
join booksonprescription bop on c.isbn = bop.isbn;