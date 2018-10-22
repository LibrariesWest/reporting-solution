---------------------------------------------------------------
-- table: audit
---------------------------------------------------------------

-- drop table audit
create table audit
(
  key integer,
  fundcyc_key integer, 
  operation_type integer, 
  prev_amount numeric, 
  new_amount numeric, 
  src_fund_key integer, 
  src_fund_id character varying(50), 
  src_fiscal_cycle integer, 
  dest_fund_key integer, 
  dest_fund_id character varying(50), 
  dest_fiscal_cycle integer, 
  date_created date, 
  user_key integer, 
  user_id character varying (50), 
  library integer, 
  archived_entry character varying(50), 
  archive_flag character(1),
  empty character(1),
  constraint pk_audit_key primary key (key)
);