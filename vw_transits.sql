-- View: public.vw_transits

-- DROP VIEW public.vw_transits;

CREATE OR REPLACE VIEW public.vw_transits AS 
 SELECT i.id,
    t.date_time_transited AS transited,
    fl.policy_name AS from_library,
    fn_librarytoauthority(fl.policy_name::text) AS from_authority,
    tl.policy_name AS to_library,
    fn_librarytoauthority(tl.policy_name::text) AS to_authority,
    pr.policy_name AS reason
   FROM transit t
     JOIN item i ON t.catalogue_key = i.catalogue_key AND t.call_sequence = i.call_sequence AND t.copy_number = i.copy_number
     JOIN policy fl ON fl.policy_number = t.from_library AND fl.policy_type::text = 'LIBR'::text
     JOIN policy tl ON tl.policy_number = t.to_library AND tl.policy_type::text = 'LIBR'::text
     JOIN policy pr ON pr.policy_number = t.reason_needed AND pr.policy_type::text = 'TRANSIT_RSN'::text;
