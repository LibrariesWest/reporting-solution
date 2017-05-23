---------------------------------------------------------------
-- view: vw_holds_interlending_books
---------------------------------------------------------------

-- drop view vw_holds_interlending_books;
create or replace view vw_holds_interlending_books as 
select 
    *
from vw_holds_interlending
where item_type in (
    'CH_FIC',
    'NEW-BOOK',
    'B-O-P',
    'LP_NF',
    'FAST',
    'ADU_GRN',
    'REF-BOOK',
    'CH_REF',
    'ADU_FIC',
    'LANG',
    'YA_FIC',
    'BOOK',
    'ADU_REF',
    'LP_FIC',
    'ADU_NF',
    'YA_NF',
    'CH_NF',
);