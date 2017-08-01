---------------------------------------------------------------
-- view: vw_users_public
---------------------------------------------------------------

-- drop view vw_users_public;
create or replace view vw_users_public as 
select
  *
from vw_users vu
where vu.profile in (
  'ACC_0-11', 
  'ACC_12-14', 
  'ACC_15-17', 
  'ACC_ADU', 
  'ADU', 
  'ADU_PRIV', 
  'ADU_TOT', 
  'CH_0-4', 
  'CH_0-4_TOT', 
  'CH_5-11', 
  'CH_5-11_to', 
  'CM_FC', 
  'CON_0-11', 
  'CON_12-14', 
  'CON_15-17', 
  'CON_ADU', 
  'CV_IND', 
  'E_CHMIND', 
  'E_FAMILY', 
  'E_HOMET', 
  'E_LEAVER', 
  'E_OTHER',
  'E_TEACH', 
  'E_YR_13', 
  'E_YR_5', 
  'E_YR_6', 
  'E_YR_7', 
  'E_YR_8', 
  'E_YR_9', 
  'HOME_IND', 
  'INPROCESS', 
  'INT_U18', 
  'LOSTCARD', 
  'NO_ADD', 
  'PC_CLASS', 
  'PUBLIC', 
  'STOLEN', 
  'TMP_ADU', 
  'TN_12-14', 
  'TN_12-14_t', 
  'TN_15-17', 
  'TN_15-17_T', 
  'VIS_0-11', 
  'VIS_12-14', 
  'VIS_15-17', 
  'VIS_ADU' );