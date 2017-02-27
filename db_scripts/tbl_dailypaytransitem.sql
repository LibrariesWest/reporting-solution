-- table: dailypaytransitem
-- drop table dailypaytransitem;
create table dailypaytransitem
(
  key integer not null,
  dailypaytrans_key integer,
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  bill_num integer,
  bill_reason integer,
  item_type integer,
  description text,
  quantity integer,
  sale_amt numeric,
  tax_amt numeric,
  empty character(1),
  constraint pk_dailypaytransitem_key primary key (key)
);

-- index: cuix_dailypaytransitem_key
-- drop index cuix_dailypaytransitem_key;
create unique index cuix_dailypaytransitem_key on dailypaytransitem using btree (key);
alter table dailypaytransitem cluster on cuix_dailypaytransitem_key;

-- index: ix_dailypaytransitem_dailypaytranskey
-- drop index ix_dailypaytransitem_dailypaytranskey;
create index ix_dailypaytransitem_dailypaytranskey on dailypaytransitem using btree (dailypaytrans_key);

-- index: ix_dailypaytransitem_catkey_callseq_copynum
-- drop index ix_dailypaytransitem_catkey_callseq_copynum;
create index ix_dailypaytransitem_catkey_callseq_copynum on dailypaytransitem using btree (catalogue_key, call_sequence, copy_number);

-- index: ix_dailypaytransitem_billnum
-- drop index ix_dailypaytransitem_billnum;
create index ix_dailypaytransitem_billnum on dailypaytransitem using btree (bill_num);

-- index: ix_dailypaytransitem_billreason
-- drop index ix_dailypaytransitem_billreason;
create index ix_dailypaytransitem_billreason on dailypaytransitem using btree (bill_reason);

-- index: ix_dailypaytransitem_itemtype
-- drop index ix_dailypaytransitem_itemtype;
create index ix_dailypaytransitem_itemtype on dailypaytransitem using btree (item_type);