-- table: catalogue
-- drop table catalogue;
create table catalogue
(
  catalogue_key integer not null,
  status integer,
  year_of_publication integer,
  format integer,
  marc integer,
  date_created date,
  date_catalogued date,
  date_modified date,
  create_name character varying(20),
  modify_name character varying(20),
  heading_offset integer,
  marclist_offset integer,
  shadow integer,
  number_of_copies_on_open_order integer,
  marc_file integer,
  empty character(1),
  constraint pk_catalogue_key primary key (catalogue_key)
);

-- index: cuix_catalogue_key
-- drop index cuix_catalogue_key;
create unique index cuix_catalogue_key on catalogue using btree (catalogue_key);
alter table catalogue cluster on cuix_catalogue_key;

-- index: ix_catalogue_key_marc
-- drop index ix_catalogue_key_marc;
create index ix_catalogue_key_marc on catalogue using btree (catalogue_key, marc);