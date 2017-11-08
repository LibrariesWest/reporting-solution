---------------------------------------------------------------
-- view: vw_opendata_newcastle_issues
---------------------------------------------------------------

-- drop view vw_opendata_newcastle_items;
-- Newcastle provider issues per month and branch with month as a column and branch as rows
-- This is a bit difficult!

WITH cte AS (
	WITH minmax AS (
		SELECT
			min(extract(month from order_date))::int,
			max(extract(month from order_date))::int
		FROM vw_charges_chargeshistory
	)
	SELECT 
		entity,
		mon,
		0 AS qty
	FROM (SELECT DISTINCT  entity FROM mytable) entities, (SELECT generate_series(min, max) AS mon FROM minmax) allmonths
	UNION
	SELECT entity, extract(month from order_date)::int, qty FROM mytable
)
SELECT entity, array_agg(sum) AS values
FROM (
	SELECT entity, mon, sum(qty) 
	FROM cte
	GROUP BY 1, 2) sub
GROUP BY 1
ORDER BY 1;