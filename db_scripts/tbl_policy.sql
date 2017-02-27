-- table: policy
-- drop table policy;
create table policy
(
  policy_number integer,
  policy_type character varying(40),
  policy_name character varying(40),
  empty character(1),
  constraint pk_policy_numbertype primary key (policy_number, policy_type)
);

-- index: cuix_policy_numbertype
-- drop index cuix_policy_numbertype;
create unique index cuix_policy_numbertype on policy using btree (policy_number, policy_type);
alter table policy cluster on cuix_policy_numbertype;

-- index: public.cix_type_number
-- drop index public.cix_type_number;
create index cix_type_number on policy using btree (policy_type, policy_number);
alter table policy cluster on cix_type_number;

-- index: ix_policy_name
-- drop index ix_policy_name;
create index ix_policy_name on policy using btree (policy_name);

-- index: ix_policy_type
-- drop index ix_policy_type;
create index ix_policy_type on policy using btree (policy_type);