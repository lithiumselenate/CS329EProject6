with p1 as (
    select * except(o_net_code_combo, o_net_title_combo),
if(o_net_code_combo is not null, split(o_net_code_combo,';'),null) as o_net_codes,
if(o_net_title_combo is not null, split(o_net_title_combo,';'),null) as o_net_titles,
from {{ ref('pw_disclosure') }}
),
p2 as (select * except(employer_address_1, employer_address_2, employer_city, employer_state, employer_province, employer_postal_code, employer_country),
case
    when employer_poc_address1 = employer_address_1 then null
    else employer_address_1
end as employer_address_1,

case
    when employer_poc_address2 = employer_address_2 then null
    else employer_address_2
end as employer_address_2,

case
    when employer_poc_city = employer_city then null
    else employer_city
end as employer_city,

case
    when employer_poc_state = employer_state then null
    else employer_state
end as employer_state,

case
    when employer_poc_province = employer_province then null
    else employer_province
end as employer_province,

case
    when employer_poc_postal_code = employer_postal_code then null
    else employer_postal_code
end as employer_postal_code,

case
    when employer_poc_country = employer_country then null
    else employer_country
end as employer_country
from p1
)
select * from p2