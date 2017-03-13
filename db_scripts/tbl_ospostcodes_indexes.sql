-- index: cix_postcode
-- drop index cix_postcode;
create unique index cix_postcode on os_postcodes using btree (postcode);
alter table os_postcodes cluster on cix_postcode;