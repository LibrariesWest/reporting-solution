-- view: vw_users_public
-- drop view vw_users_public;
create or replace view vw_users_public as 
select
  vu.id,
  vu.profile,
  vu.postcode,
  vu.library,
  vu.authority,
  vu.gender,
  vu.id_check,
  vu.ethnicity,
  vu.peoples_network,
  vu.marketing,
  vu.religion_belief,
  vu.how_heard,
  vu.data_protection,
  vu.school,
  vu.mobile_route,
  vu.declared_disability,
  vu.notices_delivery,
  vu.status,
  vu.joined,
  vu.active,
  vu.issued,
  vu.renewed,
  vu.billed,
  vu.paid
from vw_users vu
where vu.profile::text = any (array['acc_0-11'::character varying::text, 'acc_12-14'::character varying::text, 'acc_15-17'::character varying::text, 'acc_adu'::character varying::text, 'adu'::character varying::text, 'adu_priv'::character varying::text, 'adu_tot'::character varying::text, 'ch_0-4'::character varying::text, 'ch_0-4_tot'::character varying::text, 'ch_5-11'::character varying::text, 'ch_5-11_to'::character varying::text, 'cm_fc'::character varying::text, 'con_0-11'::character varying::text, 'con_12-14'::character varying::text, 'con_15-17'::character varying::text, 'con_adu'::character varying::text, 'cv_ind'::character varying::text, 'e_chmind'::character varying::text, 'e_family'::character varying::text, 'e_homet'::character varying::text, 'e_leaver'::character varying::text, 'e_other'::character varying::text, 'e_teach'::character varying::text, 'e_yr_13'::character varying::text, 'e_yr_5'::character varying::text, 'e_yr_6'::character varying::text, 'e_yr_7'::character varying::text, 'e_yr_8'::character varying::text, 'e_yr_9'::character varying::text, 'home_ind'::character varying::text, 'inprocess'::character varying::text, 'int_u18'::character varying::text, 'lostcard'::character varying::text, 'no_add'::character varying::text, 'ps_class'::character varying::text, 'public'::character varying::text, 'stolen'::character varying::text, 'tmp_adu'::character varying::text, 'tn_12-14'::character varying::text, 'tn_12-14_t'::character varying::text, 'tn_15-17'::character varying::text, 'tn_15-17_t'::character varying::text, 'vis_0-11'::character varying::text, 'vis_12-14'::character varying::text, 'vis_15-17'::character varying::text, 'vis_adu'::character varying::text]);