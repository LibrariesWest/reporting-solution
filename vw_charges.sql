-- View: public.vw_charges

-- DROP VIEW public.vw_charges;

CREATE OR REPLACE VIEW public.vw_charges AS 
 SELECT u.id AS "user",
    i.id AS item,
    lp.policy_name AS library,
    fn_librarytoauthority(lp.policy_name::text) AS authority,
    c.date_charged AS charged,
    c.date_renewed AS renewed,
    c.number_of_renewals AS renewals,
    c.number_of_unseen_renewals AS unseen,
    c.accrued_fine AS fine,
        CASE
            WHEN c.overdue = 0 THEN 'No'::text
            ELSE 'Yes'::text
        END AS overdue
   FROM charge c
     JOIN users u ON u.user_key = c.user_key
     JOIN item i ON i.catalogue_key = c.catalogue_key AND i.call_sequence = c.call_sequence AND i.copy_number = c.copy_number
     JOIN policy lp ON lp.policy_number = c.library AND lp.policy_type::text = 'LIBR'::text;
