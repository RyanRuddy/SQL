/*** Write a query that shows the total number of unicorn companies, 
     total value of those companies, # of operating days, total cities on the crime index,
     how many days those unicorns have been operating, and the educational expenditure by year
***/
WITH val AS
(SELECT
    country_id,
    country_of_origin,
    COUNT(DISTINCT(company_name)) AS total_unicorns,
    SUM(valuation_in_billions) AS total_unicorn_value,
    SUM(current_date - coalesce(date_joined)) as total_days_of_unicorn_ops
 FROM unicorns
 GROUP BY 1,2
),

crime AS
(SELECT
    country_id,
    COUNT(DISTINCT(city)) AS total_cities_crime_tracking
 FROM crime_index
 GROUP BY 1
),

educ AS
(
SELECT 
    country_id,
    SUM(government_expenditure_on_education) AS total_edu_exp
FROM  edu_exp
GROUP BY 1
)

SELECT 
   v.country_id,
   v.country_of_origin,
   v.total_unicorns,
   v.total_unicorn_value,
   v.total_days_of_unicorn_ops,
   c.total_cities_crime_tracking,
   round(CAST(SUM(total_edu_exp) AS numeric),2) AS total_edu_exp
FROM val v
JOIN crime c ON v.country_id = c.country_id
JOIN educ e ON c.country_id = e.country_id
GROUP BY 1,2,3,4,5,6
ORDER BY v.country_id asc