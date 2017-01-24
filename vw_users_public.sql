-- View: public.vw_users_public

-- DROP VIEW public.vw_users_public;

CREATE OR REPLACE VIEW public.vw_users_public AS 
 SELECT vw_users.id,
    vw_users.profile,
    vw_users.postcode,
    vw_users.library,
    vw_users.authority,
    vw_users.status,
    vw_users.joined,
    vw_users.billed,
    vw_users.paid,
    vw_users.last_activity_date,
    vw_users.issued,
    vw_users.renewed
   FROM vw_users
  WHERE vw_users.profile::text = ANY (ARRAY['ACC_0-11'::character varying::text, 'ACC_12-14'::character varying::text, 'ACC_15-17'::character varying::text, 'ACC_ADU'::character varying::text, 'ADU'::character varying::text, 'ADU_PRIV'::character varying::text, 'ADU_TOT'::character varying::text, 'CH_0-4'::character varying::text, 'CH_0-4_TOT'::character varying::text, 'CH_5-11'::character varying::text, 'CH_5-11_TO'::character varying::text, 'CM_FC'::character varying::text, 'CON_0-11'::character varying::text, 'CON_12-14'::character varying::text, 'CON_15-17'::character varying::text, 'CON_ADU'::character varying::text, 'CV_IND'::character varying::text, 'E_CHMIND'::character varying::text, 'E_FAMILY'::character varying::text, 'E_HOMET'::character varying::text, 'E_LEAVER'::character varying::text, 'E_OTHER'::character varying::text, 'E_TEACH'::character varying::text, 'E_YR_13'::character varying::text, 'E_YR_5'::character varying::text, 'E_YR_6'::character varying::text, 'E_YR_7'::character varying::text, 'E_YR_8'::character varying::text, 'E_YR_9'::character varying::text, 'HOME_IND'::character varying::text, 'INPROCESS'::character varying::text, 'INT_U18'::character varying::text, 'LOSTCARD'::character varying::text, 'NO_ADD'::character varying::text, 'PS_CLASS'::character varying::text, 'PUBLIC'::character varying::text, 'STOLEN'::character varying::text, 'TMP_ADU'::character varying::text, 'TN_12-14'::character varying::text, 'TN_12-14_T'::character varying::text, 'TN_15-17'::character varying::text, 'TN_15-17_T'::character varying::text, 'VIS_0-11'::character varying::text, 'VIS_12-14'::character varying::text, 'VIS_15-17'::character varying::text, 'VIS_ADU'::character varying::text]);
