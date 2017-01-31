-- View: public.vw_bills

-- DROP VIEW public.vw_bills;

CREATE OR REPLACE VIEW public.vw_bills AS 
 SELECT b.date_billed,
    u.id AS user_id,
    i.id AS item_id,
    itp.policy_name AS item_type,
    li.policy_name AS item_library,
    fn_librarytoauthority(li.policy_name::text) AS item_authority,
    lp.policy_name AS bill_library,
    fn_librarytoauthority(lp.policy_name::text) AS bill_authority,
    bp.policy_name AS reason,
    b.amount_billed AS amount,
    b.paid_in_full_flag AS paid
   FROM bill b
     JOIN item i ON i.catalogue_key = b.catalogue_key AND i.call_sequence = b.call_sequence AND i.copy_number = b.copy_number
     JOIN policy itp ON itp.policy_number = i.type AND itp.policy_type::text = 'ITYP'::text
     JOIN users u ON u.user_key = b.user_key
     JOIN policy lp ON lp.policy_number = b.library AND lp.policy_type::text = 'LIBR'::text
     JOIN policy li ON li.policy_number = i.library AND li.policy_type::text = 'LIBR'::text
     JOIN policy bp ON bp.policy_number = b.reason AND bp.policy_type::text = 'BRSN'::text;
