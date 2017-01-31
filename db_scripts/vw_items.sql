-- View: public.vw_items

-- DROP VIEW public.vw_items;

CREATE OR REPLACE VIEW public.vw_items AS 
 SELECT i.catalogue_key,
    i.id,
    ip.policy_name AS library,
    fn_librarytoauthority(ip.policy_name::text) AS authority,
    i.last_activity_date AS active,
    i.date_created AS created,
    it.policy_name AS type,
    i.price,
    i.date_last_charged AS charged,
    i.shadow AS shadowed
   FROM item i
     JOIN policy ip ON ip.policy_type::text = 'LIBR'::text AND ip.policy_number = i.library
     JOIN policy it ON it.policy_type::text = 'ITYP'::text AND it.policy_number = i.type;
