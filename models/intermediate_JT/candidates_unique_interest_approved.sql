WITH
is_interest AS (
    SELECT
      user_id AS user_id,
      CASE WHEN status_update="interested" THEN 1 ELSE 0 END AS is_interest1,
      CASE WHEN status_update="approved" THEN 1 ELSE 0 END AS is_approved1,
FROM jobteaser-397609.jobteaser.candidate_schools_launched
)
,

is_interest_2 AS (
  SELECT
    user_id AS user_id,
    CASE
        WHEN SUM(is_interest1) > 0 THEN 1
        ELSE 0
    END  AS is_interest2,
    CASE
        WHEN SUM(is_approved1) > 0 THEN 1
        ELSE 0
    END  AS is_approved2,
FROM is_interest
GROUP BY user_id
)


SELECT
  user_id as user_id,
  CASE
    WHEN is_interest2 = 0 then 0
    ELSE 1
  END as is_interested,
   CASE
    WHEN is_approved2 = 0 then 0
    ELSE 1
  END as is_approved,
FROM is_interest_2 AS interest_approved_binary
GROUP BY user_id, is_interest2, is_approved2
