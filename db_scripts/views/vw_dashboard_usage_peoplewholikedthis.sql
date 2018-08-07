---------------------------------------------------------------
-- view: vw_dashboard_usage_peoplewholikedthis
---------------------------------------------------------------

-- drop view vw_dashboard_usage_peoplewholikedthis;
create or replace view vw_dashboard_usage_peoplewholikedthis as
with charges as (select user_key, catalogue_key from chargehist)
select ch1.catalogue_key as title_1, ch2.catalogue_key as title_2, count(*) as instances from charges ch1
join charges ch2 on ch1.user_key = ch2.user_key and ch1.catalogue_key < ch2.catalogue_key
group by title_1, title_2
having count(*) > 10
order by title_1, title_2;