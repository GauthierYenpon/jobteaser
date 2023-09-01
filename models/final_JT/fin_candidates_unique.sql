select
    res.user_id,
    res.has_resume,
    ac.is_active,
    CASE
     WHEN sh.in_shortlist IS NULL THEN 0
     WHEN sh.in_shortlist = 1 THEN 1
     WHEN sh.in_shortlist=0 THEN 0
    END AS in_shortlist,

     CASE
      WHEN ia.is_interested IS NULL THEN 0
      WHEN ia.is_interested = 1 THEN 1
      WHEN ia.is_interested=0 THEN 0
     END AS is_interested,
    
     CASE
      WHEN ia.is_approved IS NULL THEN 0
      WHEN ia.is_approved = 1 THEN 1
      WHEN ia.is_approved=0 THEN 0
     END AS is_approved,
    co.jt_country,
    ty.jt_school_type
    
from {{ ref("candidates_unique_resume") }} as res

left join
    {{ ref("candidates_unique_active") }} as ac
    on res.user_id = ac.user_id
left join
    {{ ref("candidates_unique_shortlist") }} as sh
    on res.user_id = sh.user_id
left join
    {{ ref("candidates_unique_interest_approved") }} as ia
    on res.user_id = ia.user_id
left join
    {{ ref("candidates_unique_country") }} as co
    on res.user_id = co.user_id
left join
    {{ ref("candidates_unique_type") }} as ty
    on res.user_id = ty.user_id
