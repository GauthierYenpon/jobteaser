SELECT

    opt.user_id,
    opt.receive_time,
    opt.cause,
    cu.is_active,
    opt.school_id,
    opt.current_sign_in_at,
    cu.has_resume,
    cu.in_shortlist,
    cu.is_interested,
    cu.is_approved,
    opt.is_cc,
    opt.jt_country,
    opt.jt_intranet_status,
    opt.jt_school_type

FROM jobteaser-397609.jobteaser.optin_schools_launched AS opt

left join {{ ref("fin_candidates_unique") }} as cu
ON opt.user_id = cu.user_id