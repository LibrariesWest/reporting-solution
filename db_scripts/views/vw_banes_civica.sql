-- Custom view for B&NES to extract cash management data

select sale_amt from vw_cashmanagement
where authority = 'Bath and North East Somerset'
and day_time >= '17-May-2018' and day_time < '25-May-2018'

