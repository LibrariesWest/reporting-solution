---------------------------------------------------------------
-- table: users.  load data
---------------------------------------------------------------

truncate users;
copy users from 'c:\dbdata\symphony\user.txt' delimiter '|';

-- pop in the postcode trim field
alter table users add column postcode_trim character varying(8);
update users u
set postcode_trim = (
select
    case
        when u.mailing_address = 1 then ( select upper(replace(left(userxinfo.entry, 8), ' ', '')) from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
        when u.mailing_address = 2 then ( select upper(replace(left(userxinfo.entry, 8), ' ', '')) from userxinfo where userxinfo."offset" = u.address_offset_2 and userxinfo.entry_number = 9036 limit 1)
        when u.mailing_address = 3 then ( select upper(replace(left(userxinfo.entry, 8), ' ', '')) from userxinfo where userxinfo."offset" = u.address_offset_3 and userxinfo.entry_number = 9036 limit 1)
        else null
    end
);