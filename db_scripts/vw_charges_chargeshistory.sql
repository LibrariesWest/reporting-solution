-- View: public.vw_charges_chargeshistory

-- DROP VIEW public.vw_charges_chargeshistory;

CREATE OR REPLACE VIEW public.vw_charges_chargeshistory AS 
 SELECT uh.id AS user_id,
    ih.id AS item,
    lph.policy_name AS library,
    fn_librarytoauthority(lph.policy_name::text) AS authority,
    ch.date_charged AS charged,
    ch.date_renewed AS renewed,
    ch.number_of_renewals AS renewals,
    ch.number_of_unseen_renewals AS unseen,
    ch.accrued_fine AS fine,
        CASE
            WHEN ch.overdue = 0 THEN 'No'::text
            ELSE 'Yes'::text
        END AS overdue,
    ch.date_time_discharged AS discharged,
    ldph.policy_name AS discharge_library
   FROM chargehist ch
     JOIN users uh ON uh.user_key = ch.user_key
     JOIN item ih ON ih.catalogue_key = ch.catalogue_key AND ih.call_sequence = ch.call_sequence AND ih.copy_number = ch.copy_number
     JOIN policy lph ON lph.policy_number = ch.library AND lph.policy_type::text = 'LIBR'::text
     JOIN policy ldph ON ldph.policy_number = ch.discharge_library AND ldph.policy_type::text = 'LIBR'::text
UNION ALL
 SELECT u.id AS user_id,
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
        END AS overdue,
    NULL::date AS discharged,
    NULL::character varying AS discharge_library
   FROM charge c
     JOIN users u ON u.user_key = c.user_key
     JOIN item i ON i.catalogue_key = c.catalogue_key AND i.call_sequence = c.call_sequence AND i.copy_number = c.copy_number
     JOIN policy lp ON lp.policy_number = c.library AND lp.policy_type::text = 'LIBR'::text;
