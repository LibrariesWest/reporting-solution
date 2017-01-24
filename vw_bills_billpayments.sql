-- View: public.vw_bills_billpayments

-- DROP VIEW public.vw_bills_billpayments;

CREATE OR REPLACE VIEW public.vw_bills_billpayments AS 
 SELECT bp.payment_date,
    bpl.policy_name AS library,
    fn_librarytoauthority(bpl.policy_name::text) AS authority,
    it.policy_name AS item_type,
    i.id AS item_id,
    (string_to_array(m.tag, '~'::text))[1] AS title,
    br.policy_name AS bill_reason,
    b.amount_billed AS bill_amount,
    b.tax AS vat,
    pt.policy_name AS payment_type,
    bp.payment_amount AS paid
   FROM billpayment bp
     JOIN bill b ON b.bill_number = bp.bill_number AND b.user_key = bp.user_key
     JOIN item i ON i.catalogue_key = b.catalogue_key AND i.call_sequence = b.call_sequence AND i.copy_number = b.copy_number
     JOIN catalogue c ON c.catalogue_key = i.catalogue_key
     JOIN marc m ON m.marc = c.marc AND m.tag_number = 245
     JOIN policy bpl ON bpl.policy_type::text = 'LIBR'::text AND bpl.policy_number = bp.library
     JOIN policy br ON br.policy_type::text = 'BRSN'::text AND br.policy_number = b.reason
     JOIN policy pt ON pt.policy_type::text = 'PTYP'::text AND pt.policy_number = bp.payment_type
     JOIN policy it ON it.policy_type::text = 'ITYP'::text AND it.policy_number = i.type
  WHERE bp.payment_date >= '2016-06-07'::date;
