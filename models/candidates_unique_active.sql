WITH
is_activity AS (
    SELECT
      user_id AS user_id
      , CASE WHEN active=false THEN 0 ELSE 1 END AS is_activity1
FROM `jobteaser-397609.jobteaser.optin_schools_launched`
)
,

is_activity_2 AS (
  SELECT
    user_id AS user_id,
  CASE
    WHEN SUM(is_activity1) > 0 THEN 1
    ELSE 0
    END  AS is_activity2
FROM is_activity
GROUP BY user_id
)


SELECT
  user_id as user_id,
  CASE
    WHEN is_activity2 = 0 then 0
    ELSE 1
  END as is_active
FROM is_activity_2 AS active_binary
GROUP BY user_id, is_activity2
