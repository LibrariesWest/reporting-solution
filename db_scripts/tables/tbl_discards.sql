---------------------------------------------------------------
-- table: discards
---------------------------------------------------------------

-- drop table discards;
create table discards
(
  item_id character vaying (20) not null
  constraint pk_discards_itemid primary key (item_id)
);