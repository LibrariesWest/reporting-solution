-- View: public.vw_users_libraries

-- DROP VIEW public.vw_users_libraries;

CREATE OR REPLACE VIEW public.vw_users_libraries AS 
 SELECT u.id,
    fn_librarytoauthority(u.id::text) AS authority,
        CASE
            WHEN u.mailing_address = 1 THEN ( SELECT userxinfo.entry
               FROM userxinfo
              WHERE userxinfo."offset" = u.address_offset_1 AND userxinfo.entry_number = 9000
             LIMIT 1)
            WHEN u.mailing_address = 2 THEN ( SELECT userxinfo.entry
               FROM userxinfo
              WHERE userxinfo."offset" = u.address_offset_2 AND userxinfo.entry_number = 9036
             LIMIT 1)
            WHEN u.mailing_address = 3 THEN ( SELECT userxinfo.entry
               FROM userxinfo
              WHERE userxinfo."offset" = u.address_offset_3 AND userxinfo.entry_number = 9036
             LIMIT 1)
            ELSE NULL::text
        END AS postcode
   FROM users u
     JOIN policy ul ON ul.policy_type::text = 'LIBR'::text AND ul.policy_number = u.library
     JOIN policy us ON us.policy_type::text = 'USTN'::text AND us.policy_number = u.status
     JOIN policy up ON up.policy_type::text = 'UPRF'::text AND up.policy_number = u.profile
  WHERE u.id::text = ul.policy_name::text;
