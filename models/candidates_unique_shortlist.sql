WITH is_shortlist AS (
    SELECT
      user_id AS user_id,
     1 AS is_shortlist1
FROM `jobteaser-397609.jobteaser.candidate_schools_launched`
)
,
is_shortlist_2 AS (
  SELECT
    user_id AS user_id,
    CASE
        WHEN SUM(is_shortlist1) > 0 THEN 1
        ELSE 0
    END  AS is_shortlist2
FROM is_shortlist
GROUP BY user_id
)

SELECT
  user_id as user_id,
  CASE
    WHEN is_shortlist2 = 0 then 0
    ELSE 1
  END as in_shortlist
FROM is_shortlist_2 AS shortlist_binary
GROUP BY user_id, is_shortlist2
