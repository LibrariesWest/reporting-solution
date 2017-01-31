-- View: public.vw_holds

-- DROP VIEW public.vw_holds;

CREATE OR REPLACE VIEW public.vw_holds AS 
 SELECT u.id AS user_id,
    i.id AS item_id,
    ip.policy_name AS item_library,
    fn_librarytoauthority(ip.policy_name::text) AS item_authority,
        CASE
            WHEN h.type::text = 'C'::text THEN 'Copy'::text
            WHEN h.type::text = 'T'::text THEN 'Title'::text
            ELSE NULL::text
        END AS level,
    ipp.policy_name AS pickup_library,
    fn_librarytoauthority(ipp.policy_name::text) AS pickup_authority,
    h.date_placed AS placed,
    h.date_available,
    rp.policy_name AS range,
    cp.policy_name AS client
   FROM hold h
     JOIN users u ON u.user_key = h.user_key
     JOIN item i ON i.catalogue_key = h.catalogue_key AND i.call_sequence = h.call_sequence AND i.copy_number = h.copy_number
     JOIN policy ip ON ip.policy_number = h.item_library AND ip.policy_type::text = 'LIBR'::text
     JOIN policy ipp ON ipp.policy_number = h.pickup_library AND ipp.policy_type::text = 'LIBR'::text
     JOIN policy cp ON cp.policy_type::text = 'CTYP'::text AND cp.policy_number = h.client_used
     JOIN policy rp ON rp.policy_type::text = 'HOLD_RANGE'::text AND rp.policy_number = h.range;
