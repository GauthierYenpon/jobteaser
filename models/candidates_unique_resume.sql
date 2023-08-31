WITH

cv_uploaded AS (
    SELECT
      user_id AS user_id
      , CASE WHEN resume_uploaded=false THEN 0 ELSE 1 END AS cv_uploaded1
FROM `jobteaser-397609.jobteaser.optin_schools_launched`
)
,

cv_uploaded_2 AS (
  SELECT
    user_id AS user_id,
  CASE
    WHEN SUM(cv_uploaded1) > 0 THEN 1
    ELSE 0
    END  AS cv_uploaded2
FROM cv_uploaded
GROUP BY user_id
)


SELECT
  user_id as user_id,
  CASE
    WHEN cv_uploaded2 = 0 then 0
    ELSE 1
  END as has_resume,
FROM cv_uploaded_2 AS resume_binary
GROUP BY user_id, cv_uploaded2
