

----Himani 

---1. Customer Churn : Analyzing the customers churn based on their age, 
---viewing pattern(content they preferred watching),
---demographics, age on Netflix and the plans they were subscribed to. 

Select 
CONCAT(FName, ' ' , LName) as Name,
TIMESTAMPDIFF(YEAR, BDATE, CURRENT_TIMESTAMP()) AS AGE,
Country, 
Runtime, 
Genre, 
TIMESTAMPDIFF(MONTH, StartDate, EndDate) AS AGE_on_Netflix, 
Status, 
PlanName, 
ContentAccess
from Customers 
natural join Profiles 
natural join ViewingHistory 
natural join Content CT 
natural join Subscribes 
natural join Plans Pl 
where Status = 'Inactive';


----Anubhav

---2. Content Preference Analysis

SELECT
  c.GENDER,
  TIMESTAMPDIFF(YEAR, c.BDATE, CURDATE()) AS Age,
  cl.Language,
  c.COUNTRY,
  co.Genre,
  co.Category,
  COUNT(DISTINCT v.ContentID) AS ContentID,
  COUNT(v.LastWatchedDate) AS NumViews
FROM customers c JOIN profiles p ON c.CustID = p.CustID JOIN customerslanguagepreferred cl ON c.CustID = cl.CustID JOIN viewinghistory v ON p.ProfileID = v.ProfileID JOIN content co ON v.ContentID = co.ContentID
GROUP BY
  c.GENDER,
  Age,
  cl.Language,
  c.COUNTRY,
  co.Genre,
  co.Category
  ORDER BY NumViews DESC;

----Mehak

---3. Optimizing Revenue through Subscription Plans

SELECT 
s.PlanID, 
p.PlanName, 
COUNT(s.CustID) AS SubscriberCount, 
p.MonthlyPrice AS MonthlyRate,
p.MonthlyPrice * COUNT(s.CustID) AS MonthlyRevenue
FROM plans as p
JOIN subscribes as s ON p.PlanID = s.PlanID
WHERE s.Status = 'Active'
GROUP BY s.PlanID, p.PlanName
ORDER BY MonthlyRevenue DESC;



----Claire

---4. Customers average runtime based on movie genres

select 
Genre, 
avg(runtime) as 'Average Runtime' 
from Subscribes 
natural join Content
natural join ViewingHistory
natural join Customers
group by Genre;



----------------------------------------------