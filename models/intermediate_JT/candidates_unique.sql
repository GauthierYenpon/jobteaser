select
    res.user_id,
    res.has_resume,
    IF(sh.in_shortlist IS NULL,0,1) AS in_shortlist,
    ac.is_active,
    IF(ia.is_interested IS NULL,0,1) AS is_interested,
    IF(ia.is_approved IS NULL,0,1) AS is_approved
from {{ ref("candidates_unique_resume") }} as res
left join
    {{ ref("candidates_unique_shortlist") }} as sh
    on res.user_id = sh.user_id
left join
    {{ ref("candidates_unique_active") }} as ac
    on res.user_id = ac.user_id
left join
    {{ ref("candidates_unique_interest_approved") }} as ia
    on res.user_id = ia.user_id
