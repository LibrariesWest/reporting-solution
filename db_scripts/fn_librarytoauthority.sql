---------------------------------------------------------------
-- function: fn_librarytoauthority
-- This function converts a libray code to an authority name
-- using libraries west authorities.
---------------------------------------------------------------

-- drop function fn_librarytoauthority(text);
create or replace function fn_librarytoauthority(s text) returns text as
$BODY$
begin
return 
  case
    when s LIKE 'BN%' then 'Bath and North East Somerset'
    when s LIKE 'BS%' then 'Bristol'
    when s LIKE 'DO%' then 'Dorset'
    when s LIKE 'PO%' then 'Poole'
    when s LIKE 'SG%' then 'South Gloucestershire'
    when s LIKE 'SO%' then 'Somerset'
    when s LIKE 'NS%' then 'North Somerset'
    else null
  end;
end;
$BODY$ 
language plpgsql volatile cost 100;