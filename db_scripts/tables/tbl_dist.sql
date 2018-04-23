---------------------------------------------------------------
-- table: dist
---------------------------------------------------------------

-- drop table dist;
create table dist
(
  key integer not null,
  orderline_key integer,
  user_key integer,
  packing_list character varying (100),
  type integer,
  date_received date,
  copies integer,
  date_loaded_delivered date, 
  library integer, 
  holding_code integer, 
  shipping integer,
  empty character(1),
  constraint pk_dist_key primary key (dist_key)
);