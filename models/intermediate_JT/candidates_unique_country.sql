WITH country AS
(
  select  cu.user_id, opt.jt_country
from `jobteaser-397609`.`dbt_intermediate`.`candidates_unique` as cu
left join `jobteaser-397609`.`dbt_final`.`optin_schools_launched` as opt
ON cu.user_id=opt.user_id
)

SELECT DISTINCT *
FROM country
