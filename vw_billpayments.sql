-- View: public.vw_billpayments

-- DROP VIEW public.vw_billpayments;

CREATE OR REPLACE VIEW public.vw_billpayments AS 
 SELECT bp.payment_date AS date,
    lp.policy_name AS library,
    fn_librarytoauthority(lp.policy_name::text) AS authority,
    u.id AS user_id,
    ptp.policy_name AS type,
    bp.payment_amount AS amount
   FROM billpayment bp
     JOIN users u ON u.user_key = bp.user_key
     JOIN policy ptp ON ptp.policy_number = bp.payment_type AND ptp.policy_type::text = 'PTYP'::text
     JOIN policy lp ON lp.policy_number = bp.library AND lp.policy_type::text = 'LIBR'::text;
