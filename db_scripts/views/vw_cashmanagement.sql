---------------------------------------------------------------
-- view: vw_cashmanagement
---------------------------------------------------------------

-- drop view vw_cashmanagement;
create or replace view vw_cashmanagement as 
select 
    t.timestamp as day_time,
    tp.policy_name as transaction_type,
    l.policy_name as library,
    fn_librarytoauthority(l.policy_name) as authority,
    sp.policy_name as station,
    cl.id as staff_id,
    us.user_key,
    us.id as user_id,
    t.override,
    tp.policy_name as transaction_type,
    pt.policy_name as payment_type,
    a.amount,
    br.policy_name as bill_reason,
    coalesce(ity.policy_name, itty.policy_name) as item_type,
    case when ity.policy_name is not null then i.description
    else itty.policy_name end as payment_group,
    i.description,
    i.quantity,
    round(i.sale_amt / 100, 2) as sale_amt,
    round(i.tax_amt / 100, 2) as tax_amt
from dailypaytrans t
left join dailypaytransitem i on t.key = i.dailypaytrans_key
left join dailypaytransamt a on t.key = a.dailypaytrans_key
left join item it on it.catalogue_key = i.catalogue_key and it.call_sequence = i.call_sequence and it.copy_number = i.copy_number
left join users us on us.user_key = t.patron
left join users cl on cl.user_key = t.clerk
left join policy l on l.policy_type = 'LIBR' and l.policy_number = t.library_id
left join policy br on br.policy_type = 'BRSN' and br.policy_number = i.bill_reason
left join policy pt on pt.policy_type = 'PTYP' and pt.policy_number = a.payment_type
left join policy sp on sp.policy_type = 'STAT' and sp.policy_number = t.station_id
left join policy tp on tp.policy_type = 'TXN_TYP' and tp.policy_number = t.transaction_type
left join policy ity on ity.policy_type = 'ITYP' and ity.policy_number = i.item_type
left join policy itty on itty.policy_type = 'ITYP' and itty.policy_number = it.type
where t.timestamp >= '2016-06-07' and fn_librarytoauthority(l.policy_name) is not null;