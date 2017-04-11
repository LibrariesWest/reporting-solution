---------------------------------------------------------------
-- table: ons_lsoas_imd
---------------------------------------------------------------

-- index: cuix_onslsoas_imd_code.
create unique index cuix_onslsoas_imd_code on ons_lsoas_imd using btree (lsoa_code);
alter table ons_lsoas_imd cluster on cuix_onslsoas_imd_code;