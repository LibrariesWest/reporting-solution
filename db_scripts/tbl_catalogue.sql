---------------------------------------------------------------
-- table: catalogue
---------------------------------------------------------------
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