---------------------------------------------------------------
-- table: policy
---------------------------------------------------------------

-- drop table policy;
create table policy
(
  policy_number integer,
  policy_type character varying(40),
  policy_name character varying(40),
  description character varying(200),
  empty character(1),
  constraint pk_policy_numbertype primary key (policy_number, policy_type)
);