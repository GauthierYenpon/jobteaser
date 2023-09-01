/*with
    cv_uploaded as (
        select
            user_id as user_id,
            case when resume_uploaded = false then 0 else 1 end as cv_uploaded1
        from `jobteaser-397609.jobteaser.optin_schools_launched`
    ),
    cv_uploaded_2 as (
        select
            user_id as user_id,
            case when sum(cv_uploaded1) > 0 then 1 else 0 end as cv_uploaded2
        from cv_uploaded
        group by user_id
    )
select user_id as user_id, case when cv_uploaded2 = 0 then 0 else 1 end as has_resume
from cv_uploaded_2 as resume_binary
group by user_id, cv_uploaded2 */ 

   ----------- 

with
    is_active as (
        select
            user_id as user_id,
            case when active = false then 0 else 1 end as is_active1
        from `jobteaser-397609.jobteaser.optin_schools_launched`
    ),
    is_active_2 as (
        select
            user_id as user_id,
            case when sum(is_active1) > 0 then 1 else 0 end as is_active2
        from is_active
        group by user_id
    )
select user_id as user_id, case when is_active2 = 0 then 0 else 1 end as active_or_not
from is_active_2 as active_binary
group by user_id, is_active2