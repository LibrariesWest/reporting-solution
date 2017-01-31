-- View: public.vw_users

-- DROP VIEW public.vw_users;

CREATE OR REPLACE VIEW public.vw_users AS 
 SELECT u.id,
    up.policy_name AS profile,
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
        END AS postcode,
    ul.policy_name AS library,
    fn_librarytoauthority(ul.policy_name::text) AS authority,
    us.policy_name AS status,
    u.date_created AS joined,
    COALESCE(( SELECT sum(COALESCE(bill.amount_billed, 0::numeric)) AS sum
           FROM bill
          WHERE bill.user_key = u.user_key), 0::numeric) AS billed,
    COALESCE(( SELECT sum(COALESCE(billpayment.payment_amount, 0::numeric)) AS sum
           FROM billpayment
          WHERE billpayment.user_key = u.user_key), 0::numeric) AS paid,
    u.last_activity_date,
    ( SELECT max(c.date_charged) AS max
           FROM ( SELECT charge.date_charged
                   FROM charge
                  WHERE charge.user_key = u.user_key
                UNION ALL
                 SELECT chargehist.date_charged
                   FROM chargehist
                  WHERE chargehist.user_key = u.user_key) c) AS issued,
    ( SELECT max(c.date_renewed) AS max
           FROM ( SELECT charge.date_renewed
                   FROM charge
                  WHERE charge.user_key = u.user_key
                UNION ALL
                 SELECT chargehist.date_renewed
                   FROM chargehist
                  WHERE chargehist.user_key = u.user_key) c) AS renewed
   FROM users u
     JOIN policy ul ON ul.policy_type::text = 'LIBR'::text AND ul.policy_number = u.library
     JOIN policy us ON us.policy_type::text = 'USTN'::text AND us.policy_number = u.status
     JOIN policy up ON up.policy_type::text = 'UPRF'::text AND up.policy_number = u.profile;
