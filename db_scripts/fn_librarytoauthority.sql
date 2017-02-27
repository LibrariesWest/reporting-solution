-- drop function public.fn_librarytoauthority(text);
create or replace function public.fn_librarytoauthority(s text) returns text as
$BODY$
begin
return 
  case
    when s::text ~~ 'BN%'::text then 'Bath and North East Somerset'::text
    when s::text ~~ 'BS%'::text then 'Bristol'::text
    when s::text ~~ 'DO%'::text then 'Dorset'::text
    when s::text ~~ 'PO%'::text then 'Poole'::text
    when s::text ~~ 'SG%'::text then 'South Gloucestershire'::text
    when s::text ~~ 'SO%'::text then 'Somerset'::text
    when s::text ~~ 'NS%'::text then 'North Somerset'::text
    else null::text
  end;
end;
$BODY$ 
language plpgsql volatile cost 100;