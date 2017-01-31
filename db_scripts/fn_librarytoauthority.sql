-- Function: public.fn_librarytoauthority(text)

-- DROP FUNCTION public.fn_librarytoauthority(text);

CREATE OR REPLACE FUNCTION public.fn_librarytoauthority(s text)
  RETURNS text AS
$BODY$
BEGIN
return CASE
    WHEN s::text ~~ 'BN%'::text THEN 'Bath and North East Somerset'::text
    WHEN s::text ~~ 'BS%'::text THEN 'Bristol'::text
    WHEN s::text ~~ 'DO%'::text THEN 'Dorset'::text
    WHEN s::text ~~ 'PO%'::text THEN 'Poole'::text
    WHEN s::text ~~ 'SG%'::text THEN 'South Gloucestershire'::text
    WHEN s::text ~~ 'SO%'::text THEN 'Somerset'::text
    WHEN s::text ~~ 'NS%'::text THEN 'North Somerset'::text
    ELSE NULL::text
END;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
